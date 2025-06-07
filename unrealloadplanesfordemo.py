import unreal
import os

def import_and_place_fbx_files_with_subdirs():
    """
    Imports all FBX files from a specified directory for modern UE5 versions, 
    preserving the subdirectory structure. This prevents texture/material name 
    conflicts. It then places the imported assets in a grid in the current level.
    """
    # --- Configuration ---
    base_fbx_folder = r"C:\Users\domin\Documents\TruthTracks\Planes"
    base_content_path = "/Game/ImportedPlanes/"
    spacing = 5000.0  # 50 meters in Unreal Units
    initial_height = 5000.0 # 50 meters above the origin
    items_per_row = 20 # Number of assets in each row of the grid

    # --- Get necessary Unreal subsystems ---
    asset_tools = unreal.AssetToolsHelpers.get_asset_tools()

    # --- Find all FBX files ---
    fbx_files_to_import = []
    for root, dirs, files in os.walk(base_fbx_folder):
        for file in files:
            if file.endswith(".fbx"):
                fbx_files_to_import.append(os.path.join(root, file))

    if not fbx_files_to_import:
        unreal.log_error(f"No FBX files found in '{base_fbx_folder}'.")
        return

    # --- Import and place each FBX ---
    imported_assets = []
    with unreal.ScopedSlowTask(len(fbx_files_to_import), "Importing FBX Files...") as slow_task:
        slow_task.make_dialog(True)

        for fbx_path in fbx_files_to_import:
            if slow_task.should_cancel():
                break
            slow_task.enter_progress_frame(1, f"Importing {os.path.basename(fbx_path)}")

            relative_path = os.path.relpath(os.path.dirname(fbx_path), base_fbx_folder)
            if relative_path == '.':
                destination_path = base_content_path
            else:
                destination_path = os.path.join(base_content_path, relative_path).replace("\\", "/")

            task = unreal.AssetImportTask()
            task.filename = fbx_path
            task.destination_path = destination_path
            task.automated = True
            task.replace_existing = True
            task.save = True 

            import_options = unreal.FbxImportUI()
            import_options.import_mesh = True
            import_options.import_materials = True
            import_options.import_textures = True

            # The 'import_as_static_mesh' flag is no longer needed.
            # The engine knows to import a static mesh because we are providing
            # settings to the 'static_mesh_import_data' object below.
            
            import_options.static_mesh_import_data.import_translation = unreal.Vector(0.0, 0.0, 0.0)
            import_options.static_mesh_import_data.import_rotation = unreal.Rotator(0.0, 0.0, 180.0)
            import_options.static_mesh_import_data.import_uniform_scale = 1.0

            task.options = import_options
            asset_tools.import_asset_tasks([task])

            asset_name = os.path.splitext(os.path.basename(fbx_path))[0]
            asset_path = f"{destination_path}/{asset_name}"
            imported_asset = unreal.EditorAssetLibrary.find_asset_data(asset_path).get_asset()

            if imported_asset:
                imported_assets.append(imported_asset)
            else:
                unreal.log_warning(f"Could not find imported asset at path: {asset_path}")

    # --- Place imported assets in a grid ---
    for i, asset in enumerate(imported_assets):
        row = i // items_per_row
        col = i % items_per_row

        location = unreal.Vector(col * spacing, row * spacing, initial_height)
        rotation = unreal.Rotator(0.0, 0.0, 0.0)

        unreal.EditorLevelLibrary.spawn_actor_from_object(asset, location, rotation)

    unreal.log(f"Successfully imported and placed {len(imported_assets)} assets.")

# --- Run the script ---
import_and_place_fbx_files_with_subdirs()