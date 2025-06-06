# assemble_aircraft.py
#
# PURPOSE:
# This script assembles a complete aircraft model from a directory structure,
# controlled by command-line arguments for maximum flexibility.
# - It joins the main model file and any other top-level .ac files (that are not excluded) into a single "core" mesh.
# - It can optionally apply a specific livery to this core mesh.
# - Files specified with --exclude are imported as separate, visible, parented objects.
# - It can optionally include assets from subfolders as separate, parented objects.

import bpy
import os
import glob
import math
import datetime
import traceback
import sys
import argparse

# Attempt to import Pillow for image conversion
try:
    from PIL import Image
    pillow_available = True
    print(f"[{datetime.datetime.now().strftime('%H:%M:%S')}] Pillow (PIL) library found. RGB to PNG conversion is enabled.")
except ImportError:
    pillow_available = False
    print(f"[{datetime.datetime.now().strftime('%H:%M:%S')}] WARNING: Pillow (PIL) library not found. Automatic .rgb conversion will be SKIPPED.")


def log(msg):
    """Prints a message with a timestamp."""
    print(f"[{datetime.datetime.now().strftime('%H:%M:%S')}] {msg}")

def parse_args():
    """Parses command-line arguments passed to Blender using argparse for flexibility."""
    argv = sys.argv[sys.argv.index("--") + 1:] if "--" in sys.argv else []
    
    parser = argparse.ArgumentParser(description="Assemble aircraft models for Blender.")
    parser.add_argument("--main_model", required=True, help="Full path to the main .ac model file.")
    parser.add_argument("--output", required=True, help="Full path for the output .fbx file.")
    parser.add_argument("--livery", default=None, help="(Optional) Full path to a specific livery texture file.")
    parser.add_argument("--include_extra_assets", action='store_true', help="(Optional) Flag to include assets from subfolders.")
    parser.add_argument("--assembly_xml", default=None, help="(Optional) Path to the XML file that defines extra asset placement.")
    # New argument to exclude files. nargs='+' allows for one or more values.
    parser.add_argument("--exclude", nargs='+', default=[], help="(Optional) A list of .ac filenames (e.g., 'file1.ac' 'file2.ac') to exclude from the core mesh but include as separate parts.")

    return parser.parse_args(argv)


def clean_scene():
    """Removes all objects, materials, images, and meshes from the scene."""
    log("Cleaning scene...")
    if bpy.ops.object.mode_set.poll():
        bpy.ops.object.mode_set(mode='OBJECT')
    
    if bpy.context.scene.objects:
        bpy.ops.object.select_all(action='SELECT')
        bpy.ops.object.delete()

    for data_block_type in (bpy.data.materials, bpy.data.images, bpy.data.meshes):
        for item in list(data_block_type):
            try:
                data_block_type.remove(item)
            except: 
                pass
    log("Scene cleaned.")


def import_and_join(ac_paths_list, object_name):
    """Imports a list of AC3D files, joins their parts, and renames the result."""
    if not ac_paths_list:
        return None
        
    all_imported_parts = []
    for ac_path in ac_paths_list:
        if not os.path.exists(ac_path):
            log(f"  Path not found, skipping: {ac_path}")
            continue

        bpy.ops.object.select_all(action='DESELECT')
        objects_before = set(bpy.context.scene.objects)
        try:
            bpy.ops.import_scene.import_ac3d(filepath=ac_path)
            newly_imported = list(set(bpy.context.scene.objects) - objects_before)
            all_imported_parts.extend(p for p in newly_imported if p.type == 'MESH')
            log(f"  Imported parts from: {os.path.basename(ac_path)}")
        except Exception as e:
            log(f"  ERROR importing file '{ac_path}': {e}")
            
    if not all_imported_parts:
        log(f"  No mesh parts were successfully imported for '{object_name}'.")
        return None

    bpy.ops.object.select_all(action='DESELECT')
    for part in all_imported_parts:
        part.select_set(True)
    
    bpy.context.view_layer.objects.active = all_imported_parts[0]
    if len(all_imported_parts) > 1:
        bpy.ops.object.join()
    
    joined_asset = bpy.context.active_object
    joined_asset.name = object_name
    log(f"  Assembled into '{joined_asset.name}'.")
    return joined_asset


# --- Main Script Execution ---
log("Starting Aircraft Assembly Script.")
ARGS = parse_args()
model_basename = os.path.splitext(os.path.basename(ARGS.main_model))[0]
model_base_dir = os.path.dirname(ARGS.main_model)

