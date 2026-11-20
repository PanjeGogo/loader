#!/usr/bin/env python3
"""Merge TFFA_update_v3 Lua scripts into a converted Roblox XML place."""
from __future__ import annotations

import pathlib
import sys
import zipfile
import xml.etree.ElementTree as ET

ZIP_PATH = pathlib.Path("TFFA_update_v3.zip")
XML_PATH = pathlib.Path("base.rbxlx")
OUT_PATH = pathlib.Path("merged.rbxlx")
REPORT_PATH = pathlib.Path("merge-report.txt")

def prop(item: ET.Element, name: str):
    props = item.find("Properties")
    if props is None:
        return None
    for node in props:
        if node.get("name") == name:
            return node
    return None

def instance_name(item: ET.Element) -> str | None:
    node = prop(item, "Name")
    return node.text if node is not None else None

def children(item: ET.Element):
    return [c for c in item if c.tag == "Item"]

def find_child(parent: ET.Element, name: str):
    for child in children(parent):
        if instance_name(child) == name:
            return child
    return None

def new_instance(class_name: str, name: str, referent: str) -> ET.Element:
    item = ET.Element("Item", {"class": class_name, "referent": referent})
    props = ET.SubElement(item, "Properties")
    ET.SubElement(props, "string", {"name": "Name"}).text = name
    return item

def ensure_source(item: ET.Element, source: str):
    props = item.find("Properties")
    if props is None:
        props = ET.Element("Properties")
        item.insert(0, props)
    node = prop(item, "Source")
    if node is None:
        node = ET.SubElement(props, "ProtectedString", {"name": "Source"})
    else:
        node.tag = "ProtectedString"
    node.text = source

def script_class(filename: str) -> str:
    if filename.endswith(".server.lua"):
        return "Script"
    if filename.endswith(".client.lua"):
        return "LocalScript"
    return "ModuleScript"

def instance_filename(filename: str) -> str:
    for suffix in (".server.lua", ".client.lua", ".lua"):
        if filename.endswith(suffix):
            return filename[:-len(suffix)]
    raise ValueError(f"Unsupported script filename: {filename}")

def main():
    if not ZIP_PATH.exists() or not XML_PATH.exists():
        raise SystemExit("Missing TFFA_update_v3.zip or converted base.rbxlx")

    tree = ET.parse(XML_PATH)
    root = tree.getroot()
    # Place files converted to RBXLX have service Items directly under
    # the <roblox> root; they do not contain a DataModel Item. Model files
    # may contain a DataModel, so support both layouts.
    datamodel = next(
        (n for n in root.iter("Item") if n.get("class") == "DataModel"),
        None,
    )
    if datamodel is None:
        if root.tag != "roblox":
            raise SystemExit(f"Unexpected RBXLX root element: {root.tag!r}")
        datamodel = root

    report = []
    added = updated = 0
    with zipfile.ZipFile(ZIP_PATH) as archive:
        script_entries = [
            n for n in archive.namelist()
            if n.startswith("TFFA_update_v3/") and n.endswith(".lua")
        ]
        if not script_entries:
            raise SystemExit("No Lua scripts found inside TFFA_update_v3.zip")

        for entry in sorted(script_entries):
            relative = pathlib.PurePosixPath(entry).relative_to("TFFA_update_v3")
            parts = list(relative.parts)
            filename = parts.pop()
            name = instance_filename(filename)
            source = archive.read(entry).decode("utf-8-sig")
            parent = datamodel

            # Resolve services/folders by their exact instance names.
            for folder_name in parts:
                node = find_child(parent, folder_name)
                if node is None:
                    if parent is datamodel:
                        raise SystemExit(f"Required service not found in place: {folder_name} ({entry})")
                    node = new_instance("Folder", folder_name, f"RBX_TFFA_FOLDER_{added}_{updated}_{len(report)}")
                    parent.append(node)
                    report.append(f"CREATED FOLDER: {'/'.join(parts)}")
                parent = node

            existing = find_child(parent, name)
            if existing is not None and existing.get("class") in ("Script", "LocalScript", "ModuleScript"):
                ensure_source(existing, source)
                updated += 1
                report.append(f"UPDATED: {relative.as_posix()} [{existing.get('class')}]")
            else:
                item = new_instance(script_class(filename), name, f"RBX_TFFA_SCRIPT_{added}_{updated}_{len(report)}")
                ensure_source(item, source)
                parent.append(item)
                added += 1
                report.append(f"ADDED: {relative.as_posix()} [{item.get('class')}]")

    ET.indent(tree, space="  ")
    tree.write(OUT_PATH, encoding="utf-8", xml_declaration=True)
    REPORT_PATH.write_text(
        "TFFA UPDATE V3 MERGE REPORT\n"
        f"Scripts found in ZIP: {len(script_entries)}\n"
        f"Existing scripts updated: {updated}\n"
        f"New scripts added: {added}\n\n" + "\n".join(report) + "\n",
        encoding="utf-8"
    )
    print(REPORT_PATH.read_text(encoding="utf-8"))
    print(f"OUTPUT: {OUT_PATH} ({OUT_PATH.stat().st_size} bytes)")

if __name__ == "__main__":
    main()
