#!/usr/bin/env python3
from pathlib import Path
import re, zipfile, xml.etree.ElementTree as ET

def get_prop(item, key):
    p=item.find("Properties")
    if p is None: return None
    for x in p:
        if x.get("name")==key: return x.text or ""
    return None

def children(item):
    return [x for x in item if x.tag=="Item"]

def walk(item, path=""):
    name=get_prop(item,"Name") or "<unnamed>"
    here=f"{path}/{name}" if path else name
    yield item,here
    for c in children(item):
        yield from walk(c,here)

root=ET.parse("base.rbxlx").getroot()
lines=["TFFA V3 SOURCE AUDIT",""]
lines.append("=== PLACE INSTANCES MATCHING FOOD / BAIT / ZONE / AREA / REGION / WORLD ===")
keywords=re.compile(r"food|bait|feed|snack|fruit|berry|meat|fish|zone|area|region|world|island|map|place",re.I)
matches=[]
for item,path in walk(root):
    name=get_prop(item,"Name") or ""
    cls=item.get("class","")
    if keywords.search(name) or (cls in ("Decal","Texture","MeshPart","Part","Model") and keywords.search(path)):
        props=item.find("Properties")
        assets=[]
        if props is not None:
            for p in props:
                if p.get("name") in ("Texture","TextureID","MeshId","MeshID","Image","TextureId","ColorMap","NormalMap","RoughnessMap"):
                    if p.text: assets.append(f"{p.get('name')}={p.text}")
        matches.append(f"{path} [{cls}]"+(" | "+"; ".join(assets) if assets else ""))
lines += matches
lines += ["",f"Matched instances: {len(matches)}",""]
lines.append("=== WORKSPACE TOP-LEVEL CHILDREN ===")
workspace=next((x for x,p in walk(root) if get_prop(x,"Name")=="Workspace"),None)
if workspace is not None:
    for x in children(workspace):
        lines.append(f"{get_prop(x,'Name')} [{x.get('class')}]")
lines += ["","=== UPDATE ZIP FILES ==="]
with zipfile.ZipFile("TFFA_update_v3.zip") as z:
    for n in z.namelist():
        lines.append(n)
    lines += ["","=== UPDATE LUA MATCHES: FOOD / BAIT / ZONE / ASSET / POKEBALL ==="]
    for n in z.namelist():
        if n.endswith(".lua"):
            data=z.read(n).decode("utf-8-sig",errors="replace")
            for i,line in enumerate(data.splitlines(),1):
                if re.search(r"food|bait|feed|zone|area|region|world|asset|rbxassetid|textureid|meshid|image",line,re.I):
                    lines.append(f"{n}:{i}: {line.strip()[:300]}")

# Structured inventory: count top-level food models and biome/zone containers.
def find_path(root_item, wanted):
    for node, path in walk(root_item):
        if path.split("/")[-1] == wanted:
            return node
    return None

def direct_inventory(parent, label):
    lines.append("")
    lines.append(f"=== {label} ===")
    if parent is None:
        lines.append("NOT FOUND")
        return
    for node in children(parent):
        nm=get_prop(node,"Name") or "<unnamed>"
        lines.append(f"{nm} [{node.get('class')}]")

replicated=find_path(root,"ReplicatedStorage")
workspace=find_path(root,"Workspace")
food_folder=find_path(root,"Food") if replicated is None else next((x for x in children(replicated) if get_prop(x,"Name")=="Food"),None)
biomes_folder=next((x for x in children(workspace) if get_prop(x,"Name")=="Biomes"),None) if workspace is not None else None
direct_inventory(food_folder,"FOOD MODEL INVENTORY (DIRECT CHILDREN)")
direct_inventory(biomes_folder,"BIOME / ZONE INVENTORY (DIRECT CHILDREN)")

# Extract Lua source from in-place ModuleScripts to identify zone keys/references.
lines += ["","=== CONFIG / ZONE SCRIPT SOURCES ==="]
for node,path in walk(root):
    nm=get_prop(node,"Name") or ""
    if node.get("class") in ("ModuleScript","Script","LocalScript") and re.search(r"config|zone|area|biome|world|food",nm,re.I):
        props=node.find("Properties")
        src=""
        if props is not None:
            for p in props:
                if p.get("name")=="Source":
                    src=p.text or ""
                    break
        if src:
            lines.append(f"--- {path} ---")
            for i,line in enumerate(src.splitlines(),1):
                if re.search(r"zone|area|biome|world|food|price|rarity|unlock|spawn|teleport",line,re.I):
                    lines.append(f"{i}: {line.strip()[:400]}")


# Full source for the key area/food modules, so names and lookup behavior are auditable.
lines += ["","=== FULL AREA / FOOD MODULE SOURCE ==="]
for node,path in walk(root):
    nm=get_prop(node,"Name") or ""
    if node.get("class") == "ModuleScript" and nm in ("AreasConfig","AreaUtil","FoodsConfig","FoodsData"):
        props=node.find("Properties")
        if props is not None:
            for p in props:
                if p.get("name") == "Source":
                    lines.append(f"--- {path} ---")
                    lines.extend((p.text or "").splitlines())
                    break

Path("source-audit.txt").write_text("\n".join(lines)+"\n",encoding="utf-8")
print("\n".join(lines))