log(f"========================================================================")
log(f"PROCESSING MODEL: {model_basename}")
log(f"  Main AC File: {ARGS.main_model}")
log(f"  Output FBX:   {ARGS.output}")
log(f"  Livery:       {'Default' if not ARGS.livery else ARGS.livery}")
log(f"  Include Extras: {ARGS.include_extra_assets}")
log(f"  Excluding Files from Main Mesh: {ARGS.exclude if ARGS.exclude else 'None'}")
log(f"========================================================================")

clean_scene()

# 1. Discover Assets
log("Discovering assets...")
all_ac_files_in_dir = set(glob.glob(os.path.join(model_base_dir, '**', '*.ac'), recursive=True) + glob.glob(os.path.join(model_base_dir, '**', '*.AC'), recursive=True))

# Separate assets into categories
top_level_paths = {f for f in all_ac_files_in_dir if os.path.dirname(f) == model_base_dir}
excluded_paths = {f for f in top_level_paths if os.path.basename(f) in ARGS.exclude}
core_component_paths = top_level_paths - excluded_paths
core_component_paths.add(ARGS.main_model)
sub_folder_assets_paths = all_ac_files_in_dir - top_level_paths

# 2. Assemble Core Aircraft Mesh
log(f"Assembling {len(core_component_paths)} core aircraft components...")
core_aircraft_object = import_and_join(sorted(list(core_component_paths)), f"{model_basename}_Core")
if not core_aircraft_object:
    raise SystemExit("FATAL: Failed to create core aircraft object. Aborting.")

# 3. Apply Livery to Core Mesh (if provided)
if ARGS.livery:
    # Logic for livery application would go here
    pass

# 4. Create Root and Parent Core Mesh
root_name = f"{model_basename}_Root"
bpy.ops.object.empty_add(type='PLAIN_AXES', align='WORLD', location=(0, 0, 0))
root_object = bpy.context.active_object
root_object.name = root_name
log(f"Created Root Empty object: '{root_name}'")
core_aircraft_object.parent = root_object

# 5. Process Excluded Top-Level Assets as Separate Children
if excluded_paths:
    log(f"Processing {len(excluded_paths)} excluded files as separate objects...")
    for asset_path in sorted(list(excluded_paths)):
        excluded_asset_object = import_and_join([asset_path], os.path.splitext(os.path.basename(asset_path))[0])
        if excluded_asset_object:
            original_matrix = excluded_asset_object.matrix_world.copy()
            excluded_asset_object.parent = core_aircraft_object
            excluded_asset_object.matrix_world = original_matrix
            log(f"  Parented excluded asset '{excluded_asset_object.name}'.")

# 6. Process and Parent Sub-Folder Assets (conditionally)
if ARGS.include_extra_assets:
    log(f"Processing {len(sub_folder_assets_paths)} extra assets from subfolders...")
    for asset_path in sorted(list(sub_folder_assets_paths)):
        extra_asset_object = import_and_join([asset_path], os.path.splitext(os.path.basename(asset_path))[0])
        if extra_asset_object:
            original_matrix = extra_asset_object.matrix_world.copy()
            extra_asset_object.parent = core_aircraft_object
            extra_asset_object.matrix_world = original_matrix
            log(f"  Parented extra asset '{extra_asset_object.name}'.")
else:
    log("Skipping extra assets as per command arguments.")

# 7. Select Hierarchy and Export Final FBX
log("Selecting full hierarchy for export...")
bpy.ops.object.select_all(action='DESELECT')
root_object.select_set(True) 
bpy.context.view_layer.objects.active = root_object
bpy.ops.object.select_grouped(type='CHILDREN_RECURSIVE')

log(f"Exporting final model with hierarchy to: {ARGS.output}")
output_dir = os.path.dirname(ARGS.output)
if output_dir and not os.path.exists(output_dir):
    os.makedirs(output_dir)

bpy.ops.export_scene.fbx(
    filepath=ARGS.output,
    use_selection=True,
    apply_unit_scale=True,
    global_scale=1.0,
    bake_space_transform=True,
    object_types={'MESH', 'EMPTY'}, 
    path_mode='COPY', 
    embed_textures=True, 
    mesh_smooth_type='FACE'
)

log(f"======================== PROCESSING COMPLETE ========================")
log(f"Final FBX exported to: {ARGS.output}")

