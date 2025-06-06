
# --- Master Aircraft Processing Script ---
# This script will process multiple aircraft directories, creating output folders,
# metadata files, and final .FBX 3D models for each.

# --- Base Paths ---
$blenderPath = "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe"
$pythonScript = "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py"
$flightGearDataDir = "C:\Users\domin\Documents\FlightGearData"
$outputDirBase = "C:\Users\domin\Documents\TruthTracks\Planes"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: 14bis
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 14bis ---"

# --- 1. Create Directory and metadata.json for 14bis ---
$outputDir_14bis = Join-Path $outputDirBase "14bis"
New-Item -Path $outputDir_14bis -ItemType Directory -Force | Out-Null

$jsonContent_14bis = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 20,
  "CruisingAltitude": 50,
  "MaxAirspeed": 22
}
"@
$jsonContent_14bis | Set-Content -Path (Join-Path $outputDir_14bis "metadata.json")

# --- 2. Generate .FBX for 14bis ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\14bis\Models\14bis.ac" --output "$outputDir_14bis\14bis.fbx" --livery "$flightGearDataDir\14bis\Models\texture.png"

#--------------------------------------------------------------------------------#
#                           AIRCRAFT: 21 (Demoiselle)
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 21 (Demoiselle) ---"

# --- 1. Create Directory and metadata.json for 21 ---
$outputDir_21 = Join-Path $outputDirBase "21"
New-Item -Path $outputDir_21 -ItemType Directory -Force | Out-Null

$jsonContent_21 = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 45,
  "CruisingAltitude": 200,
  "MaxAirspeed": 50
}
"@
$jsonContent_21 | Set-Content -Path (Join-Path $outputDir_21 "metadata.json")

# --- 2. Generate .FBX for 21 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\21\Models\21.ac" --output "$outputDir_21\21.fbx" --livery "$flightGearDataDir\21\Models\texture.png"


#--------------------------------------------------------------------------------#
#                               SKIPPED: 4cv (Car)
#--------------------------------------------------------------------------------#

# The '4cv' directory appears to contain a car model (Renault 4CV), not an aircraft.
# It is being skipped by this aircraft processing pipeline.
Write-Host "--- Skipping Entry: 4cv (Not an aircraft) ---"


#--------------------------------------------------------------------------------#
#                           AIRCRAFT: 707 (and variants)
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 707 (and variants) ---"

# --- 1. Create Directory and metadata.json for 707 ---
# A single folder and JSON will be created for all 707 variants.
# The metadata is for the standard civilian Boeing 707.
$outputDir_707 = Join-Path $outputDirBase "707"
New-Item -Path $outputDir_707 -ItemType Directory -Force | Out-Null

$jsonContent_707 = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 480,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 540
}
"@
$jsonContent_707 | Set-Content -Path (Join-Path $outputDir_707 "metadata.json")

# --- 2. Generate .FBX for each 707 variant ---
# Note: Other aircraft models and ground equipment in the same folder are excluded for each run.

Write-Host "  - Processing variant: 707 (Base)"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\707\Models\707.ac" --output "$outputDir_707\707.fbx" --livery "$flightGearDataDir\707\Models\707.png" --exclude "wheels.ac" "707-pax.ac" "707-TT.ac" "EC-137.ac" "fuel-truck.ac" "stairs.ac" "loader.ac" "container.ac" "bellyLoader.ac" "epu.ac"

Write-Host "  - Processing variant: 707-pax"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\707\Models\707-pax.ac" --output "$outputDir_707\707-pax.fbx" --livery "$flightGearDataDir\707\Models\707.png" --exclude "wheels.ac" "707.ac" "707-TT.ac" "EC-137.ac" "fuel-truck.ac" "stairs.ac" "loader.ac" "container.ac" "bellyLoader.ac" "epu.ac"

Write-Host "  - Processing variant: 707-TT"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\707\Models\707-TT.ac" --output "$outputDir_707\707-TT.fbx" --livery "$flightGearDataDir\707\Models\707TT.png" --exclude "wheels.ac" "707.ac" "707-pax.ac" "EC-137.ac" "fuel-truck.ac" "stairs.ac" "loader.ac" "container.ac" "bellyLoader.ac" "epu.ac"

Write-Host "  - Processing variant: EC-137.ac"
# NOTE: The EC-137 is a military variant of the 707.
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\707\Models\EC-137.ac" --output "$outputDir_707\EC-137.fbx" --livery "$flightGearDataDir\707\Models\EC-137.png" --exclude "wheels.ac" "707.ac" "707-pax.ac" "707-TT.ac" "fuel-truck.ac" "stairs.ac" "loader.ac" "container.ac" "bellyLoader.ac" "epu.ac"


Write-Host "--- Batch Processing Complete ---"

# --- Master Aircraft Processing Script ---
# This script will process multiple aircraft directories, creating output folders,
# metadata files, and final .FBX 3D models for each.

# --- Base Paths ---
$blenderPath = "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe"
$pythonScript = "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py"
$flightGearDataDir = "C:\Users\domin\Documents\FlightGearData"
$outputDirBase = "C:\Users\domin\Documents\TruthTracks\Planes"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: 717
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 717 ---"

# --- 1. Create Directory and metadata.json for 717 ---
$outputDir_717 = Join-Path $outputDirBase "717"
New-Item -Path $outputDir_717 -ItemType Directory -Force | Out-Null

$jsonContent_717 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 440,
  "CruisingAltitude": 34000,
  "MaxAirspeed": 490
}
"@
$jsonContent_717 | Set-Content -Path (Join-Path $outputDir_717 "metadata.json")

# --- 2. Generate .FBX for 717 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\717\Models\717-200.ac" --output "$outputDir_717\717.fbx" --livery "$flightGearDataDir\717\Models\TRS.png"

#--------------------------------------------------------------------------------#
#                              AIRCRAFT: 727-230
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 727-230 ---"

# --- 1. Create Directory and metadata.json for 727-230 ---
$outputDir_727_230 = Join-Path $outputDirBase "727-230"
New-Item -Path $outputDir_727_230 -ItemType Directory -Force | Out-Null

$jsonContent_727_230 = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 495,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 540
}
"@
$jsonContent_727_230 | Set-Content -Path (Join-Path $outputDir_727_230 "metadata.json")

# --- 2. Generate .FBX for 727-230 ---
# Note: shadow.ac is included as a core part. A default livery is chosen from the available options.
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\727-230\Models\727-230.ac" --output "$outputDir_727_230\727-230.fbx" --livery "$flightGearDataDir\727-230\Models\727-230_Lufthansa.png"

#--------------------------------------------------------------------------------#
#                              AIRCRAFT: 737-100
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 737-100 ---"

# --- 1. Create Directory and metadata.json for 737-100 ---
$outputDir_737_100 = Join-Path $outputDirBase "737-100"
New-Item -Path $outputDir_737_100 -ItemType Directory -Force | Out-Null

$jsonContent_737_100 = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 415,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 485
}
"@
$jsonContent_737_100 | Set-Content -Path (Join-Path $outputDir_737_100 "metadata.json")

# --- 2. Generate .FBX for 737-100 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\737-100\Models\737-100.ac" --output "$outputDir_737_100\737-100.fbx" --livery "$flightGearDataDir\737-100\Models\texture.png"

#--------------------------------------------------------------------------------#
#                              AIRCRAFT: 737-200
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 737-200 ---"

# --- 1. Create Directory and metadata.json for 737-200 ---
$outputDir_737_200 = Join-Path $outputDirBase "737-200"
New-Item -Path $outputDir_737_200 -ItemType Directory -Force | Out-Null

$jsonContent_737_200 = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 430,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 500
}
"@
$jsonContent_737_200 | Set-Content -Path (Join-Path $outputDir_737_200 "metadata.json")

# --- 2. Generate .FBX for 737-200 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\737-200\Models\737-200.ac" --output "$outputDir_737_200\737-200.fbx" --livery "$flightGearDataDir\737-200\Models\texture.png"

#--------------------------------------------------------------------------------#
#                              AIRCRAFT: 737-300
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 737-300 ---"

# --- 1. Create Directory and metadata.json for 737-300 ---
$outputDir_737_300 = Join-Path $outputDirBase "737-300"
New-Item -Path $outputDir_737_300 -ItemType Directory -Force | Out-Null

$jsonContent_737_300 = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 430,
  "CruisingAltitude": 37000,
  "MaxAirspeed": 485
}
"@
$jsonContent_737_300 | Set-Content -Path (Join-Path $outputDir_737_300 "metadata.json")

# --- 2. Generate .FBX for 737-300 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\737-300\Models\737-300.ac" --output "$outputDir_737_300\737-300.fbx" --livery "$flightGearDataDir\737-300\Models\733_white.png"


Write-Host "--- Batch Processing Complete ---"

# --- Master Aircraft Processing Script ---
# This script will process multiple aircraft directories, creating output folders,
# metadata files, and final .FBX 3D models for each.

# --- Base Paths ---
$blenderPath = "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe"
$pythonScript = "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py"
$flightGearDataDir = "C:\Users\domin\Documents\FlightGearData"
$outputDirBase = "C:\Users\domin\Documents\TruthTracks\Planes"

#--------------------------------------------------------------------------------#
#                              AIRCRAFT: 737-800
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 737-800 ---"

# --- 1. Create Directory and metadata.json for 737-800 ---
$outputDir_737_800 = Join-Path $outputDirBase "737-800"
New-Item -Path $outputDir_737_800 -ItemType Directory -Force | Out-Null

$jsonContent_737_800 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 450,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 511
}
"@
$jsonContent_737_800 | Set-Content -Path (Join-Path $outputDir_737_800 "metadata.json")

# --- 2. Generate .FBX for 737-800 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\737-800\Models\737-800.ac" --output "$outputDir_737_800\737-800.fbx" --livery "$flightGearDataDir\737-800\Models\737-800.png" --exclude "nosegear.ac"

#--------------------------------------------------------------------------------#
#                          AIRCRAFT: 737NG (variants)
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 737NG (variants) ---"

# --- 1. Create Directory and metadata.json for 737NG ---
$outputDir_737NG = Join-Path $outputDirBase "737NG"
New-Item -Path $outputDir_737NG -ItemType Directory -Force | Out-Null

$jsonContent_737NG = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 450,
  "CruisingAltitude": 37000,
  "MaxAirspeed": 511
}
"@
$jsonContent_737NG | Set-Content -Path (Join-Path $outputDir_737NG "metadata.json")

# --- 2. Generate .FBX for each 737NG variant ---
Write-Host "  - Processing variant: 737-600"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\737NG\Models\737-600.ac" --output "$outputDir_737NG\737-600.fbx" --livery "$flightGearDataDir\737NG\Models\737-600.png" --exclude "nosegear.ac" "737-700.ac" "737-800.ac" "737-900.ac"

Write-Host "  - Processing variant: 737-700"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\737NG\Models\737-700.ac" --output "$outputDir_737NG\737-700.fbx" --livery "$flightGearDataDir\737NG\Models\737-700.png" --exclude "nosegear.ac" "737-600.ac" "737-800.ac" "737-900.ac"

Write-Host "  - Processing variant: 737-800"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\737NG\Models\737-800.ac" --output "$outputDir_737NG\737-800.fbx" --livery "$flightGearDataDir\737NG\Models\737-800.png" --exclude "nosegear.ac" "737-600.ac" "737-700.ac" "737-900.ac"

Write-Host "  - Processing variant: 737-900"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\737NG\Models\737-900.ac" --output "$outputDir_737NG\737-900.fbx" --livery "$flightGearDataDir\737NG\Models\737-900.png" --exclude "nosegear.ac" "737-600.ac" "737-700.ac" "737-800.ac"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: 747
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 747 ---"

# --- 1. Create Directory and metadata.json for 747 ---
$outputDir_747 = Join-Path $outputDirBase "747"
New-Item -Path $outputDir_747 -ItemType Directory -Force | Out-Null

$jsonContent_747 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 490,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 533
}
"@
$jsonContent_747 | Set-Content -Path (Join-Path $outputDir_747 "metadata.json")

# --- 2. Generate .FBX for 747 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\747\Models\boeing747-400-jw.ac" --output "$outputDir_747\747-400_jw.fbx" --livery "$flightGearDataDir\747\Models\boeing747-400-jw-01.rgb" --exclude "boeing747-400-ai-jw.ac"

#--------------------------------------------------------------------------------#
#                              AIRCRAFT: 747-200
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 747-200 ---"

# --- 1. Create Directory and metadata.json for 747-200 ---
$outputDir_747_200 = Join-Path $outputDirBase "747-200"
New-Item -Path $outputDir_747_200 -ItemType Directory -Force | Out-Null

$jsonContent_747_200 = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 487,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 523
}
"@
$jsonContent_747_200 | Set-Content -Path (Join-Path $outputDir_747_200 "metadata.json")

# --- 2. Generate .FBX for 747-200 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\747-200\Models\boeing747-200.ac" --output "$outputDir_747_200\747-200.fbx" --livery "$flightGearDataDir\747-200\Models\747NW-default.rgb"

#--------------------------------------------------------------------------------#
#                              AIRCRAFT: 747-400
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 747-400 ---"

# --- 1. Create Directory and metadata.json for 747-400 ---
$outputDir_747_400 = Join-Path $outputDirBase "747-400"
New-Item -Path $outputDir_747_400 -ItemType Directory -Force | Out-Null

$jsonContent_747_400 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 490,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 533
}
"@
$jsonContent_747_400 | Set-Content -Path (Join-Path $outputDir_747_400 "metadata.json")

# --- 2. Generate .FBX for 747-400 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\747-400\Models\747-400_fuselage.ac" --output "$outputDir_747_400\747-400.fbx" --livery "$flightGearDataDir\747-400\Models\BOE.png" --exclude "747-400_gear.ac"

#--------------------------------------------------------------------------------#
#                         AIRCRAFT: 747-8i (and 8F)
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 747-8i (and 8F) ---"

# --- 1. Create Directory and metadata.json for 747-8 ---
$outputDir_747_8 = Join-Path $outputDirBase "747-8i"
New-Item -Path $outputDir_747_8 -ItemType Directory -Force | Out-Null

$jsonContent_747_8 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 490,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 520
}
"@
$jsonContent_747_8 | Set-Content -Path (Join-Path $outputDir_747_8 "metadata.json")

# --- 2. Generate .FBX for each 747-8 variant ---
Write-Host "  - Processing variant: 747-8i"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\747-8i\Models\747-8i.ac" --output "$outputDir_747_8\747-8i.fbx" --livery "$flightGearDataDir\747-8i\Liveries\748I\Lufthansa_fuselage.png" --exclude "747-8i_gear.ac" "747-8F.ac"

Write-Host "  - Processing variant: 747-8F"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\747-8i\Models\747-8F.ac" --output "$outputDir_747_8\747-8F.fbx" --livery "$flightGearDataDir\747-8i\Liveries\748F\fuselage.png" --exclude "747-8i_gear.ac" "747-8i.ac"

#--------------------------------------------------------------------------------#
#                         AIRCRAFT: 757 (and variants)
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 757 (and variants) ---"

# --- 1. Create Directory and metadata.json for 757 ---
$outputDir_757 = Join-Path $outputDirBase "757-200"
New-Item -Path $outputDir_757 -ItemType Directory -Force | Out-Null

$jsonContent_757 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 450,
  "CruisingAltitude": 36000,
  "MaxAirspeed": 500
}
"@
$jsonContent_757 | Set-Content -Path (Join-Path $outputDir_757 "metadata.json")

# --- 2. Generate .FBX for each 757 variant ---
Write-Host "  - Processing variant: 757-200"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\757-200\Models\757-200.ac" --output "$outputDir_757\757-200.fbx" --livery "$flightGearDataDir\757-200\Models\BOE.png" --exclude "757-300.ac" "C-32A.png" "C-32B.png"

Write-Host "  - Processing variant: 757-300"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\757-200\Models\757-300.ac" --output "$outputDir_757\757-300.fbx" --livery "$flightGearDataDir\757-200\Models\BLN-300.png" --exclude "757-200.ac" "C-32A.png" "C-32B.png"

#--------------------------------------------------------------------------------#
#                              AIRCRAFT: 767-300
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 767-300 ---"

# --- 1. Create Directory and metadata.json for 767-300 ---
$outputDir_767_300 = Join-Path $outputDirBase "767-300"
New-Item -Path $outputDir_767_300 -ItemType Directory -Force | Out-Null

$jsonContent_767_300 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 460,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 490
}
"@
$jsonContent_767_300 | Set-Content -Path (Join-Path $outputDir_767_300 "metadata.json")

# --- 2. Generate .FBX for 767-300 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\767-300\Models\767-300.ac" --output "$outputDir_767_300\767-300.fbx" --livery "$flightGearDataDir\767-300\Models\template.png"

#--------------------------------------------------------------------------------#
#                           AIRCRAFT: 777 (variants)
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 777 (variants) ---"

# --- 1. Create Directory and metadata.json for 777 ---
$outputDir_777 = Join-Path $outputDirBase "777"
New-Item -Path $outputDir_777 -ItemType Directory -Force | Out-Null

$jsonContent_777 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 490,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 512
}
"@
$jsonContent_777 | Set-Content -Path (Join-Path $outputDir_777 "metadata.json")

# --- 2. Generate .FBX for each 777 variant ---
Write-Host "  - Processing variant: 777-200"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\777\Models\777-200.ac" --output "$outputDir_777\777-200.fbx" --livery "$flightGearDataDir\777\Liveries-300ER\white.png" --exclude "777-200ER.ac" "777-200LR.ac" "777-300.ac" "777-300ER.ac"

Write-Host "  - Processing variant: 777-200ER"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\777\Models\777-200ER.ac" --output "$outputDir_777\777-200ER.fbx" --livery "$flightGearDataDir\777\Liveries-300ER\white.png" --exclude "777-200.ac" "777-200LR.ac" "777-300.ac" "777-300ER.ac"

Write-Host "  - Processing variant: 777-200LR"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\777\Models\777-200LR.ac" --output "$outputDir_777\777-200LR.fbx" --livery "$flightGearDataDir\777\Liveries-300ER\white.png" --exclude "777-200.ac" "777-200ER.ac" "777-300.ac" "777-300ER.ac"

Write-Host "  - Processing variant: 777-300"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\777\Models\777-300.ac" --output "$outputDir_777\777-300.fbx" --livery "$flightGearDataDir\777\Liveries-300ER\white.png" --exclude "777-200.ac" "777-200ER.ac" "777-200LR.ac" "777-300ER.ac"

Write-Host "  - Processing variant: 777-300ER"
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\777\Models\777-300ER.ac" --output "$outputDir_777\777-300ER.fbx" --livery "$flightGearDataDir\777\Liveries-300ER\white.png" --exclude "777-200.ac" "777-200ER.ac" "777-200LR.ac" "777-300.ac"

#--------------------------------------------------------------------------------#
#                              AIRCRAFT: 787-8
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: 787-8 ---"

# --- 1. Create Directory and metadata.json for 787-8 ---
$outputDir_787_8 = Join-Path $outputDirBase "787-8"
New-Item -Path $outputDir_787_8 -ItemType Directory -Force | Out-Null

$jsonContent_787_8 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 488,
  "CruisingAltitude": 43000,
  "MaxAirspeed": 516
}
"@
$jsonContent_787_8 | Set-Content -Path (Join-Path $outputDir_787_8 "metadata.json")

# --- 2. Generate .FBX for 787-8 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\787-8\Models\787-8.ac" --output "$outputDir_787_8\787-8.fbx" --livery "$flightGearDataDir\787-8\Models\BOE.png"


Write-Host "--- Batch Processing Complete ---"

# --- Master Aircraft Processing Script ---
# This script will process multiple aircraft directories, creating output folders,
# metadata files, and final .FBX 3D models for each.

# --- Base Paths ---
$blenderPath = "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe"
$pythonScript = "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py"
$flightGearDataDir = "C:\Users\domin\Documents\FlightGearData"
$outputDirBase = "C:\Users\domin\Documents\TruthTracks\Planes"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: A-10
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A-10 ---"

# --- 1. Create Directory and metadata.json for A-10 ---
$outputDir_A10 = Join-Path $outputDirBase "A-10"
New-Item -Path $outputDir_A10 -ItemType Directory -Force | Out-Null

$jsonContent_A10 = @"
{
  "IsMilitary": 1,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 300,
  "CruisingAltitude": 25000,
  "MaxAirspeed": 381
}
"@
$jsonContent_A10 | Set-Content -Path (Join-Path $outputDir_A10 "metadata.json")

# --- 2. Generate .FBX for A-10 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A-10\Models\A10-004-015l3.ac" --output "$outputDir_A10\A-10.fbx" --livery "$flightGearDataDir\A-10\Models\A-10-000B.png"

#--------------------------------------------------------------------------------#
#                            AIRCRAFT: A-26-Invader
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A-26-Invader ---"

# --- 1. Create Directory and metadata.json for A-26-Invader ---
$outputDir_A26 = Join-Path $outputDirBase "A-26-Invader"
New-Item -Path $outputDir_A26 -ItemType Directory -Force | Out-Null

$jsonContent_A26 = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 246,
  "CruisingAltitude": 20000,
  "MaxAirspeed": 316
}
"@
$jsonContent_A26 | Set-Content -Path (Join-Path $outputDir_A26 "metadata.json")

# --- 2. Generate .FBX for A-26-Invader ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A-26-Invader\Models\a26.ac" --output "$outputDir_A26\A-26-Invader.fbx" --livery "$flightGearDataDir\A-26-Invader\Models\texture.png"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: A-6E
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A-6E ---"

# --- 1. Create Directory and metadata.json for A-6E ---
$outputDir_A6E = Join-Path $outputDirBase "A-6E"
New-Item -Path $outputDir_A6E -ItemType Directory -Force | Out-Null

$jsonContent_A6E = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 412,
  "CruisingAltitude": 25000,
  "MaxAirspeed": 560
}
"@
$jsonContent_A6E | Set-Content -Path (Join-Path $outputDir_A6E "metadata.json")

# --- 2. Generate .FBX for A-6E ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A-6E\Models\A-6E.ac" --output "$outputDir_A6E\A-6E.fbx" --livery "$flightGearDataDir\A-6E\Models\skin-1.png"

#--------------------------------------------------------------------------------#
#                              AIRCRAFT: A22-Foxbat
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A22-Foxbat ---"

# --- 1. Create Directory and metadata.json for A22-Foxbat ---
$outputDir_A22 = Join-Path $outputDirBase "A22-Foxbat"
New-Item -Path $outputDir_A22 -ItemType Directory -Force | Out-Null

$jsonContent_A22 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 97,
  "CruisingAltitude": 8000,
  "MaxAirspeed": 118
}
"@
$jsonContent_A22 | Set-Content -Path (Join-Path $outputDir_A22 "metadata.json")

# --- 2. Generate .FBX for A22-Foxbat ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A22-Foxbat\Models\a22.ac" --output "$outputDir_A22\A22-Foxbat.fbx" --livery "$flightGearDataDir\A22-Foxbat\Models\texture.png"

#--------------------------------------------------------------------------------#
#                             AIRCRAFT: A24-Viking
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A24-Viking ---"

# --- 1. Create Directory and metadata.json for A24-Viking ---
$outputDir_A24 = Join-Path $outputDirBase "A24-Viking"
New-Item -Path $outputDir_A24 -ItemType Directory -Force | Out-Null

$jsonContent_A24 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 81,
  "CruisingAltitude": 7000,
  "MaxAirspeed": 97
}
"@
$jsonContent_A24 | Set-Content -Path (Join-Path $outputDir_A24 "metadata.json")

# --- 2. Generate .FBX for A24-Viking ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A24-Viking\Models\a24.ac" --output "$outputDir_A24\A24-Viking.fbx" --livery "$flightGearDataDir\A24-Viking\Models\texture.png"

#--------------------------------------------------------------------------------#
#                             AIRCRAFT: A300-600
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A300-600 ---"

# --- 1. Create Directory and metadata.json for A300-600 ---
$outputDir_A300 = Join-Path $outputDirBase "A300-600"
New-Item -Path $outputDir_A300 -ItemType Directory -Force | Out-Null

$jsonContent_A300 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 450,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 467
}
"@
$jsonContent_A300 | Set-Content -Path (Join-Path $outputDir_A300 "metadata.json")

# --- 2. Generate .FBX for A300-600 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A300-600\Models\Fuselage.ac" --output "$outputDir_A300\A300-600.fbx" --livery "$flightGearDataDir\A300-600\Models\TextureMain.png" --exclude "Gears.ac"

#--------------------------------------------------------------------------------#
#                       SKIPPED: A320-family (Incompatible)
#--------------------------------------------------------------------------------#

# The 'A320-family' directory does not contain a main .ac model file in the top-level 'Models' directory.
# Models are loaded from subdirectories, which is incompatible with the current script configuration.
Write-Host "--- Skipping Entry: A320-family (Incompatible file structure) ---"

#--------------------------------------------------------------------------------#
#                             AIRCRAFT: A340-600
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A340-600 ---"

# --- 1. Create Directory and metadata.json for A340-600 ---
$outputDir_A340 = Join-Path $outputDirBase "A340-600"
New-Item -Path $outputDir_A340 -ItemType Directory -Force | Out-Null

$jsonContent_A340 = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 477,
  "CruisingAltitude": 39000,
  "MaxAirspeed": 500
}
"@
$jsonContent_A340 | Set-Content -Path (Join-Path $outputDir_A340 "metadata.json")

# --- 2. Generate .FBX for A340-600 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A340-600\Models\A340.ac" --output "$outputDir_A340\A340-600.fbx" --livery "$flightGearDataDir\A340-600\Models\Liveries\Liveries\Default.png"

#--------------------------------------------------------------------------------#
#                             AIRCRAFT: A36-Vulcan
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A36-Vulcan ---"

# --- 1. Create Directory and metadata.json for A36-Vulcan ---
$outputDir_A36 = Join-Path $outputDirBase "A36-Vulcan"
New-Item -Path $outputDir_A36 -ItemType Directory -Force | Out-Null

$jsonContent_A36 = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 550,
  "CruisingAltitude": 55000,
  "MaxAirspeed": 560
}
"@
$jsonContent_A36 | Set-Content -Path (Join-Path $outputDir_A36 "metadata.json")

# --- 2. Generate .FBX for A36-Vulcan ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A36-Vulcan\Models\a36.ac" --output "$outputDir_A36\A36-Vulcan.fbx" --livery "$flightGearDataDir\A36-Vulcan\Models\texture.png"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: A380
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A380 ---"

# --- 1. Create Directory and metadata.json for A380 ---
$outputDir_A380 = Join-Path $outputDirBase "A380"
New-Item -Path $outputDir_A380 -ItemType Directory -Force | Out-Null

$jsonContent_A380 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 490,
  "CruisingAltitude": 43000,
  "MaxAirspeed": 560
}
"@
$jsonContent_A380 | Set-Content -Path (Join-Path $outputDir_A380 "metadata.json")

# --- 2. Generate .FBX for A380 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A380\Models\a380.ac" --output "$outputDir_A380\A380.fbx" --livery "$flightGearDataDir\A380\Textures\Livery\House\A380.png"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: a4
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: a4 ---"

# --- 1. Create Directory and metadata.json for a4 ---
$outputDir_a4 = Join-Path $outputDirBase "a4"
New-Item -Path $outputDir_a4 -ItemType Directory -Force | Out-Null

$jsonContent_a4 = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 429,
  "CruisingAltitude": 30000,
  "MaxAirspeed": 585
}
"@
$jsonContent_a4 | Set-Content -Path (Join-Path $outputDir_a4 "metadata.json")

# --- 2. Generate .FBX for a4 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\a4\Models\a4f.ac" --output "$outputDir_a4\a4.fbx" --livery "$flightGearDataDir\a4\Models\a4f-fuselage.png" --exclude "a4-blue.ac"

Write-Host "--- Batch Processing Complete ---"

# --- Master Aircraft Processing Script ---
# This script will process multiple aircraft directories, creating output folders,
# metadata files, and final .FBX 3D models for each.

# --- Base Paths ---
$blenderPath = "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe"
$pythonScript = "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py"
$flightGearDataDir = "C:\Users\domin\Documents\FlightGearData"
$outputDirBase = "C:\Users\domin\Documents\TruthTracks\Planes"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: A6M2
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A6M2 ---"

# --- 1. Create Directory and metadata.json for A6M2 ---
$outputDir_A6M2 = Join-Path $outputDirBase "A6M2"
New-Item -Path $outputDir_A6M2 -ItemType Directory -Force | Out-Null

$jsonContent_A6M2 = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 230,
  "CruisingAltitude": 19685,
  "MaxAirspeed": 287
}
"@
$jsonContent_A6M2 | Set-Content -Path (Join-Path $outputDir_A6M2 "metadata.json")

# --- 2. Generate .FBX for A6M2 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A6M2\Models\a6m2.ac" --output "$outputDir_A6M2\A6M2.fbx" --livery "$flightGearDataDir\A6M2\Models\Zero.rgb"

#--------------------------------------------------------------------------------#
#                         AIRCRAFT: Aermacchi-MB-339
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Aermacchi-MB-339 ---"

# --- 1. Create Directory and metadata.json for Aermacchi-MB-339 ---
$outputDir_MB339 = Join-Path $outputDirBase "Aermacchi-MB-339"
New-Item -Path $outputDir_MB339 -ItemType Directory -Force | Out-Null

$jsonContent_MB339 = @"
{
  "IsMilitary": 1,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 430,
  "CruisingAltitude": 30000,
  "MaxAirspeed": 485
}
"@
$jsonContent_MB339 | Set-Content -Path (Join-Path $outputDir_MB339 "metadata.json")

# --- 2. Generate .FBX for Aermacchi-MB-339 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Aermacchi-MB-339\Models\mb339.ac" --output "$outputDir_MB339\Aermacchi-MB-339.fbx" --livery "$flightGearDataDir\Aermacchi-MB-339\Models\texture.png"

#--------------------------------------------------------------------------------#
#                           AIRCRAFT: Aero-Commander
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Aero-Commander ---"

# --- 1. Create Directory and metadata.json for Aero-Commander ---
$outputDir_AeroCommander = Join-Path $outputDirBase "Aero-Commander"
New-Item -Path $outputDir_AeroCommander -ItemType Directory -Force | Out-Null

$jsonContent_AeroCommander = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 187,
  "CruisingAltitude": 10000,
  "MaxAirspeed": 230
}
"@
$jsonContent_AeroCommander | Set-Content -Path (Join-Path $outputDir_AeroCommander "metadata.json")

# --- 2. Generate .FBX for Aero-Commander ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Aero-Commander\Models\commander.ac" --output "$outputDir_AeroCommander\Aero-Commander.fbx" --livery "$flightGearDataDir\Aero-Commander\Models\texture.png"

#--------------------------------------------------------------------------------#
#                               AIRCRAFT: Aerocar
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Aerocar ---"

# --- 1. Create Directory and metadata.json for Aerocar ---
$outputDir_Aerocar = Join-Path $outputDirBase "Aerocar"
New-Item -Path $outputDir_Aerocar -ItemType Directory -Force | Out-Null

$jsonContent_Aerocar = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 87,
  "CruisingAltitude": 12000,
  "MaxAirspeed": 97
}
"@
$jsonContent_Aerocar | Set-Content -Path (Join-Path $outputDir_Aerocar "metadata.json")

# --- 2. Generate .FBX for Aerocar ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Aerocar\Models\Aerocar.ac" --output "$outputDir_Aerocar\Aerocar.fbx" --livery "$flightGearDataDir\Aerocar\Models\N102D.png"

#--------------------------------------------------------------------------------#
#                             AIRCRAFT: Aerostar-700
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Aerostar-700 ---"

# --- 1. Create Directory and metadata.json for Aerostar-700 ---
$outputDir_Aerostar = Join-Path $outputDirBase "Aerostar-700"
New-Item -Path $outputDir_Aerostar -ItemType Directory -Force | Out-Null

$jsonContent_Aerostar = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 226,
  "CruisingAltitude": 20000,
  "MaxAirspeed": 261
}
"@
$jsonContent_Aerostar | Set-Content -Path (Join-Path $outputDir_Aerostar "metadata.json")

# --- 2. Generate .FBX for Aerostar-700 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Aerostar-700\Models\aerostar700.ac" --output "$outputDir_Aerostar\Aerostar-700.fbx" --livery "$flightGearDataDir\Aerostar-700\Models\exterior.png"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: AG-14
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: AG-14 ---"

# --- 1. Create Directory and metadata.json for AG-14 ---
$outputDir_AG14 = Join-Path $outputDirBase "AG-14"
New-Item -Path $outputDir_AG14 -ItemType Directory -Force | Out-Null

$jsonContent_AG14 = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 100,
  "CruisingAltitude": 10000,
  "MaxAirspeed": 110
}
"@
$jsonContent_AG14 | Set-Content -Path (Join-Path $outputDir_AG14 "metadata.json")

# --- 2. Generate .FBX for AG-14 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\AG-14\Models\AG-14.ac" --output "$outputDir_AG14\AG-14.fbx" --livery "$flightGearDataDir\AG-14\Liveries\white.png"

#--------------------------------------------------------------------------------#
#                             AIRCRAFT: Aichi-D3A
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Aichi-D3A ---"

# --- 1. Create Directory and metadata.json for Aichi-D3A ---
$outputDir_AichiD3A = Join-Path $outputDirBase "Aichi-D3A"
New-Item -Path $outputDir_AichiD3A -ItemType Directory -Force | Out-Null

$jsonContent_AichiD3A = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 207,
  "CruisingAltitude": 15000,
  "MaxAirspeed": 240
}
"@
$jsonContent_AichiD3A | Set-Content -Path (Join-Path $outputDir_AichiD3A "metadata.json")

# --- 2. Generate .FBX for Aichi-D3A ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Aichi-D3A\Models\val.ac" --output "$outputDir_AichiD3A\Aichi-D3A.fbx" --livery "$flightGearDataDir\Aichi-D3A\Models\texture.png"

#--------------------------------------------------------------------------------#
#                             AIRCRAFT: Aichi-M6A
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Aichi-M6A ---"

# --- 1. Create Directory and metadata.json for Aichi-M6A ---
$outputDir_AichiM6A = Join-Path $outputDirBase "Aichi-M6A"
New-Item -Path $outputDir_AichiM6A -ItemType Directory -Force | Out-Null

$jsonContent_AichiM6A = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 160,
  "CruisingAltitude": 13000,
  "MaxAirspeed": 254
}
"@
$jsonContent_AichiM6A | Set-Content -Path (Join-Path $outputDir_AichiM6A "metadata.json")

# --- 2. Generate .FBX for Aichi-M6A ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Aichi-M6A\Models\m6a1.ac" --output "$outputDir_AichiM6A\Aichi-M6A.fbx" --livery "$flightGearDataDir\Aichi-M6A\Models\texture.png"

#--------------------------------------------------------------------------------#
#                              AIRCRAFT: Airco-DH2
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Airco-DH2 ---"

# --- 1. Create Directory and metadata.json for Airco-DH2 ---
$outputDir_AircoDH2 = Join-Path $outputDirBase "Airco-DH2"
New-Item -Path $outputDir_AircoDH2 -ItemType Directory -Force | Out-Null

$jsonContent_AircoDH2 = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 70,
  "CruisingAltitude": 7000,
  "MaxAirspeed": 81
}
"@
$jsonContent_AircoDH2 | Set-Content -Path (Join-Path $outputDir_AircoDH2 "metadata.json")

# --- 2. Generate .FBX for Airco-DH2 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Airco-DH2\Models\dh2.ac" --output "$outputDir_AircoDH2\Airco-DH2.fbx" --livery "$flightGearDataDir\Airco-DH2\Models\texture.png"

#--------------------------------------------------------------------------------#
#                               AIRCRAFT: AirCrane
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: AirCrane ---"

# --- 1. Create Directory and metadata.json for AirCrane ---
$outputDir_AirCrane = Join-Path $outputDirBase "AirCrane"
New-Item -Path $outputDir_AirCrane -ItemType Directory -Force | Out-Null

$jsonContent_AirCrane = @"
{
  "IsMilitary": 1,
  "IsInService": 1,
  "IsHelicopter": 1,
  "IsFixedWing": 0,
  "CruisingAirspeed": 91,
  "CruisingAltitude": 9000,
  "MaxAirspeed": 109
}
"@
$jsonContent_AirCrane | Set-Content -Path (Join-Path $outputDir_AirCrane "metadata.json")

# --- 2. Generate .FBX for AirCrane ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\AirCrane\Models\aircrane.ac" --output "$outputDir_AirCrane\AirCrane.fbx" --livery "$flightGearDataDir\AirCrane\Models\texture.png"

#--------------------------------------------------------------------------------#
#                     AIRCRAFT: Airspeed-AS57-Ambassador2
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Airspeed-AS57-Ambassador2 ---"

# --- 1. Create Directory and metadata.json for Airspeed-AS57-Ambassador2 ---
$outputDir_AS57 = Join-Path $outputDirBase "Airspeed-AS57-Ambassador2"
New-Item -Path $outputDir_AS57 -ItemType Directory -Force | Out-Null

$jsonContent_AS57 = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 235,
  "CruisingAltitude": 20000,
  "MaxAirspeed": 271
}
"@
$jsonContent_AS57 | Set-Content -Path (Join-Path $outputDir_AS57 "metadata.json")

# --- 2. Generate .FBX for Airspeed-AS57-Ambassador2 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Airspeed-AS57-Ambassador2\Models\as57.ac" --output "$outputDir_AS57\Airspeed-AS57-Ambassador2.fbx" --livery "$flightGearDataDir\Airspeed-AS57-Ambassador2\Models\texture.png"

#--------------------------------------------------------------------------------#
#                           AIRCRAFT: Airspeed-Horsa
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Airspeed-Horsa ---"

# --- 1. Create Directory and metadata.json for Airspeed-Horsa ---
$outputDir_Horsa = Join-Path $outputDirBase "Airspeed-Horsa"
New-Item -Path $outputDir_Horsa -ItemType Directory -Force | Out-Null

$jsonContent_Horsa = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 100,
  "CruisingAltitude": 10000,
  "MaxAirspeed": 130
}
"@
$jsonContent_Horsa | Set-Content -Path (Join-Path $outputDir_Horsa "metadata.json")

# --- 2. Generate .FBX for Airspeed-Horsa ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Airspeed-Horsa\Models\horsa.ac" --output "$outputDir_Horsa\Airspeed-Horsa.fbx" --livery "$flightGearDataDir\Airspeed-Horsa\Models\texture.png"

#--------------------------------------------------------------------------------#
#                         AIRCRAFT: airwaveXtreme150
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: airwaveXtreme150 ---"

# --- 1. Create Directory and metadata.json for airwaveXtreme150 ---
$outputDir_airwave = Join-Path $outputDirBase "airwaveXtreme150"
New-Item -Path $outputDir_airwave -ItemType Directory -Force | Out-Null

$jsonContent_airwave = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 25,
  "CruisingAltitude": 5000,
  "MaxAirspeed": 55
}
"@
$jsonContent_airwave | Set-Content -Path (Join-Path $outputDir_airwave "metadata.json")

# --- 2. Generate .FBX for airwaveXtreme150 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\airwaveXtreme150\Models\JSBSim\hgldr_cs.ac" --output "$outputDir_airwave\airwaveXtreme150.fbx" --livery "$flightGearDataDir\airwaveXtreme150\Models\JSBSim\hgldr_cs0.rgb"

#--------------------------------------------------------------------------------#
#                             AIRCRAFT: Albatros-BII
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Albatros-BII ---"

# --- 1. Create Directory and metadata.json for Albatros-BII ---
$outputDir_AlbatrosBII = Join-Path $outputDirBase "Albatros-BII"
New-Item -Path $outputDir_AlbatrosBII -ItemType Directory -Force | Out-Null

$jsonContent_AlbatrosBII = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 55,
  "CruisingAltitude": 5000,
  "MaxAirspeed": 65
}
"@
$jsonContent_AlbatrosBII | Set-Content -Path (Join-Path $outputDir_AlbatrosBII "metadata.json")

# --- 2. Generate .FBX for Albatros-BII ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Albatros-BII\Models\albatrosbII.ac" --output "$outputDir_AlbatrosBII\Albatros-BII.fbx" --livery "$flightGearDataDir\Albatros-BII\Models\texture.png"

#--------------------------------------------------------------------------------#
#                              AIRCRAFT: Albatross
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Albatross ---"

# --- 1. Create Directory and metadata.json for Albatross ---
$outputDir_Albatross = Join-Path $outputDirBase "Albatross"
New-Item -Path $outputDir_Albatross -ItemType Directory -Force | Out-Null

$jsonContent_Albatross = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 125,
  "CruisingAltitude": 10000,
  "MaxAirspeed": 205
}
"@
$jsonContent_Albatross | Set-Content -Path (Join-Path $outputDir_Albatross "metadata.json")

# --- 2. Generate .FBX for Albatross ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Albatross\Models\albatros.ac" --output "$outputDir_Albatross\Albatross.fbx" --livery "$flightGearDataDir\Albatross\Models\albatros-1.rgb"

#--------------------------------------------------------------------------------#
#                            AIRCRAFT: Allegro-2000
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Allegro-2000 ---"

# --- 1. Create Directory and metadata.json for Allegro-2000 ---
$outputDir_Allegro = Join-Path $outputDirBase "Allegro-2000"
New-Item -Path $outputDir_Allegro -ItemType Directory -Force | Out-Null

$jsonContent_Allegro = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 97,
  "CruisingAltitude": 10000,
  "MaxAirspeed": 113
}
"@
$jsonContent_Allegro | Set-Content -Path (Join-Path $outputDir_Allegro "metadata.json")

# --- 2. Generate .FBX for Allegro-2000 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Allegro-2000\Models\allegro.ac" --output "$outputDir_Allegro\Allegro-2000.fbx" --livery "$flightGearDataDir\Allegro-2000\Models\texture.png"

#--------------------------------------------------------------------------------#
#                               AIRCRAFT: Alphajet
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Alphajet ---"

# --- 1. Create Directory and metadata.json for Alphajet ---
$outputDir_Alphajet = Join-Path $outputDirBase "Alphajet"
New-Item -Path $outputDir_Alphajet -ItemType Directory -Force | Out-Null

$jsonContent_Alphajet = @"
{
  "IsMilitary": 1,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 485,
  "CruisingAltitude": 40000,
  "MaxAirspeed": 540
}
"@
$jsonContent_Alphajet | Set-Content -Path (Join-Path $outputDir_Alphajet "metadata.json")

# --- 2. Generate .FBX for Alphajet ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Alphajet\Models\alphajet.ac" --output "$outputDir_Alphajet\Alphajet.fbx" --livery "$flightGearDataDir\Alphajet\Models\texture.png"

#--------------------------------------------------------------------------------#
#                             AIRCRAFT: Alouette-II
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Alouette-II ---"

# --- 1. Create Directory and metadata.json for Alouette-II ---
$outputDir_AlouetteII = Join-Path $outputDirBase "Alouette-II"
New-Item -Path $outputDir_AlouetteII -ItemType Directory -Force | Out-Null

$jsonContent_AlouetteII = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 1,
  "IsFixedWing": 0,
  "CruisingAirspeed": 92,
  "CruisingAltitude": 10000,
  "MaxAirspeed": 100
}
"@
$jsonContent_AlouetteII | Set-Content -Path (Join-Path $outputDir_AlouetteII "metadata.json")

# --- 2. Generate .FBX for Alouette-II ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Alouette-II\Models\alouette.ac" --output "$outputDir_AlouetteII\Alouette-II.fbx" --livery "$flightGearDataDir\Alouette-II\Models\texture.png"

#--------------------------------------------------------------------------------#
#                      SKIPPED: Alouette-III (Incompatible)
#--------------------------------------------------------------------------------#

# The 'Alouette-III' directory does not contain a main .ac model file in the top-level 'Models' directory.
# Its models are in subdirectories, which is incompatible with the current script configuration.
Write-Host "--- Skipping Entry: Alouette-III (Incompatible file structure) ---"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: AN-225
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: AN-225 ---"

# --- 1. Create Directory and metadata.json for AN-225 ---
$outputDir_AN225 = Join-Path $outputDirBase "AN-225"
New-Item -Path $outputDir_AN225 -ItemType Directory -Force | Out-Null

$jsonContent_AN225 = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 432,
  "CruisingAltitude": 39000,
  "MaxAirspeed": 459
}
"@
$jsonContent_AN225 | Set-Content -Path (Join-Path $outputDir_AN225 "metadata.json")

# --- 2. Generate .FBX for AN-225 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\AN-225\Models\AN225-003-002d14.ac" --output "$outputDir_AN225\AN-225.fbx" --livery "$flightGearDataDir\AN-225\Models\AN225-tx-001.rgb"

#--------------------------------------------------------------------------------#
#                                 AIRCRAFT: an2
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: an2 ---"

# --- 1. Create Directory and metadata.json for an2 ---
$outputDir_an2 = Join-Path $outputDirBase "an2"
New-Item -Path $outputDir_an2 -ItemType Directory -Force | Out-Null

$jsonContent_an2 = @"
{
  "IsMilitary": 1,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 100,
  "CruisingAltitude": 8000,
  "MaxAirspeed": 139
}
"@
$jsonContent_an2 | Set-Content -Path (Join-Path $outputDir_an2 "metadata.json")

# --- 2. Generate .FBX for an2 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\an2\Model\an2.ac" --output "$outputDir_an2\an2.fbx" --livery "$flightGearDataDir\an2\Model\blue.png"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: an24b
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: an24b ---"

# --- 1. Create Directory and metadata.json for an24b ---
$outputDir_an24b = Join-Path $outputDirBase "an24b"
New-Item -Path $outputDir_an24b -ItemType Directory -Force | Out-Null

$jsonContent_an24b = @"
{
  "IsMilitary": 1,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 250,
  "CruisingAltitude": 20000,
  "MaxAirspeed": 270
}
"@
$jsonContent_an24b | Set-Content -Path (Join-Path $outputDir_an24b "metadata.json")

# --- 2. Generate .FBX for an24b ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\an24b\Models\Exterior\an24-model.ac" --output "$outputDir_an24b\an24b.fbx" --livery "$flightGearDataDir\an24b\Models\Exterior\CIS_An24B_t.png"

#--------------------------------------------------------------------------------#
#                            AIRCRAFT: Ansaldo-SVA5
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: Ansaldo-SVA5 ---"

# --- 1. Create Directory and metadata.json for Ansaldo-SVA5 ---
$outputDir_Ansaldo = Join-Path $outputDirBase "Ansaldo-SVA5"
New-Item -Path $outputDir_Ansaldo -ItemType Directory -Force | Out-Null

$jsonContent_Ansaldo = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 115,
  "CruisingAltitude": 10000,
  "MaxAirspeed": 143
}
"@
$jsonContent_Ansaldo | Set-Content -Path (Join-Path $outputDir_Ansaldo "metadata.json")

# --- 2. Generate .FBX for Ansaldo-SVA5 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\Ansaldo-SVA5\Models\sva5.ac" --output "$outputDir_Ansaldo\Ansaldo-SVA5.fbx" --livery "$flightGearDataDir\Ansaldo-SVA5\Models\texture.png"


Write-Host "--- Batch Processing Complete ---"

# --- Master Aircraft Processing Script ---
# This script will process multiple aircraft directories, creating output folders,
# metadata files, and final .FBX 3D models for each.

# --- Base Paths ---
$blenderPath = "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe"
$pythonScript = "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py"
$flightGearDataDir = "C:\Users\domin\Documents\FlightGearData"
$outputDirBase = "C:\Users\domin\Documents\TruthTracks\Planes"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: A-10
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A-10 ---"

# --- 1. Create Directory and metadata.json for A-10 ---
$outputDir_A10 = Join-Path $outputDirBase "A-10"
New-Item -Path $outputDir_A10 -ItemType Directory -Force | Out-Null

$jsonContent_A10 = @"
{
  "IsMilitary": 1,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 300,
  "CruisingAltitude": 25000,
  "MaxAirspeed": 381
}
"@
$jsonContent_A10 | Set-Content -Path (Join-Path $outputDir_A10 "metadata.json")

# --- 2. Generate .FBX for A-10 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A-10\Models\A10-004-015l3.ac" --output "$outputDir_A10\A-10.fbx" --livery "$flightGearDataDir\A-10\Models\A-10-000B.png"

#--------------------------------------------------------------------------------#
#                            AIRCRAFT: A-26-Invader
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A-26-Invader ---"

# --- 1. Create Directory and metadata.json for A-26-Invader ---
$outputDir_A26 = Join-Path $outputDirBase "A-26-Invader"
New-Item -Path $outputDir_A26 -ItemType Directory -Force | Out-Null

$jsonContent_A26 = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 246,
  "CruisingAltitude": 20000,
  "MaxAirspeed": 316
}
"@
$jsonContent_A26 | Set-Content -Path (Join-Path $outputDir_A26 "metadata.json")

# --- 2. Generate .FBX for A-26-Invader ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A-26-Invader\Models\a26.ac" --output "$outputDir_A26\A-26-Invader.fbx" --livery "$flightGearDataDir\A-26-Invader\Models\texture.png"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: A-6E
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A-6E ---"

# --- 1. Create Directory and metadata.json for A-6E ---
$outputDir_A6E = Join-Path $outputDirBase "A-6E"
New-Item -Path $outputDir_A6E -ItemType Directory -Force | Out-Null

$jsonContent_A6E = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 412,
  "CruisingAltitude": 25000,
  "MaxAirspeed": 560
}
"@
$jsonContent_A6E | Set-Content -Path (Join-Path $outputDir_A6E "metadata.json")

# --- 2. Generate .FBX for A-6E ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A-6E\Models\A-6E.ac" --output "$outputDir_A6E\A-6E.fbx" --livery "$flightGearDataDir\A-6E\Models\skin-1.png"

#--------------------------------------------------------------------------------#
#                              AIRCRAFT: A22-Foxbat
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A22-Foxbat ---"

# --- 1. Create Directory and metadata.json for A22-Foxbat ---
$outputDir_A22 = Join-Path $outputDirBase "A22-Foxbat"
New-Item -Path $outputDir_A22 -ItemType Directory -Force | Out-Null

$jsonContent_A22 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 97,
  "CruisingAltitude": 8000,
  "MaxAirspeed": 118
}
"@
$jsonContent_A22 | Set-Content -Path (Join-Path $outputDir_A22 "metadata.json")

# --- 2. Generate .FBX for A22-Foxbat ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A22-Foxbat\Models\a22.ac" --output "$outputDir_A22\A22-Foxbat.fbx" --livery "$flightGearDataDir\A22-Foxbat\Models\texture.png"

#--------------------------------------------------------------------------------#
#                             AIRCRAFT: A24-Viking
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A24-Viking ---"

# --- 1. Create Directory and metadata.json for A24-Viking ---
$outputDir_A24 = Join-Path $outputDirBase "A24-Viking"
New-Item -Path $outputDir_A24 -ItemType Directory -Force | Out-Null

$jsonContent_A24 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 81,
  "CruisingAltitude": 7000,
  "MaxAirspeed": 97
}
"@
$jsonContent_A24 | Set-Content -Path (Join-Path $outputDir_A24 "metadata.json")

# --- 2. Generate .FBX for A24-Viking ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A24-Viking\Models\a24.ac" --output "$outputDir_A24\A24-Viking.fbx" --livery "$flightGearDataDir\A24-Viking\Models\texture.png"

#--------------------------------------------------------------------------------#
#                             AIRCRAFT: A300-600
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A300-600 ---"

# --- 1. Create Directory and metadata.json for A300-600 ---
$outputDir_A300 = Join-Path $outputDirBase "A300-600"
New-Item -Path $outputDir_A300 -ItemType Directory -Force | Out-Null

$jsonContent_A300 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 450,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 467
}
"@
$jsonContent_A300 | Set-Content -Path (Join-Path $outputDir_A300 "metadata.json")

# --- 2. Generate .FBX for A300-600 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A300-600\Models\Fuselage.ac" --output "$outputDir_A300\A300-600.fbx" --livery "$flightGearDataDir\A300-600\Models\TextureMain.png" --exclude "Gears.ac"

#--------------------------------------------------------------------------------#
#                       SKIPPED: A320-family (Incompatible)
#--------------------------------------------------------------------------------#

# The 'A320-family' directory does not contain a main .ac model file in the top-level 'Models' directory.
# Models are loaded from subdirectories, which is incompatible with the current script configuration.
Write-Host "--- Skipping Entry: A320-family (Incompatible file structure) ---"

#--------------------------------------------------------------------------------#
#                             AIRCRAFT: A340-600
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A340-600 ---"

# --- 1. Create Directory and metadata.json for A340-600 ---
$outputDir_A340 = Join-Path $outputDirBase "A340-600"
New-Item -Path $outputDir_A340 -ItemType Directory -Force | Out-Null

$jsonContent_A340 = @"
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 477,
  "CruisingAltitude": 39000,
  "MaxAirspeed": 500
}
"@
$jsonContent_A340 | Set-Content -Path (Join-Path $outputDir_A340 "metadata.json")

# --- 2. Generate .FBX for A340-600 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A340-600\Models\A340.ac" --output "$outputDir_A340\A340-600.fbx" --livery "$flightGearDataDir\A340-600\Models\Liveries\Liveries\Default.png"

#--------------------------------------------------------------------------------#
#                             AIRCRAFT: A36-Vulcan
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A36-Vulcan ---"

# --- 1. Create Directory and metadata.json for A36-Vulcan ---
$outputDir_A36 = Join-Path $outputDirBase "A36-Vulcan"
New-Item -Path $outputDir_A36 -ItemType Directory -Force | Out-Null

$jsonContent_A36 = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 550,
  "CruisingAltitude": 55000,
  "MaxAirspeed": 560
}
"@
$jsonContent_A36 | Set-Content -Path (Join-Path $outputDir_A36 "metadata.json")

# --- 2. Generate .FBX for A36-Vulcan ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A36-Vulcan\Models\a36.ac" --output "$outputDir_A36\A36-Vulcan.fbx" --livery "$flightGearDataDir\A36-Vulcan\Models\texture.png"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: A380
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: A380 ---"

# --- 1. Create Directory and metadata.json for A380 ---
$outputDir_A380 = Join-Path $outputDirBase "A380"
New-Item -Path $outputDir_A380 -ItemType Directory -Force | Out-Null

$jsonContent_A380 = @"
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 490,
  "CruisingAltitude": 43000,
  "MaxAirspeed": 560
}
"@
$jsonContent_A380 | Set-Content -Path (Join-Path $outputDir_A380 "metadata.json")

# --- 2. Generate .FBX for A380 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\A380\Models\a380.ac" --output "$outputDir_A380\A380.fbx" --livery "$flightGearDataDir\A380\Textures\Livery\House\A380.png"

#--------------------------------------------------------------------------------#
#                                AIRCRAFT: a4
#--------------------------------------------------------------------------------#

Write-Host "--- Processing Aircraft: a4 ---"

# --- 1. Create Directory and metadata.json for a4 ---
$outputDir_a4 = Join-Path $outputDirBase "a4"
New-Item -Path $outputDir_a4 -ItemType Directory -Force | Out-Null

$jsonContent_a4 = @"
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 429,
  "CruisingAltitude": 30000,
  "MaxAirspeed": 585
}
"@
$jsonContent_a4 | Set-Content -Path (Join-Path $outputDir_a4 "metadata.json")

# --- 2. Generate .FBX for a4 ---
& $blenderPath -b --python $pythonScript -- --main_model "$flightGearDataDir\a4\Models\a4f.ac" --output "$outputDir_a4\a4.fbx" --livery "$flightGearDataDir\a4\Models\a4f-fuselage.png" --exclude "a4-blue.ac"

Write-Host "--- Batch Processing Complete ---"

# -----------------------------------------------------------------------------
# Aircraft: Bombardier-415
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Bombardier-415"
$metadata_Bombardier_415 = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 180
    CruisingAltitude = 10000
    MaxAirspeed = 194
}
$metadata_Bombardier_415 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Bombardier-415\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Bombardier-415\Models\cl415.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Bombardier-415\Bombardier-415.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Bombardier-415\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Boomerang
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Boomerang"
$metadata_Boomerang = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 252
    CruisingAltitude = 24000
    MaxAirspeed = 265
}
$metadata_Boomerang | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Boomerang\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Boomerang\Models\boomerang.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Boomerang\Boomerang.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Boomerang\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Br-761
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Br-761"
$metadata_Br_761 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 189
    CruisingAltitude = 10000
    MaxAirspeed = 211
}
$metadata_Br_761 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Br-761\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Br-761\Models\br-761.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Br-761\Br-761.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Br-761\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Brabazon
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Brabazon"
$metadata_Brabazon = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 217
    CruisingAltitude = 25000
    MaxAirspeed = 261
}
$metadata_Brabazon | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Brabazon\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Brabazon\Models\brabazon.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Brabazon\Brabazon.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Brabazon\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Breda-B.Z.308
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Breda-B.Z.308"
$metadata_Breda_B_Z_308 = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 265
    CruisingAltitude = 16400
    MaxAirspeed = 308
}
$metadata_Breda_B_Z_308 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Breda-B.Z.308\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Breda-B.Z.308\Models\bz308.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Breda-B.Z.308\Breda-B.Z.308.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Breda-B.Z.308\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Breguet-14
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-14"
$metadata_Breguet_14 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 93
    CruisingAltitude = 10000
    MaxAirspeed = 101
}
$metadata_Breguet_14 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-14\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Breguet-14\Models\breguet14.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-14\Breguet-14.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Breguet-14\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Breguet-Alize
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-Alize"
$metadata_Breguet_Alize = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 200
    CruisingAltitude = 15000
    MaxAirspeed = 270
}
$metadata_Breguet_Alize | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-Alize\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Breguet-Alize\Models\br1050.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-Alize\Breguet-Alize.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Breguet-Alize\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Breguet-Atlantic
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-Atlantic"
$metadata_Breguet_Atlantic = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 300
    CruisingAltitude = 30000
    MaxAirspeed = 355
}
$metadata_Breguet_Atlantic | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-Atlantic\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Breguet-Atlantic\Models\br1150.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-Atlantic\Breguet-Atlantic.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Breguet-Atlantic\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Breguet-Bre-482
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-Bre-482"
$metadata_Breguet_Bre_482 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 257
    CruisingAltitude = 20000
    MaxAirspeed = 310
}
$metadata_Breguet_Bre_482 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-Bre-482\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Breguet-Bre-482\Models\bre482.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-Bre-482\Breguet-Bre-482.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Breguet-Bre-482\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Breguet-XIX
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-XIX"
$metadata_Breguet_XIX = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 115
    CruisingAltitude = 10000
    MaxAirspeed = 135
}
$metadata_Breguet_XIX | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-XIX\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Breguet-XIX\Models\breguet19.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Breguet-XIX\Breguet-XIX.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Breguet-XIX\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: BristolFreighter
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\BristolFreighter"
$metadata_BristolFreighter = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 143
    CruisingAltitude = 10000
    MaxAirspeed = 195
}
$metadata_BristolFreighter | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\BristolFreighter\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\BristolFreighter\Models\BristolFreighter.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\BristolFreighter\BristolFreighter.fbx" --livery "C:\Users\domin\Documents\FlightGearData\BristolFreighter\Models\TPA.png" 

# -----------------------------------------------------------------------------
# Aircraft: Buccaneer
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Buccaneer"
$metadata_Buccaneer = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 468
    CruisingAltitude = 40000
    MaxAirspeed = 582
}
$metadata_Buccaneer | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Buccaneer\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Buccaneer\Models\buccaneer.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Buccaneer\Buccaneer.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Buccaneer\Models\skin.rgb" 

# -----------------------------------------------------------------------------
# Aircraft: Bugatti
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Bugatti"
$metadata_Bugatti = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 400
    CruisingAltitude = 15000
    MaxAirspeed = 434
}
$metadata_Bugatti | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Bugatti\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Bugatti\Models\bugatti.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Bugatti\Bugatti.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Bugatti\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Burnelli-CBY-3
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Burnelli-CBY-3"
$metadata_Burnelli_CBY_3 = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 148
    CruisingAltitude = 10000
    MaxAirspeed = 174
}
$metadata_Burnelli_CBY_3 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Burnelli-CBY-3\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Burnelli-CBY-3\Models\burnelli.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Burnelli-CBY-3\Burnelli-CBY-3.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Burnelli-CBY-3\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: BV-141
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\BV-141"
$metadata_BV_141 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 174
    CruisingAltitude = 16400
    MaxAirspeed = 236
}
$metadata_BV_141 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\BV-141\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\BV-141\Models\bv-141.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\BV-141\BV-141.fbx" --livery "C:\Users\domin\Documents\FlightGearData\BV-141\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: C-160-Transall
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\C-160-Transall"
$metadata_C_160_Transall = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 250
    CruisingAltitude = 27000
    MaxAirspeed = 277
}
$metadata_C_160_Transall | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\C-160-Transall\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\C-160-Transall\Models\c160.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\C-160-Transall\C-160-Transall.fbx" --livery "C:\Users\domin\Documents\FlightGearData\C-160-Transall\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: C-2A
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\C-2A"
$metadata_C_2A = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 251
    CruisingAltitude = 33800
    MaxAirspeed = 327
}
$metadata_C_2A | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\C-2A\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\C-2A\Models\c-2a.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\C-2A\C-2A.fbx" --livery "C:\Users\domin\Documents\FlightGearData\C-2A\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: C130
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\C130"
$metadata_C130 = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 292
    CruisingAltitude = 28000
    MaxAirspeed = 320
}
$metadata_C130 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\C130\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\C130\Models\c130.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\C130\C130.fbx" --livery "C:\Users\domin\Documents\FlightGearData\C130\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: c140
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\c140"
$metadata_c140 = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 91
    CruisingAltitude = 12000
    MaxAirspeed = 109
}
$metadata_c140 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\c140\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\c140\Models\c140.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\c140\c140.fbx" --livery "C:\Users\domin\Documents\FlightGearData\c140\Models\c140.png" 

# -----------------------------------------------------------------------------
# Aircraft: c150
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\c150"
$metadata_c150 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 102
    CruisingAltitude = 14000
    MaxAirspeed = 141
}
$metadata_c150 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\c150\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\c150\Models\cessna150.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\c150\c150.fbx" --livery "C:\Users\domin\Documents\FlightGearData\c150\Models\c150.png" 

# -----------------------------------------------------------------------------
# Aircraft: c172r
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\c172r"
$metadata_c172r = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 122
    CruisingAltitude = 14000
    MaxAirspeed = 163
}
$metadata_c172r | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\c172r\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\c172r\Models\c172-dpm.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\c172r\c172r.fbx" --livery "C:\Users\domin\Documents\FlightGearData\c172r\Models\c172-01.rgb" 

# -----------------------------------------------------------------------------
# Aircraft: c182s
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\c182s"
$metadata_c182s = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 145
    CruisingAltitude = 18000
    MaxAirspeed = 150
}
$metadata_c182s | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\c182s\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\c182s\Models\c182s.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\c182s\c182s.fbx" --livery "C:\Users\domin\Documents\FlightGearData\c182s\Models\Default.png" 

# -----------------------------------------------------------------------------
# Aircraft: c210-family
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\c210-family"
$metadata_c210_family = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 196
    CruisingAltitude = 17300
    MaxAirspeed = 204
}
$metadata_c210_family | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\c210-family\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\c210-family\Models\p210n.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\c210-family\c210-family.fbx" --livery "C:\Users\domin\Documents\FlightGearData\c210-family\Models\p210n-fuselage.png" 

# -----------------------------------------------------------------------------
# Aircraft: Caproni-Ca161
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Caproni-Ca161"
$metadata_Caproni_Ca161 = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 340
    CruisingAltitude = 50000
    MaxAirspeed = 445
}
$metadata_Caproni_Ca161 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Caproni-Ca161\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Caproni-Ca161\Models\ca161.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Caproni-Ca161\Caproni-Ca161.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Caproni-Ca161\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Caproni-Stipa
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Caproni-Stipa"
$metadata_Caproni_Stipa = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 70
    CruisingAltitude = 3000
    MaxAirspeed = 81
}
$metadata_Caproni_Stipa | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Caproni-Stipa\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Caproni-Stipa\Models\stipa.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Caproni-Stipa\Caproni-Stipa.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Caproni-Stipa\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Carreidas
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Carreidas"
$metadata_Carreidas = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 486
    CruisingAltitude = 42000
    MaxAirspeed = 486
}
$metadata_Carreidas | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Carreidas\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Carreidas\Models\carreidas.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Carreidas\Carreidas.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Carreidas\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Casa-212
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Casa-212"
$metadata_Casa_212 = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 170
    CruisingAltitude = 10000
    MaxAirspeed = 200
}
$metadata_Casa_212 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Casa-212\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Casa-212\Models\casa212.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Casa-212\Casa-212.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Casa-212\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Cessna-180
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-180"
$metadata_Cessna_180 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 143
    CruisingAltitude = 19600
    MaxAirspeed = 148
}
$metadata_Cessna_180 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-180\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Cessna-180\Models\cessna180.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-180\Cessna-180.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Cessna-180\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Cessna-195
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-195"
$metadata_Cessna_195 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 148
    CruisingAltitude = 18300
    MaxAirspeed = 156
}
$metadata_Cessna_195 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-195\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Cessna-195\Models\cessna195.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-195\Cessna-195.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Cessna-195\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Cessna-208-Caravan
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-208-Caravan"
$metadata_Cessna_208_Caravan = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 186
    CruisingAltitude = 25000
    MaxAirspeed = 186
}
$metadata_Cessna_208_Caravan | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-208-Caravan\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Cessna-208-Caravan\Models\caravan.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-208-Caravan\Cessna-208-Caravan.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Cessna-208-Caravan\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Cessna-421-Golden-Eagle
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-421-Golden-Eagle"
$metadata_Cessna_421_Golden_Eagle = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 240
    CruisingAltitude = 30200
    MaxAirspeed = 256
}
$metadata_Cessna_421_Golden_Eagle | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-421-Golden-Eagle\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Cessna-421-Golden-Eagle\Models\c421.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-421-Golden-Eagle\Cessna-421-Golden-Eagle.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Cessna-421-Golden-Eagle\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Cessna-L19
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-L19"
$metadata_Cessna_L19 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 96
    CruisingAltitude = 18500
    MaxAirspeed = 100
}
$metadata_Cessna_L19 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-L19\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Cessna-L19\Models\L19.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Cessna-L19\Cessna-L19.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Cessna-L19\Models\texture.png" 

# -----------------------------------------------------------------------------
# Aircraft: Cessna337
# -----------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Cessna337"
$metadata_Cessna337 = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 170
    CruisingAltitude = 13100
    MaxAirspeed = 173
}
$metadata_Cessna337 | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Cessna337\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Cessna337\Models\Cessna337_Skymaster.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Cessna337\Cessna337.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Cessna337\Models\Textures\livery_EC-ISD.png"

#
# Aircraft Processing Pipeline
#
# This script processes each aircraft model, creates metadata, and generates FBX files.
#

# --- ch47 (Boeing CH-47 Chinook) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\ch47"
$metadata = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 1
    IsFixedWing = 0
    CruisingAirspeed = 160
    CruisingAltitude = 15000
    MaxAirspeed = 170
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\ch47\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\ch47\Models\ch47.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\ch47\ch47.fbx" --livery "C:\Users\domin\Documents\FlightGearData\ch47\Models\paint1.png"

# --- ch53e (Sikorsky CH-53E Super Stallion) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\ch53e"
$metadata = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 1
    IsFixedWing = 0
    CruisingAirspeed = 150
    CruisingAltitude = 18500
    MaxAirspeed = 170
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\ch53e\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\ch53e\Models\ch53e.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\ch53e\ch53e.fbx" --livery "C:\Users\domin\Documents\FlightGearData\ch53e\Models\TextureMain.png" --exclude "null.ac" "pilot.ac" "head.ac" "interior.ac" "panel.ac"

# --- CH650 (Zenith CH 650) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\CH650"
$metadata = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 100
    CruisingAltitude = 12000
    MaxAirspeed = 135
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\CH650\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\CH650\Models\ch650.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\CH650\CH650.fbx" --livery "C:\Users\domin\Documents\FlightGearData\CH650\Models\exterior.png"

# --- CH750STOL (Zenith CH 750 STOL) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\CH750STOL"
$metadata = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 87
    CruisingAltitude = 12000
    MaxAirspeed = 96
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\CH750STOL\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\CH750STOL\Models\ch750stol.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\CH750STOL\CH750STOL.fbx" --livery "C:\Users\domin\Documents\FlightGearData\CH750STOL\Models\exterior.png"

# --- Cirrus-SR22 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Cirrus-SR22"
$metadata = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 183
    CruisingAltitude = 17500
    MaxAirspeed = 205
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Cirrus-SR22\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Cirrus-SR22\Models\sr22.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Cirrus-SR22\Cirrus-SR22.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Cirrus-SR22\Models\texture.png"

# --- Citation (Cessna Citation II) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Citation"
$metadata = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 403
    CruisingAltitude = 43000
    MaxAirspeed = 420
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Citation\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Citation\Models\Citation-II.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Citation\Citation.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Citation\Models\Liveries\blue-black-grey.png" --exclude "cbpanel.ac" "enginepanel.ac" "firepanel.ac" "flightdeck.ac" "gearpanel.ac" "cabin.ac"

# --- Citation-Bravo (Cessna Citation Bravo) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Citation-Bravo"
$metadata = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 405
    CruisingAltitude = 45000
    MaxAirspeed = 420
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Citation-Bravo\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Citation-Bravo\Models\bravo.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Citation-Bravo\Citation-Bravo.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Citation-Bravo\Models\Paint1.png" --exclude "cabin.ac" "flightdeck.ac"

# --- CitationX (Cessna Citation X) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\CitationX"
$metadata = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 528
    CruisingAltitude = 51000
    MaxAirspeed = 536
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\CitationX\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\CitationX\Models\CitationX.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\CitationX\CitationX.fbx" --livery "C:\Users\domin\Documents\FlightGearData\CitationX\Models\livery1.png" --exclude "cabin.ac" "flightdeck.ac" "panel1.ac" "pedestal.ac" "shadow.ac"

# --- Coanda-1910 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Coanda-1910"
$metadata = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 0 
    CruisingAltitude = 0
    MaxAirspeed = 0 
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Coanda-1910\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Coanda-1910\Models\coanda1910.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Coanda-1910\Coanda-1910.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Coanda-1910\Models\texture.png" --exclude "shadow.ac"

# --- colditz (Colditz Cock Glider) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\colditz"
$metadata = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 0 
    CruisingAltitude = 0
    MaxAirspeed = 0
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\colditz\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\colditz\Models\colditz.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\colditz\colditz.fbx" --livery "C:\Users\domin\Documents\FlightGearData\colditz\Models\wood-med.rgb"

# --- Commonwealth-Ca-12 (CAC Boomerang) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Commonwealth-Ca-12"
$metadata = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 165
    CruisingAltitude = 15000
    MaxAirspeed = 260
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Commonwealth-Ca-12\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Commonwealth-Ca-12\Models\ca12.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Commonwealth-Ca-12\Commonwealth-Ca-12.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Commonwealth-Ca-12\Models\texture.png"

# --- ComperSwift (Comper Swift) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\ComperSwift"
$metadata = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 120
    CruisingAltitude = 10000
    MaxAirspeed = 140
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\ComperSwift\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\ComperSwift\Models\ComperSwift-000-043.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\ComperSwift\ComperSwift.fbx" --livery "C:\Users\domin\Documents\FlightGearData\ComperSwift\Models\ComperSwift-tx-00.rgb"

# --- Concorde ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Concorde"
$metadata = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 1173
    CruisingAltitude = 60000
    MaxAirspeed = 1350
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Concorde\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Concorde\Models\concorde.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Concorde\Concorde.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Concorde\Models\concorde.png"

# --- Convair-C-131 (Convair C-131 Samaritan) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Convair-C-131"
$metadata = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 221
    CruisingAltitude = 16000
    MaxAirspeed = 255
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Convair-C-131\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Convair-C-131\Models\c131.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Convair-C-131\Convair-C-131.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Convair-C-131\Models\texture.png"

# --- Convair-XFY-1-Pogo ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Convair-XFY-1-Pogo"
$metadata = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 400
    CruisingAltitude = 20000
    MaxAirspeed = 610
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Convair-XFY-1-Pogo\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Convair-XFY-1-Pogo\Models\pogo.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Convair-XFY-1-Pogo\Convair-XFY-1-Pogo.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Convair-XFY-1-Pogo\Models\texture.png"

# --- couzinet70 (Couzinet 70) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\couzinet70"
$metadata = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 140
    CruisingAltitude = 10000
    MaxAirspeed = 174
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\couzinet70\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\couzinet70\Models\couzinet70.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\couzinet70\couzinet70.fbx" --livery "C:\Users\domin\Documents\FlightGearData\couzinet70\Models\texture.png"

# --- cri-cri (Colomban Cri-cri) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\cri-cri"
$metadata = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 100
    CruisingAltitude = 12000
    MaxAirspeed = 137
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\cri-cri\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\cri-cri\Models\MC-15.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\cri-cri\cri-cri.fbx" --livery "C:\Users\domin\Documents\FlightGearData\cri-cri\Models\panel.rgb"

# --- CRJ-200 (Bombardier CRJ200) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\CRJ-200"
$metadata = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 424
    CruisingAltitude = 37000
    MaxAirspeed = 459
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\CRJ-200\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\CRJ-200\Models\crj-200.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\CRJ-200\CRJ-200.fbx" --livery "C:\Users\domin\Documents\FlightGearData\CRJ-200\Models\Liveries\ASH.png" --exclude "cockpit.ac" "flightdeck.ac" "interior.ac"

# --- CRJ700-family (Bombardier CRJ700/900/1000) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\CRJ700-family"
$metadata = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 447
    CruisingAltitude = 41000
    MaxAirspeed = 473
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\CRJ700-family\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\CRJ700-family\Models\CRJ700.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\CRJ700-family\CRJ700.fbx" --livery "C:\Users\domin\Documents\FlightGearData\CRJ700-family\Models\Liveries\CRJ700\ASH.png" --exclude "CRJ700-engine.ac" "CRJ700-maingear.ac" "CRJ700-nosegear.ac" "CRJ700-flightdeck.ac"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\CRJ700-family\Models\CRJ900.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\CRJ700-family\CRJ900.fbx" --livery "C:\Users\domin\Documents\FlightGearData\CRJ700-family\Models\Liveries\CRJ900\SKW.png" --exclude "CRJ700-engine.ac" "CRJ700-maingear.ac" "CRJ700-nosegear.ac" "CRJ700-flightdeck.ac"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\CRJ700-family\Models\CRJ1000.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\CRJ700-family\CRJ1000.fbx" --livery "C:\Users\domin\Documents\FlightGearData\CRJ700-family\Models\Liveries\CRJ1000\BZH.png" --exclude "CRJ700-engine.ac" "CRJ700-maingear.ac" "CRJ700-nosegear.ac" "CRJ700-flightdeck.ac"

# --- Curtiss-Jenny (Curtiss JN-4 Jenny) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Curtiss-Jenny"
$metadata = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 60
    CruisingAltitude = 6500
    MaxAirspeed = 75
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Curtiss-Jenny\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Curtiss-Jenny\Models\jenny.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Curtiss-Jenny\Curtiss-Jenny.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Curtiss-Jenny\Models\texture.png"

# --- Curtiss-Model-F ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Curtiss-Model-F"
$metadata = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 60
    CruisingAltitude = 4500
    MaxAirspeed = 69
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Curtiss-Model-F\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Curtiss-Model-F\Models\modelf.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Curtiss-Model-F\Curtiss-Model-F.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Curtiss-Model-F\Models\texture.png"

# --- Curtiss-P40 (Curtiss P-40 Warhawk) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Curtiss-P40"
$metadata = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 270
    CruisingAltitude = 15000
    MaxAirspeed = 360
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Curtiss-P40\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Curtiss-P40\Models\p40.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Curtiss-P40\Curtiss-P40.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Curtiss-P40\Models\texture.png"

# --- Curtiss-Wright-X-19 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Curtiss-Wright-X-19"
$metadata = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 348
    CruisingAltitude = 23600
    MaxAirspeed = 400
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Curtiss-Wright-X-19\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Curtiss-Wright-X-19\Models\x19.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Curtiss-Wright-X-19\Curtiss-Wright-X-19.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Curtiss-Wright-X-19\Models\texture.png"

# --- D510 (Dewoitine D.510) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\D510"
$metadata = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 173
    CruisingAltitude = 26000
    MaxAirspeed = 217
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\D510\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\D510\Models\d510.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\D510\D510.fbx" --livery "C:\Users\domin\Documents\FlightGearData\D510\Models\texture.png"

# --- D520 (Dewoitine D.520) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\D520"
$metadata = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 252
    CruisingAltitude = 19685
    MaxAirspeed = 332
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\D520\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\D520\Models\d520.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\D520\D520.fbx" --livery "C:\Users\domin\Documents\FlightGearData\D520\Models\texture.png"

# --- DA40 (Diamond DA40 Star) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\DA40"
$metadata = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 135
    CruisingAltitude = 16400
    MaxAirspeed = 164
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\DA40\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\DA40\Models\da40.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\DA40\DA40.fbx" --livery "C:\Users\domin\Documents\FlightGearData\DA40\Models\DA40NG.png"

# --- daher-tbm-family (Daher TBM 900) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\daher-tbm-family"
$metadata = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 252
    CruisingAltitude = 31000
    MaxAirspeed = 330
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\daher-tbm-family\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\daher-tbm-family\Models\tbm-900.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\daher-tbm-family\daher-tbm-900.fbx" --livery "C:\Users\domin\Documents\FlightGearData\daher-tbm-family\Models\tbm-900.png"

# --- DaSH ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\DaSH"
$metadata = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 0 # Human-powered
    CruisingAltitude = 0
    MaxAirspeed = 0
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\DaSH\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\DaSH\Models\flyer.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\DaSH\DaSH.fbx" --livery "C:\Users\domin\Documents\FlightGearData\DaSH\Models\dash.png"

# --- Dassault-Mystere-IV ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Dassault-Mystere-IV"
$metadata = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 486
    CruisingAltitude = 40000
    MaxAirspeed = 594
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Dassault-Mystere-IV\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Dassault-Mystere-IV\Models\mystereIV.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Dassault-Mystere-IV\Dassault-Mystere-IV.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Dassault-Mystere-IV\Models\texture.png"

# --- Dauphin (Aérospatiale SA 365 Dauphin) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Dauphin"
$metadata = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 1
    IsFixedWing = 0
    CruisingAirspeed = 155
    CruisingAltitude = 19685
    MaxAirspeed = 165
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Dauphin\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Dauphin\Models\dauphin.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Dauphin\Dauphin.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Dauphin\Models\texture.png"

# --- Deperdussin ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Deperdussin"
$metadata = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 100
    CruisingAltitude = 5000
    MaxAirspeed = 130
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Deperdussin\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Deperdussin\Models\deperdussin.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Deperdussin\Deperdussin.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Deperdussin\Models\texture.png"

# --- DerKleineUhu (Schneider SG-38 Schulgleiter) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\DerKleineUhu"
$metadata = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 25
    CruisingAltitude = 1000
    MaxAirspeed = 59
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\DerKleineUhu\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\DerKleineUhu\Models\DerKleineUhu.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\DerKleineUhu\DerKleineUhu.fbx" --livery "C:\Users\domin\Documents\FlightGearData\DerKleineUhu\Models\RedWhite.rgb"

# --- Deuche (Citroën 2CV) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Deuche"
$metadata = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 0 # It's a car
    CruisingAirspeed = 60
    CruisingAltitude = 0
    MaxAirspeed = 71
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Deuche\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Deuche\Models\deudeuche.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Deuche\Deuche.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Deuche\Models\texture.png"

# --- DG-1000 (DG Flugzeugbau DG-1000) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\DG-1000"
$metadata = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 65
    CruisingAltitude = 10000
    MaxAirspeed = 146
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\DG-1000\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\DG-1000\Models\dg1000.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\DG-1000\DG-1000.fbx" --livery "C:\Users\domin\Documents\FlightGearData\DG-1000\Models\dg1000.png"

# --- Diamond-Da42 (Diamond DA42 Twin Star) ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Diamond-Da42"
$metadata = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 160
    CruisingAltitude = 18000
    MaxAirspeed = 194
}
$metadata | ConvertTo-Json | Out-File -FilePath "C:\Users\domin\Documents\TruthTracks\Planes\Diamond-Da42\metadata.json" -Encoding utf8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Diamond-Da42\Models\da42.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Diamond-Da42\Diamond-Da42.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Diamond-Da42\Models\texture.png"


#
# Aircraft Processing Pipeline Script
# Generated by Gemini
#

# --- Aircraft: DO-228 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\DO-228"
$metadata_DO_228 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 190
    CruisingAltitude = 28000
    MaxAirspeed = 223
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\DO-228\metadata.json" -Value $metadata_DO_228
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\DO-228\Models\do228.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\DO-228\DO-228_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\DO-228\Models\texture.png"

# --- Aircraft: DO-26 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\DO-26"
$metadata_DO_26 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 165
    CruisingAltitude = 20000
    MaxAirspeed = 181
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\DO-26\metadata.json" -Value $metadata_DO_26
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\DO-26\Models\do26.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\DO-26\DO-26_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\DO-26\Models\texture.png" --exclude "shadow.ac"

# --- Aircraft: DO-28 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\DO-28"
$metadata_DO_28 = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 150
    CruisingAltitude = 20000
    MaxAirspeed = 175
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\DO-28\metadata.json" -Value $metadata_DO_28
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\DO-28\Models\do28.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\DO-28\DO-28_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\DO-28\Models\texture.png"

# --- Aircraft: DO-335 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\DO-335"
$metadata_DO_335 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 360
    CruisingAltitude = 26000
    MaxAirspeed = 413
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\DO-335\metadata.json" -Value $metadata_DO_335
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\DO-335\Models\do335.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\DO-335\DO-335_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\DO-335\Models\texture.png"

# --- Aircraft: DO-X ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\DO-X"
$metadata_DO_X = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 92
    CruisingAltitude = 1640
    MaxAirspeed = 110
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\DO-X\metadata.json" -Value $metadata_DO_X
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\DO-X\Models\dox.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\DO-X\DO-X_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\DO-X\Models\texture.png" --exclude "shadow.ac" "dox-copilot.ac"

# --- Aircraft: do228 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\do228-212"
$metadata_do228_212 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 190
    CruisingAltitude = 28000
    MaxAirspeed = 223
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\do228-212\metadata.json" -Value $metadata_do228_212
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\do228\Models\do228.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\do228-212\do228-212_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\do228\Models\do228.png"

# --- Aircraft: Douglas-Dc3 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Douglas-Dc3"
$metadata_Douglas_Dc3 = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 180
    CruisingAltitude = 21000
    MaxAirspeed = 206
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Douglas-Dc3\metadata.json" -Value $metadata_Douglas_Dc3
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Douglas-Dc3\Models\dc-3.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Douglas-Dc3\Douglas-Dc3_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Douglas-Dc3\Models\texture.png" --exclude "copilot.ac"

# --- Aircraft: Douglas-Dc5 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Douglas-Dc5"
$metadata_Douglas_Dc5 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 175
    CruisingAltitude = 23700
    MaxAirspeed = 202
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Douglas-Dc5\metadata.json" -Value $metadata_Douglas_Dc5
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Douglas-Dc5\Models\dc5.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Douglas-Dc5\Douglas-Dc5_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Douglas-Dc5\Models\texture.png"

# --- Aircraft: Douglas-Dolphin ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Douglas-Dolphin"
$metadata_Douglas_Dolphin = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 120
    CruisingAltitude = 14500
    MaxAirspeed = 128
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Douglas-Dolphin\metadata.json" -Value $metadata_Douglas_Dolphin
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Douglas-Dolphin\Models\dolphin.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Douglas-Dolphin\Douglas-Dolphin_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Douglas-Dolphin\Models\texture.png" --exclude "shadow.ac"

# --- Aircraft: F-35B ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\F-35B"
$metadata_F35B = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 595
    CruisingAltitude = 40000
    MaxAirspeed = 1060
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\F-35B\metadata.json" -Value $metadata_F35B
# Note: F-35B file paths are based on the prompt's example structure as it was not in the provided file tree.
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\F-35B\Models\F-35B.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\F-35B\F-35B_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\F-35B\Liveries\default.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: F-106-dart ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\F-106-dart"
$metadata_F106_dart = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 565
    CruisingAltitude = 53000
    MaxAirspeed = 1325
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\F-106-dart\metadata.json" -Value $metadata_F106_dart
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\F-106-dart\Models\f106.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\F-106-dart\F-106-dart_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\F-106-dart\Models\texture.png"

# --- Aircraft: ec130 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\ec130"
$metadata_ec130 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 1
    IsFixedWing = 0
    CruisingAirspeed = 128
    CruisingAltitude = 15000
    MaxAirspeed = 155
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\ec130\metadata.json" -Value $metadata_ec130
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\ec130\Models\ec130b4_t2.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\ec130\ec130_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\ec130\Models\default.png" --exclude "mgpu.ac" "ladder.ac"

# --- Aircraft: ec135 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\ec135"
$metadata_ec135 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 1
    IsFixedWing = 0
    CruisingAirspeed = 137
    CruisingAltitude = 12000
    MaxAirspeed = 155
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\ec135\metadata.json" -Value $metadata_ec135
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\ec135\Models\ec135.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\ec135\ec135_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\ec135\Models\WhiteDefault.png" --exclude "HEMS.ac"

# --- Aircraft: Embraer-ERJ-145 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Embraer-ERJ-145"
$metadata_Embraer_ERJ_145 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 450
    CruisingAltitude = 37000
    MaxAirspeed = 470
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Embraer-ERJ-145\metadata.json" -Value $metadata_Embraer_ERJ_145
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Embraer-ERJ-145\Models\erj145.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Embraer-ERJ-145\Embraer-ERJ-145_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Embraer-ERJ-145\Models\texture.png"

# --- Aircraft: ercoupe ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\ercoupe"
$metadata_ercoupe = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 83
    CruisingAltitude = 11000
    MaxAirspeed = 96
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\ercoupe\metadata.json" -Value $metadata_ercoupe
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\ercoupe\Models\ercoupe.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\ercoupe\ercoupe_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\ercoupe\Models\ercoupe-cab.png" --exclude "cockpit.ac"

# --- Aircraft: Etrich-Taube ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Etrich-Taube"
$metadata_Etrich_Taube = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 55
    CruisingAltitude = 6000
    MaxAirspeed = 64
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Etrich-Taube\metadata.json" -Value $metadata_Etrich_Taube
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Etrich-Taube\Models\taube.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Etrich-Taube\Etrich-Taube_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Etrich-Taube\Models\texture.png"


# Create Base Output Directory
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes"

# Aircraft: fa223 (Focke-Achgelis Fa 223 Drache)
$aircraftName = "fa223"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 1,
  "IsFixedWing": 0,
  "CruisingAirspeed": 90,
  "CruisingAltitude": 8000,
  "MaxAirspeed": 100
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\fa223\Models\fa223.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\fa223\Models\fa223-1.png" --exclude "rotor.ac"

# Aircraft: Fairchild-C119
$aircraftName = "Fairchild-C119"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 175,
  "CruisingAltitude": 10000,
  "MaxAirspeed": 250
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Fairchild-C119\Models\c119.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Fairchild-C119\Models\texture.png"

# Aircraft: Fairchild-Metroliner
$aircraftName = "Fairchild-Metroliner"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 250,
  "CruisingAltitude": 25000,
  "MaxAirspeed": 310
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Fairchild-Metroliner\Models\metroliner.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Fairchild-Metroliner\Models\texture.png"

# Aircraft: Fairey-Gannet
$aircraftName = "Fairey-Gannet"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 217,
  "CruisingAltitude": 25000,
  "MaxAirspeed": 270
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Fairey-Gannet\Models\gannet.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Fairey-Gannet\Models\texture.png"

# Aircraft: Falcon-50
$aircraftName = "Falcon-50"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 480,
  "CruisingAltitude": 41000,
  "MaxAirspeed": 515
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Falcon-50\Models\falcon50.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Falcon-50\Models\texture.png"

# Aircraft: Farman-III
$aircraftName = "Farman-III"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 30,
  "CruisingAltitude": 500,
  "MaxAirspeed": 35
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Farman-III\Models\farmanboxkite.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Farman-III\Models\farmaniii.png"

# Aircraft: Farman-IV
$aircraftName = "Farman-IV"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 35,
  "CruisingAltitude": 500,
  "MaxAirspeed": 40
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Farman-IV\Models\farman-IV.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Farman-IV\Models\texture.png"

# Aircraft: Fiat-G55
$aircraftName = "Fiat-G55"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 290,
  "CruisingAltitude": 25000,
  "MaxAirspeed": 340
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Fiat-G55\Models\g55.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Fiat-G55\Models\texture.png"

# Aircraft: Fiat-G91
$aircraftName = "Fiat-G91"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 450,
  "CruisingAltitude": 30000,
  "MaxAirspeed": 580
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Fiat-G91\Models\g91.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Fiat-G91\Models\texture.png"

# Aircraft: FK9MK2
$aircraftName = "FK9MK2"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 100,
  "CruisingAltitude": 8000,
  "MaxAirspeed": 120
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\FK9MK2\Models\fk9mk2.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\FK9MK2\Models\texture.png"

# Aircraft: fkdr1 (Fokker Dr.I)
$aircraftName = "fkdr1"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 75,
  "CruisingAltitude": 10000,
  "MaxAirspeed": 100
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\fkdr1\Models\dr1.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\fkdr1\Models\dr1.rgb"

# Aircraft: FMA-IA36-Condor
$aircraftName = "FMA-IA36-Condor"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 430,
  "CruisingAltitude": 33000,
  "MaxAirspeed": 497
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\FMA-IA36-Condor\Models\FMA-IA36.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\FMA-IA36-Condor\Models\texture.png"

# Aircraft: Fokker-Eindecker-EIII
$aircraftName = "Fokker-Eindecker-EIII"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 70,
  "CruisingAltitude": 9000,
  "MaxAirspeed": 87
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Fokker-Eindecker-EIII\Models\eiii.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Fokker-Eindecker-EIII\Models\texture.png"

# Aircraft: Fokker-F.27
$aircraftName = "Fokker-F.27"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 220,
  "CruisingAltitude": 20000,
  "MaxAirspeed": 259
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Fokker-F.27\Models\f27.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Fokker-F.27\Models\texture.png"

# Aircraft: Fokker-G1
$aircraftName = "Fokker-G1"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 240,
  "CruisingAltitude": 20000,
  "MaxAirspeed": 290
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Fokker-G1\Models\g1.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Fokker-G1\Models\texture.png"

# Aircraft: fokker100
$aircraftName = "fokker100"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 0,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 430,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 461
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\fokker100\Models\f100\fokker100.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\fokker100\Models\f100\Liveries\KLC.png"

# Aircraft: fokker50
$aircraftName = "fokker50"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 285,
  "CruisingAltitude": 25000,
  "MaxAirspeed": 300
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\fokker50\Models\fokker50.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\fokker50\Models\fokker50.png"

# Aircraft: Ford-Trimotor
$aircraftName = "Ford-Trimotor"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 100,
  "CruisingAltitude": 10000,
  "MaxAirspeed": 130
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Ford-Trimotor\Models\trimotor.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Ford-Trimotor\Models\texture.png"

# Aircraft: Fouga-Magister
$aircraftName = "Fouga-Magister"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 350,
  "CruisingAltitude": 30000,
  "MaxAirspeed": 386
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Fouga-Magister\Models\fouga.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Fouga-Magister\Models\texture.png"

# Aircraft: fw189 (Focke-Wulf Fw 189 Uhu)
$aircraftName = "fw189"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 180,
  "CruisingAltitude": 15000,
  "MaxAirspeed": 217
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\fw189\Models\fw189.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\fw189\Models\texture.png"

# Aircraft: fw190 (Focke-Wulf Fw 190)
$aircraftName = "fw190"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 290,
  "CruisingAltitude": 20000,
  "MaxAirspeed": 408
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\fw190\Models\fw190a8.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\fw190\Models\fw190-1.png"

# Aircraft: Fw200 (Focke-Wulf Fw 200 Condor)
$aircraftName = "Fw200"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 170,
  "CruisingAltitude": 14000,
  "MaxAirspeed": 194
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Fw200\Models\fw200.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Fw200\Models\texture.png"

# Aircraft: Gee-Bee
$aircraftName = "Gee-Bee"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 220,
  "CruisingAltitude": 5000,
  "MaxAirspeed": 254
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Gee-Bee\Models\geebee.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Gee-Bee\Models\texture.png"

# Aircraft: Gloster-Gladiator
$aircraftName = "Gloster-Gladiator"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 210,
  "CruisingAltitude": 15000,
  "MaxAirspeed": 257
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Gloster-Gladiator\Models\gladiator.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Gloster-Gladiator\Models\texture.png"

# Aircraft: Gloster-Meteor
$aircraftName = "Gloster-Meteor"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 350,
  "CruisingAltitude": 35000,
  "MaxAirspeed": 521
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Gloster-Meteor\Models\gloster-meteor.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Gloster-Meteor\Models\texture.png"

# Aircraft: Grob-G115
$aircraftName = "Grob-G115"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 100,
  "CruisingAltitude": 10000,
  "MaxAirspeed": 185
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Grob-G115\Models\g115.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Grob-G115\Models\texture.png"

# Aircraft: Grumman-EA-6B-Prowler
$aircraftName = "Grumman-EA-6B-Prowler"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 418,
  "CruisingAltitude": 37600,
  "MaxAirspeed": 566
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Grumman-EA-6B-Prowler\Models\ea-6b.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Grumman-EA-6B-Prowler\Models\texture.png"

# Aircraft: H-21C-Shawnee
$aircraftName = "H-21C-Shawnee"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 1,
  "IsFixedWing": 0,
  "CruisingAirspeed": 98,
  "CruisingAltitude": 10000,
  "MaxAirspeed": 127
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\H-21C-Shawnee\Models\h21c-base-v1.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\H-21C-Shawnee\Models\Textures\fusev2.rgb"

# Aircraft: H1-Racer
$aircraftName = "H1-Racer"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 0,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 260,
  "CruisingAltitude": 15000,
  "MaxAirspeed": 305
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\H1-Racer\Models\h1.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\H1-Racer\Models\texture.png"

# Aircraft: H4-Hercules
$aircraftName = "H4-Hercules"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 196,
  "CruisingAltitude": 10000,
  "MaxAirspeed": 218
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\H4-Hercules\Models\h4-hercules.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\H4-Hercules\Models\texture.png"

# Aircraft: Handley-Page-Halifax
$aircraftName = "Handley-Page-Halifax"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 213,
  "CruisingAltitude": 20000,
  "MaxAirspeed": 248
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Handley-Page-Halifax\Models\halifax.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Handley-Page-Halifax\Models\texture.png"

# Aircraft: Harrier
$aircraftName = "harrier"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 1,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 550,
  "CruisingAltitude": 40000,
  "MaxAirspeed": 635
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\harrier\Models\harrier.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\harrier\Models\harrier.rgb"

# Aircraft: Harrier-GR1
$aircraftName = "Harrier-GR1"
$aircraftDir = "C:\Users\domin\Documents\TruthTracks\Planes\$aircraftName"
New-Item -ItemType Directory -Force -Path $aircraftDir
$metadataContent = @'
{
  "IsMilitary": 1,
  "IsInService": 0,
  "IsHelicopter": 0,
  "IsFixedWing": 1,
  "CruisingAirspeed": 450,
  "CruisingAltitude": 40000,
  "MaxAirspeed": 617
}
'@
Set-Content -Path (Join-Path $aircraftDir "metadata.json") -Value $metadataContent
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Harrier-GR1\Models\Harrier-GR1.ac" --output "$aircraftDir\${aircraftName}_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Harrier-GR1\Models\Liveries\Default.png"


# Create the base output directory if it doesn't exist
$baseOutputDir = "C:\Users\domin\Documents\TruthTracks\Planes"
if (-not (Test-Path -Path $baseOutputDir)) {
    New-Item -ItemType Directory -Path $baseOutputDir
    Write-Host "Created base directory: $baseOutputDir"
}

# --- Aircraft: Harrier-GR3 ---
$aircraftName_HarrierGR3 = "Harrier-GR3"
$outputDir_HarrierGR3 = Join-Path $baseOutputDir $aircraftName_HarrierGR3
New-Item -ItemType Directory -Path $outputDir_HarrierGR3 -Force

$metadata_HarrierGR3 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 450
    CruisingAltitude = 36000
    MaxAirspeed = 635
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_HarrierGR3 "metadata.json") -Value $metadata_HarrierGR3

Write-Host "Processing Harrier-GR3..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Harrier-GR3\Models\Harrier-GR3.ac" --output "$outputDir_HarrierGR3\${aircraftName_HarrierGR3}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Harrier-GR3\Models\Liveries\Default.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Hawker-Siddeley-Nimrod ---
$aircraftName_Nimrod = "Hawker-Siddeley-Nimrod"
$outputDir_Nimrod = Join-Path $baseOutputDir $aircraftName_Nimrod
New-Item -ItemType Directory -Path $outputDir_Nimrod -Force

$metadata_Nimrod = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 420 
    CruisingAltitude = 36000
    MaxAirspeed = 500
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_Nimrod "metadata.json") -Value $metadata_Nimrod

Write-Host "Processing Hawker-Siddeley-Nimrod..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Hawker-Siddeley-Nimrod\Models\nimrod.ac" --output "$outputDir_Nimrod\${aircraftName_Nimrod}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Hawker-Siddeley-Nimrod\Models\texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Heinkel-He-111 ---
$aircraftName_He111 = "Heinkel-He-111"
$outputDir_He111 = Join-Path $baseOutputDir $aircraftName_He111
New-Item -ItemType Directory -Path $outputDir_He111 -Force

$metadata_He111 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 220
    CruisingAltitude = 21000
    MaxAirspeed = 238
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_He111 "metadata.json") -Value $metadata_He111

Write-Host "Processing Heinkel-He-111..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Heinkel-He-111\Models\he111.ac" --output "$outputDir_He111\${aircraftName_He111}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Heinkel-He-111\Models\texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Heinkel-He-162 ---
$aircraftName_He162 = "Heinkel-He-162"
$outputDir_He162 = Join-Path $baseOutputDir $aircraftName_He162
New-Item -ItemType Directory -Path $outputDir_He162 -Force

$metadata_He162 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 460
    CruisingAltitude = 26000
    MaxAirspeed = 491
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_He162 "metadata.json") -Value $metadata_He162

Write-Host "Processing Heinkel-He-162..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\He162\Models\He162.ac" --output "$outputDir_He162\${aircraftName_He162}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\He162\Models\He162-fuselage.rgb" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Heinkel-He-111Z ---
$aircraftName_He111Z = "Heinkel-He-111Z"
$outputDir_He111Z = Join-Path $baseOutputDir $aircraftName_He111Z
New-Item -ItemType Directory -Path $outputDir_He111Z -Force

$metadata_He111Z = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 230
    CruisingAltitude = 20000
    MaxAirspeed = 247
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_He111Z "metadata.json") -Value $metadata_He111Z

Write-Host "Processing Heinkel-He-111Z..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Heinkel-He-111Z\Models\he111Z.ac" --output "$outputDir_He111Z\${aircraftName_He111Z}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Heinkel-He-111Z\Models\texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Heinkel-He-177 ---
$aircraftName_He177 = "Heinkel-He-177"
$outputDir_He177 = Join-Path $baseOutputDir $aircraftName_He177
New-Item -ItemType Directory -Path $outputDir_He177 -Force

$metadata_He177 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 260
    CruisingAltitude = 26000
    MaxAirspeed = 303
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_He177 "metadata.json") -Value $metadata_He177

Write-Host "Processing Heinkel-He-177..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Heinkel-He-177\Models\he177.ac" --output "$outputDir_He177\${aircraftName_He177}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Heinkel-He-177\Models\texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Heinkel-He-178 ---
$aircraftName_He178 = "Heinkel-He-178"
$outputDir_He178 = Join-Path $baseOutputDir $aircraftName_He178
New-Item -ItemType Directory -Path $outputDir_He178 -Force

$metadata_He178 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 315
    CruisingAltitude = 16000
    MaxAirspeed = 380
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_He178 "metadata.json") -Value $metadata_He178

Write-Host "Processing Heinkel-He-178..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Heinkel-He-178\Models\he178.ac" --output "$outputDir_He178\${aircraftName_He178}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Heinkel-He-178\Models\texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Heinkel-He-280 ---
$aircraftName_He280 = "Heinkel-He-280"
$outputDir_He280 = Join-Path $baseOutputDir $aircraftName_He280
New-Item -ItemType Directory -Path $outputDir_He280 -Force

$metadata_He280 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 430
    CruisingAltitude = 25000
    MaxAirspeed = 497
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_He280 "metadata.json") -Value $metadata_He280

Write-Host "Processing Heinkel-He-280..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Heinkel-He-280\Models\he280.ac" --output "$outputDir_He280\${aircraftName_He280}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Heinkel-He-280\Models\texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Heston-Type5 ---
$aircraftName_Heston = "Heston-Type5"
$outputDir_Heston = Join-Path $baseOutputDir $aircraftName_Heston
New-Item -ItemType Directory -Path $outputDir_Heston -Force

$metadata_Heston = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 265
    CruisingAltitude = 15000
    MaxAirspeed = 300
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_Heston "metadata.json") -Value $metadata_Heston

Write-Host "Processing Heston-Type5..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Heston-Type5\Models\heston.ac" --output "$outputDir_Heston\${aircraftName_Heston}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Heston-Type5\Models\texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: HK36 ---
$aircraftName_HK36 = "HK36"
$outputDir_HK36 = Join-Path $baseOutputDir $aircraftName_HK36
New-Item -ItemType Directory -Path $outputDir_HK36 -Force

$metadata_HK36 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 100
    CruisingAltitude = 12000
    MaxAirspeed = 146
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_HK36 "metadata.json") -Value $metadata_HK36

Write-Host "Processing HK36..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\HK36\Models\hk36.ac" --output "$outputDir_HK36\${aircraftName_HK36}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\HK36\Models\hk36.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: HM-14 ---
$aircraftName_HM14 = "HM-14"
$outputDir_HM14 = Join-Path $baseOutputDir $aircraftName_HM14
New-Item -ItemType Directory -Path $outputDir_HM14 -Force

$metadata_HM14 = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 54
    CruisingAltitude = 8000
    MaxAirspeed = 65
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_HM14 "metadata.json") -Value $metadata_HM14

Write-Host "Processing HM-14..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\HM-14\Models\hm-14.ac" --output "$outputDir_HM14\${aircraftName_HM14}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\HM-14\Models\texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Hornet ---
$aircraftName_Hornet = "Hornet"
$outputDir_Hornet = Join-Path $baseOutputDir $aircraftName_Hornet
New-Item -ItemType Directory -Path $outputDir_Hornet -Force

$metadata_Hornet = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 1
    IsFixedWing = 0
    CruisingAirspeed = 150
    CruisingAltitude = 15000
    MaxAirspeed = 167
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_Hornet "metadata.json") -Value $metadata_Hornet

Write-Host "Processing Hornet..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Hornet\Models\hornet2.ac" --output "$outputDir_Hornet\${aircraftName_Hornet}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Hornet\Models\texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Horsa ---
$aircraftName_Horsa = "Horsa"
$outputDir_Horsa = Join-Path $baseOutputDir $aircraftName_Horsa
New-Item -ItemType Directory -Path $outputDir_Horsa -Force

$metadata_Horsa = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 100
    CruisingAltitude = 10000
    MaxAirspeed = 150
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_Horsa "metadata.json") -Value $metadata_Horsa

Write-Host "Processing Horsa..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Horsa\Models\horsa.ac" --output "$outputDir_Horsa\${aircraftName_Horsa}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Horsa\Models\horsa-1.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Horten-Ho-IX ---
$aircraftName_HoIX = "Horten-Ho-IX"
$outputDir_HoIX = Join-Path $baseOutputDir $aircraftName_HoIX
New-Item -ItemType Directory -Path $outputDir_HoIX -Force

$metadata_HoIX = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 490
    CruisingAltitude = 40000
    MaxAirspeed = 607
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_HoIX "metadata.json") -Value $metadata_HoIX

Write-Host "Processing Horten-Ho-IX..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Horten-Ho-IX\Models\ho-ix.ac" --output "$outputDir_HoIX\${aircraftName_HoIX}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Horten-Ho-IX\Models\texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: HU-16A-Albatross ---
$aircraftName_Albatross = "HU-16A-Albatross"
$outputDir_Albatross = Join-Path $baseOutputDir $aircraftName_Albatross
New-Item -ItemType Directory -Path $outputDir_Albatross -Force

$metadata_Albatross = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 130
    CruisingAltitude = 10000
    MaxAirspeed = 205
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_Albatross "metadata.json") -Value $metadata_Albatross

Write-Host "Processing HU-16A-Albatross..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\HU-16A-Albatross\Models\HU-16A\HU-16A.ac" --output "$outputDir_Albatross\${aircraftName_Albatross}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\HU-16A-Albatross\Models\HU-16A\Default.png" --exclude "wheels.ac" "landing-gear.ac"

# --- Aircraft: Hughes-XF11 ---
$aircraftName_XF11 = "Hughes-XF11"
$outputDir_XF11 = Join-Path $baseOutputDir $aircraftName_XF11
New-Item -ItemType Directory -Path $outputDir_XF11 -Force

$metadata_XF11 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 300
    CruisingAltitude = 30000
    MaxAirspeed = 450
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_XF11 "metadata.json") -Value $metadata_XF11

Write-Host "Processing Hughes-XF11..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Hughes-XF11\Models\xf11.ac" --output "$outputDir_XF11\${aircraftName_XF11}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Hughes-XF11\Models\texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Hunter ---
$aircraftName_Hunter = "Hunter"
$outputDir_Hunter = Join-Path $baseOutputDir $aircraftName_Hunter
New-Item -ItemType Directory -Path $outputDir_Hunter -Force

$metadata_Hunter = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 520
    CruisingAltitude = 40000
    MaxAirspeed = 620
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_Hunter "metadata.json") -Value $metadata_Hunter

Write-Host "Processing Hunter..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Hunter\Models\hunter-ga11.ac" --output "$outputDir_Hunter\${aircraftName_Hunter}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Hunter\Models\hunter-tx-01.rgb" --exclude "gear.ac" "landing-gear.ac"

# --- Aircraft: HUP-Retriever ---
$aircraftName_HUP = "HUP-Retriever"
$outputDir_HUP = Join-Path $baseOutputDir $aircraftName_HUP
New-Item -ItemType Directory -Path $outputDir_HUP -Force

$metadata_HUP = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 1
    IsFixedWing = 0
    CruisingAirspeed = 70
    CruisingAltitude = 8000
    MaxAirspeed = 91
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_HUP "metadata.json") -Value $metadata_HUP

Write-Host "Processing HUP-Retriever..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\HUP-Retriever\Models\piasecki_hup.ac" --output "$outputDir_HUP\${aircraftName_HUP}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\HUP-Retriever\Models\Textures\HUP-Fusev1.rgb" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Hurricane ---
$aircraftName_Hurricane = "Hurricane"
$outputDir_Hurricane = Join-Path $baseOutputDir $aircraftName_Hurricane
New-Item -ItemType Directory -Path $outputDir_Hurricane -Force

$metadata_Hurricane = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 210
    CruisingAltitude = 20000
    MaxAirspeed = 280
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_Hurricane "metadata.json") -Value $metadata_Hurricane

Write-Host "Processing Hurricane..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Hurricane\Models\hurricane-ver-29.ac" --output "$outputDir_Hurricane\${aircraftName_Hurricane}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Hurricane\Models\hurricane-iib.rgb" --exclude "gear.ac" "landing-gear.ac"

# --- Aircraft: Icaro_MRX13 ---
$aircraftName_Icaro = "Icaro_MRX13"
$outputDir_Icaro = Join-Path $baseOutputDir $aircraftName_Icaro
New-Item -ItemType Directory -Path $outputDir_Icaro -Force

$metadata_Icaro = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 25
    CruisingAltitude = 5000
    MaxAirspeed = 50
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_Icaro "metadata.json") -Value $metadata_Icaro

Write-Host "Processing Icaro_MRX13..."
# Note: Livery is not specified as it seems to be included in the model data.
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Icaro_MRX13\Models\MRX13.ac" --output "$outputDir_Icaro\${aircraftName_Icaro}_Default.fbx" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: IL-76 ---
$aircraftName_IL76 = "IL-76"
$outputDir_IL76 = Join-Path $baseOutputDir $aircraftName_IL76
New-Item -ItemType Directory -Path $outputDir_IL76 -Force

$metadata_IL76 = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 430
    CruisingAltitude = 39000
    MaxAirspeed = 486
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_IL76 "metadata.json") -Value $metadata_IL76

Write-Host "Processing IL-76..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\IL-76\Models\il76.ac" --output "$outputDir_IL76\${aircraftName_IL76}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\IL-76\Models\texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: J3Cub ---
$aircraftName_J3Cub = "J3Cub"
$outputDir_J3Cub = Join-Path $baseOutputDir $aircraftName_J3Cub
New-Item -ItemType Directory -Path $outputDir_J3Cub -Force

$metadata_J3Cub = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 65
    CruisingAltitude = 12000
    MaxAirspeed = 76
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_J3Cub "metadata.json") -Value $metadata_J3Cub

Write-Host "Processing J3Cub..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\J3Cub\Models\J3Cub.ac" --output "$outputDir_J3Cub\${aircraftName_J3Cub}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\J3Cub\Models\Liveries\default-texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: JA37 ---
$aircraftName_JA37 = "JA37"
$outputDir_JA37 = Join-Path $baseOutputDir $aircraftName_JA37
New-Item -ItemType Directory -Path $outputDir_JA37 -Force

$metadata_JA37 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 539
    CruisingAltitude = 36000
    MaxAirspeed = 1386
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_JA37 "metadata.json") -Value $metadata_JA37

Write-Host "Processing JA37..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\JA37\Models\ja37.ac" --output "$outputDir_JA37\${aircraftName_JA37}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\JA37\Models\j37_texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Jaguar-GR1 ---
$aircraftName_Jaguar = "Jaguar-GR1"
$outputDir_Jaguar = Join-Path $baseOutputDir $aircraftName_Jaguar
New-Item -ItemType Directory -Path $outputDir_Jaguar -Force

$metadata_Jaguar = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 490
    CruisingAltitude = 30000
    MaxAirspeed = 917
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_Jaguar "metadata.json") -Value $metadata_Jaguar

Write-Host "Processing Jaguar-GR1..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Jaguar-GR1\Models\jaguar.ac" --output "$outputDir_Jaguar\${aircraftName_Jaguar}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Jaguar-GR1\Models\Liveries\2048x2048\6-squadron-raf-Coningsby.jpg" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Junkers-W34 ---
$aircraftName_W34 = "Junkers-W34"
$outputDir_W34 = Join-Path $baseOutputDir $aircraftName_W34
New-Item -ItemType Directory -Path $outputDir_W34 -Force

$metadata_W34 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 135
    CruisingAltitude = 10000
    MaxAirspeed = 162
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_W34 "metadata.json") -Value $metadata_W34

Write-Host "Processing Junkers-W34..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Junkers-W34\Models\w34.ac" --output "$outputDir_W34\${aircraftName_W34}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Junkers-W34\Models\texture.png" --exclude "Gear.ac" "landing-gear.ac"

# --- Aircraft: Ka-50 ---
$aircraftName_Ka50 = "Ka-50"
$outputDir_Ka50 = Join-Path $baseOutputDir $aircraftName_Ka50
New-Item -ItemType Directory -Path $outputDir_Ka50 -Force

$metadata_Ka50 = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 1
    IsFixedWing = 0
    CruisingAirspeed = 146
    CruisingAltitude = 13000
    MaxAirspeed = 168
} | ConvertTo-Json -Compress
Set-Content -Path (Join-Path $outputDir_Ka50 "metadata.json") -Value $metadata_Ka50

Write-Host "Processing Ka-50..."
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Ka-50\Models\ka50.ac" --output "$outputDir_Ka50\${aircraftName_Ka50}_Default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Ka-50\Models\texture.png" --exclude "Gear.ac" "landing-gear.ac"


Write-Host "--- All aircraft processing commands have been generated. ---"


# Create the base directory for all processed aircraft
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\"

# --- Aircraft: l39 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\l39"
$metadata_l39 = @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 350,
    "CruisingAltitude": 36000,
    "MaxAirspeed": 405
}
"@
$metadata_l39 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\l39\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\l39\Models\l39.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\l39\l39_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\l39\Models\default.png" --exclude "strobe.ac"

# --- Aircraft: La-5 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\La-5"
$metadata_La_5 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 285,
    "CruisingAltitude": 16400,
    "MaxAirspeed": 345
}
"@
$metadata_La_5 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\La-5\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\La-5\Models\la5.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\La-5\La-5_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\La-5\Models\texture.png" --exclude

# --- Aircraft: Lancair-235 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lancair-235"
$metadata_Lancair_235 = @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 143,
    "CruisingAltitude": 14000,
    "MaxAirspeed": 165
}
"@
$metadata_Lancair_235 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lancair-235\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lancair-235\Models\lancair235.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lancair-235\Lancair-235_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lancair-235\Models\texture.png" --exclude

# --- Aircraft: LATE-29 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\LATE-29"
$metadata_LATE_29 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 124,
    "CruisingAltitude": 15000,
    "MaxAirspeed": 146
}
"@
$metadata_LATE_29 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\LATE-29\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\LATE-29\Models\late29.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\LATE-29\LATE-29_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\LATE-29\Models\texture.png" --exclude

# --- Aircraft: Late-523 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Late-523"
$metadata_Late_523 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 146,
    "CruisingAltitude": 13120,
    "MaxAirspeed": 186
}
"@
$metadata_Late_523 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Late-523\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Late-523\Models\late523.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Late-523\Late-523_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Late-523\Models\texture.png" --exclude

# --- Aircraft: Late-631 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Late-631"
$metadata_Late_631 = @"
{
    "IsMilitary": 0,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 215,
    "CruisingAltitude": 13120,
    "MaxAirspeed": 260
}
"@
$metadata_Late_631 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Late-631\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Late-631\Models\late631.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Late-631\Late-631_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Late-631\Models\texture.png" --exclude

# --- Aircraft: Leduc-022 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Leduc-022"
$metadata_Leduc_022 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 540,
    "CruisingAltitude": 50000,
    "MaxAirspeed": 620
}
"@
$metadata_Leduc_022 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Leduc-022\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Leduc-022\Models\leduc022.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Leduc-022\Leduc-022_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Leduc-022\Models\texture.png" --exclude "shadow.ac"

# --- Aircraft: Let-L410 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Let-L410"
$metadata_Let_L410 = @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 180,
    "CruisingAltitude": 14000,
    "MaxAirspeed": 218
}
"@
$metadata_Let_L410 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Let-L410\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Let-L410\Models\l410.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Let-L410\Let-L410_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Let-L410\Models\texture.png" --exclude

# --- Aircraft: Libelle ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Libelle"
$metadata_Libelle = @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 54,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 135
}
"@
$metadata_Libelle | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Libelle\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Libelle\Models\stdlibelle.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Libelle\Libelle_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Libelle\Models\libelle.png" --exclude

# --- Aircraft: Lightning ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lightning"
$metadata_Lightning = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 500,
    "CruisingAltitude": 40000,
    "MaxAirspeed": 1150
}
"@
$metadata_Lightning | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lightning\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lightning\Models\lightning-f1a.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lightning\Lightning_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lightning\Models\f.1a_wheel.rgb" --exclude "chute.ac" "gear.ac"

# --- Aircraft: Lionceau ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lionceau"
$metadata_Lionceau = @"
{
    "IsMilitary": 0,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 113,
    "CruisingAltitude": 12000,
    "MaxAirspeed": 130
}
"@
$metadata_Lionceau | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lionceau\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lionceau\Models\lionceau.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lionceau\Lionceau_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lionceau\Models\texture.png" --exclude

# --- Aircraft: Liore-et-Olivier-LeO-H46 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Liore-et-Olivier-LeO-H46"
$metadata_Liore_et_Olivier_LeO_H46 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 108,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 130
}
"@
$metadata_Liore_et_Olivier_LeO_H46 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Liore-et-Olivier-LeO-H46\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Liore-et-Olivier-LeO-H46\Models\h46.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Liore-et-Olivier-LeO-H46\Liore-et-Olivier-LeO-H46_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Liore-et-Olivier-LeO-H46\Models\texture.png" --exclude

# --- Aircraft: Lockheed-Martin-FA-22A-Raptor ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-Martin-FA-22A-Raptor"
$metadata_Lockheed_Martin_FA_22A_Raptor = @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 870,
    "CruisingAltitude": 50000,
    "MaxAirspeed": 1286
}
"@
$metadata_Lockheed_Martin_FA_22A_Raptor | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-Martin-FA-22A-Raptor\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lockheed-Martin-FA-22A-Raptor\Models\Lockheed-Martin-FA-22A-Raptor.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-Martin-FA-22A-Raptor\Lockheed-Martin-FA-22A-Raptor_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lockheed-Martin-FA-22A-Raptor\Liveries\x.png" --exclude

# --- Aircraft: Lockheed-NF104 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-NF104"
$metadata_Lockheed_NF104 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 450,
    "CruisingAltitude": 50000,
    "MaxAirspeed": 1150
}
"@
$metadata_Lockheed_NF104 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-NF104\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lockheed-NF104\Models\F-104C.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-NF104\Lockheed-NF104_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lockheed-NF104\Models\metal.png" --exclude "chute.ac"

# --- Aircraft: Lockheed-NF104A ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-NF104A"
$metadata_Lockheed_NF104A = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 450,
    "CruisingAltitude": 50000,
    "MaxAirspeed": 1150
}
"@
$metadata_Lockheed_NF104A | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-NF104A\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lockheed-NF104A\Models\nf104a.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-NF104A\Lockheed-NF104A_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lockheed-NF104A\Models\texture.png" --exclude

# --- Aircraft: Lockheed-P-2-Neptune ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-P-2-Neptune"
$metadata_Lockheed_P_2_Neptune = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 156,
    "CruisingAltitude": 15000,
    "MaxAirspeed": 315
}
"@
$metadata_Lockheed_P_2_Neptune | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-P-2-Neptune\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lockheed-P-2-Neptune\Models\p2v.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-P-2-Neptune\Lockheed-P-2-Neptune_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lockheed-P-2-Neptune\Models\texture.png" --exclude

# --- Aircraft: Lockheed-P38 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-P38"
$metadata_Lockheed_P38 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 240,
    "CruisingAltitude": 25000,
    "MaxAirspeed": 414
}
"@
$metadata_Lockheed_P38 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-P38\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lockheed-P38\Models\p38.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-P38\Lockheed-P38_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lockheed-P38\Models\texture.png" --exclude

# --- Aircraft: Lockheed-S3-Viking ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-S3-Viking"
$metadata_Lockheed_S3_Viking = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 390,
    "CruisingAltitude": 35000,
    "MaxAirspeed": 450
}
"@
$metadata_Lockheed_S3_Viking | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-S3-Viking\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lockheed-S3-Viking\Models\s3.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-S3-Viking\Lockheed-S3-Viking_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lockheed-S3-Viking\Models\texture.png" --exclude

# --- Aircraft: Lockheed-SR71 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-SR71"
$metadata_Lockheed_SR71 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 1825,
    "CruisingAltitude": 85000,
    "MaxAirspeed": 2200
}
"@
$metadata_Lockheed_SR71 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-SR71\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lockheed-SR71\Models\sr71.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-SR71\Lockheed-SR71_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lockheed-SR71\Models\texture.png" --exclude

# --- Aircraft: Lockheed-U-2S ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-U-2S"
$metadata_Lockheed_U_2S = @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 350,
    "CruisingAltitude": 70000,
    "MaxAirspeed": 434
}
"@
$metadata_Lockheed_U_2S | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-U-2S\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lockheed-U-2S\Models\u-2s.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-U-2S\Lockheed-U-2S_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lockheed-U-2S\Models\texture.png" --exclude "shadow.ac"

# --- Aircraft: Lockheed-Vega ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-Vega"
$metadata_Lockheed_Vega = @"
{
    "IsMilitary": 0,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 161,
    "CruisingAltitude": 16000,
    "MaxAirspeed": 185
}
"@
$metadata_Lockheed_Vega | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-Vega\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lockheed-Vega\Models\vega.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed-Vega\Lockheed-Vega_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lockheed-Vega\Models\texture.png" --exclude

# --- Aircraft: Lockheed1049 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed1049"
$metadata_Lockheed1049 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 280,
    "CruisingAltitude": 23000,
    "MaxAirspeed": 320
}
"@
$metadata_Lockheed1049 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed1049\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lockheed1049\Models\Lockheed1049.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed1049\Lockheed1049_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lockheed1049\Models\L1049TWA-default.rgb" --exclude

# --- Aircraft: Lockheed1049h ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed1049h"
$metadata_Lockheed1049h = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 280,
    "CruisingAltitude": 23000,
    "MaxAirspeed": 330
}
"@
$metadata_Lockheed1049h | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed1049h\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lockheed1049h\Models\mesh_airframe.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lockheed1049h\Lockheed1049h_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lockheed1049h\Models\txt_livery_fuselage.rgb" --exclude "mesh_cockpit.ac" "mesh_pedestal.ac" "mesh_props.ac"

# --- Aircraft: Long-EZ ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Long-EZ"
$metadata_Long_EZ = @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 127,
    "CruisingAltitude": 12000,
    "MaxAirspeed": 160
}
"@
$metadata_Long_EZ | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Long-EZ\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Long-EZ\Models\long-ez.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Long-EZ\Long-EZ_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Long-EZ\Models\texture.png" --exclude

# --- Aircraft: LS1-c ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\LS1-c"
$metadata_LS1_c = @"
{
    "IsMilitary": 0,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 60,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 135
}
"@
$metadata_LS1_c | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\LS1-c\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\LS1-c\Models\ls1c.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\LS1-c\LS1-c_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\LS1-c\Models\ls1c.png" --exclude

# --- Aircraft: LS4 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\LS4"
$metadata_LS4 = @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 60,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 146
}
"@
$metadata_LS4 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\LS4\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\LS4\Models\ls4.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\LS4\LS4_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\LS4\Models\ls4.png" --exclude

# --- Aircraft: LS8 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\LS8"
$metadata_LS8 = @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 75,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 146
}
"@
$metadata_LS8 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\LS8\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\LS8\Models\ls8.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\LS8\LS8_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\LS8\Models\ls8.png" --exclude

# --- Aircraft: Lynx-WG13 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lynx-WG13"
$metadata_Lynx_WG13 = @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 1,
    "IsFixedWing": 0,
    "CruisingAirspeed": 130,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 175
}
"@
$metadata_Lynx_WG13 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Lynx-WG13\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Lynx-WG13\Models\lynx.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Lynx-WG13\Lynx-WG13_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Lynx-WG13\Models\Textures\fuse.rgb" --exclude

# --- Aircraft: M-4-Bison-A ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\M-4-Bison-A"
$metadata_M_4_Bison_A = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 460,
    "CruisingAltitude": 40000,
    "MaxAirspeed": 512
}
"@
$metadata_M_4_Bison_A | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\M-4-Bison-A\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\M-4-Bison-A\Models\m4.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\M-4-Bison-A\M-4-Bison-A_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\M-4-Bison-A\Models\texture.png" --exclude

# --- Aircraft: M-XE ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\M-XE"
$metadata_M_XE = @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 1,
    "IsFixedWing": 0,
    "CruisingAirspeed": 85,
    "CruisingAltitude": 8000,
    "MaxAirspeed": 100
}
"@
$metadata_M_XE | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\M-XE\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\M-XE\Models\m-xe.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\M-XE\M-XE_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\M-XE\Models\texture.png" --exclude

# --- Aircraft: Macchi-Castoldi-MC72 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Macchi-Castoldi-MC72"
$metadata_Macchi_Castoldi_MC72 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 350,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 379
}
"@
$metadata_Macchi_Castoldi_MC72 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Macchi-Castoldi-MC72\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Macchi-Castoldi-MC72\Models\mc72.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Macchi-Castoldi-MC72\Macchi-Castoldi-MC72_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Macchi-Castoldi-MC72\Models\texture.png" --exclude "shadow.ac"

# --- Aircraft: Macchi-M33 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Macchi-M33"
$metadata_Macchi_M33 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 140,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 160
}
"@
$metadata_Macchi_M33 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Macchi-M33\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Macchi-M33\Models\m33.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Macchi-M33\Macchi-M33_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Macchi-M33\Models\texture.png" --exclude

# --- Aircraft: Martin-Baker-MB5 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Martin-Baker-MB5"
$metadata_Martin_Baker_MB5 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 320,
    "CruisingAltitude": 20000,
    "MaxAirspeed": 390
}
"@
$metadata_Martin_Baker_MB5 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Martin-Baker-MB5\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Martin-Baker-MB5\Models\mb5.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Martin-Baker-MB5\Martin-Baker-MB5_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Martin-Baker-MB5\Models\texture.png" --exclude

# --- Aircraft: MB326 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\MB326"
$metadata_MB326 = @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 350,
    "CruisingAltitude": 30000,
    "MaxAirspeed": 444
}
"@
$metadata_MB326 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\MB326\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\MB326\Models\MB326.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\MB326\MB326_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\MB326\Models\top-blue.png" --exclude "wheels.ac"

# --- Aircraft: MC-15 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\MC-15"
$metadata_MC_15 = @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 108,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 124
}
"@
$metadata_MC_15 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\MC-15\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\MC-15\Models\mc-15.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\MC-15\MC-15_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\MC-15\Models\mc-15.png" --exclude

# --- Aircraft: McDonnell-Douglas-T-45-Goshawk ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\McDonnell-Douglas-T-45-Goshawk"
$metadata_McDonnell_Douglas_T_45_Goshawk = @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 450,
    "CruisingAltitude": 30000,
    "MaxAirspeed": 540
}
"@
$metadata_McDonnell_Douglas_T_45_Goshawk | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\McDonnell-Douglas-T-45-Goshawk\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\McDonnell-Douglas-T-45-Goshawk\Models\t45.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\McDonnell-Douglas-T-45-Goshawk\McDonnell-Douglas-T-45-Goshawk_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\McDonnell-Douglas-T-45-Goshawk\Models\texture.png" --exclude

# --- Aircraft: McDonnell-F-4-Phantom ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\McDonnell-F-4-Phantom"
$metadata_McDonnell_F_4_Phantom = @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 506,
    "CruisingAltitude": 35000,
    "MaxAirspeed": 1280
}
"@
$metadata_McDonnell_F_4_Phantom | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\McDonnell-F-4-Phantom\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\McDonnell-F-4-Phantom\Models\f4.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\McDonnell-F-4-Phantom\McDonnell-F-4-Phantom_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\McDonnell-F-4-Phantom\Models\texture.png" --exclude

# --- Aircraft: MD-11 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\MD-11"
$metadata_MD_11 = @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 490,
    "CruisingAltitude": 35000,
    "MaxAirspeed": 523
}
"@
$metadata_MD_11 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\MD-11\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\MD-11\Models\MD-11-GE.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\MD-11\MD-11_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\MD-11\Models\MD-11.png" --exclude

# --- Aircraft: MD-312-Flamant ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\MD-312-Flamant"
$metadata_MD_312_Flamant = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 162,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 233
}
"@
$metadata_MD_312_Flamant | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\MD-312-Flamant\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\MD-312-Flamant\Models\md312.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\MD-312-Flamant\MD-312-Flamant_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\MD-312-Flamant\Models\texture.png" --exclude

# --- Aircraft: MD-80 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\MD-80"
$metadata_MD_80 = @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 450,
    "CruisingAltitude": 37000,
    "MaxAirspeed": 485
}
"@
$metadata_MD_80 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\MD-80\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\MD-80\Models\mesh_airframe.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\MD-80\MD-80_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\MD-80\Models\txt_fuselage.png" --exclude "mesh_cockpit.ac"

# --- Aircraft: ME-209-V1 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\ME-209-V1"
$metadata_ME_209_V1 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 380,
    "CruisingAltitude": 20000,
    "MaxAirspeed": 408
}
"@
$metadata_ME_209_V1 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\ME-209-V1\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\ME-209-V1\Models\me209v1.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\ME-209-V1\ME-209-V1_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\ME-209-V1\Models\texture.png" --exclude

# --- Aircraft: me163 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\me163"
$metadata_me163 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 500,
    "CruisingAltitude": 40000,
    "MaxAirspeed": 596
}
"@
$metadata_me163 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\me163\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\me163\Models\me163.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\me163\me163_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\me163\Models\me163-1.png" --exclude

# --- Aircraft: me323 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\me323"
$metadata_me323 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 135,
    "CruisingAltitude": 14000,
    "MaxAirspeed": 185
}
"@
$metadata_me323 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\me323\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\me323\Models\me323.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\me323\me323_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\me323\Models\me323-1.png" --exclude

# --- Aircraft: Messerschmitt-BF110 ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Messerschmitt-BF110"
$metadata_Messerschmitt_BF110 = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 260,
    "CruisingAltitude": 22000,
    "MaxAirspeed": 336
}
"@
$metadata_Messerschmitt_BF110 | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Messerschmitt-BF110\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Messerschmitt-BF110\Models\bf110.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Messerschmitt-BF110\Messerschmitt-BF110_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Messerschmitt-BF110\Models\texture.png" --exclude

# --- Aircraft: Messerschmitt-Libelle ---
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Messerschmitt-Libelle"
$metadata_Messerschmitt_Libelle = @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 135,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 168
}
"@
$metadata_Messerschmitt_Libelle | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Messerschmitt-Libelle\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Messerschmitt-Libelle\Models\libelle.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Messerschmitt-Libelle\Messerschmitt-Libelle_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Messerschmitt-Libelle\Models\texture.png" --exclude



# -------------------- Messerschmitt-P1101 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Messerschmitt-P1101" -Force
$metadata_p1101 = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 430
  CruisingAltitude = 35000
  MaxAirspeed = 641
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Messerschmitt-P1101\metadata.json" -Value $metadata_p1101
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Messerschmitt-P1101\Models\p1101.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Messerschmitt-P1101\Messerschmitt-P1101.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Messerschmitt-P1101\Models\texture.png" --exclude "shadow.ac"

# -------------------- MFI-9 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\MFI-9" -Force
$metadata_mfi9 = @{
  IsMilitary = 0
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 116
  CruisingAltitude = 14000
  MaxAirspeed = 147
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\MFI-9\metadata.json" -Value $metadata_mfi9
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\MFI-9\Models\MFI-9B.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\MFI-9\MFI-9.fbx" --livery "C:\Users\domin\Documents\FlightGearData\MFI-9\Liveries\SE-EFM-exterior.png" --exclude "propeller.ac"

# -------------------- MiG-15 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\MiG-15" -Force
$metadata_mig15 = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 540
  CruisingAltitude = 40000
  MaxAirspeed = 641
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\MiG-15\metadata.json" -Value $metadata_mig15
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\MiG-15\Models\MiG-15bis.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\MiG-15\MiG-15.fbx" --livery "C:\Users\domin\Documents\FlightGearData\MiG-15\Models\Liveries\USSR_211\Main_211.png"

# -------------------- MiG-21bis --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\MiG-21bis" -Force
$metadata_mig21 = @{
  IsMilitary = 1
  IsInService = 1
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 550
  CruisingAltitude = 40000
  MaxAirspeed = 1300
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\MiG-21bis\metadata.json" -Value $metadata_mig21
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\MiG-21bis\Models\MiG-21bis.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\MiG-21bis\MiG-21bis.fbx" --livery "C:\Users\domin\Documents\FlightGearData\MiG-21bis\Models\Liveries\Default.png" --exclude "Cockpit.ac"

# -------------------- Mig-29 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Mig-29" -Force
$metadata_mig29 = @{
  IsMilitary = 1
  IsInService = 1
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 870
  CruisingAltitude = 59000
  MaxAirspeed = 1518
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Mig-29\metadata.json" -Value $metadata_mig29
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Mig-29\Models\Mig-29.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Mig-29\Mig-29.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Mig-29\Models\Mig-29.rgb" --exclude "mesh_airframe.ac" "mesh_cockpit.ac" "mesh_lights.ac" "mesh_nozzleseg.ac" "mesh_reheat.ac" "nozzleseg.ac" "pipe.ac" "transparent.ac"

# -------------------- Mil-Mi-12 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Mil-Mi-12" -Force
$metadata_mi12 = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 1
  IsFixedWing = 0
  CruisingAirspeed = 129
  CruisingAltitude = 11000
  MaxAirspeed = 162
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Mil-Mi-12\metadata.json" -Value $metadata_mi12
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Mil-Mi-12\Models\mi12.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Mil-Mi-12\Mil-Mi-12.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Mil-Mi-12\Models\texture.png"

# -------------------- Mil-Mi-2 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Mil-Mi-2" -Force
$metadata_mi2 = @{
  IsMilitary = 1
  IsInService = 1
  IsHelicopter = 1
  IsFixedWing = 0
  CruisingAirspeed = 100
  CruisingAltitude = 12467
  MaxAirspeed = 113
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Mil-Mi-2\metadata.json" -Value $metadata_mi2
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Mil-Mi-2\Models\mi2.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Mil-Mi-2\Mil-Mi-2.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Mil-Mi-2\Models\texture.png"

# -------------------- Mil-Mi-24 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Mil-Mi-24" -Force
$metadata_mi24 = @{
  IsMilitary = 1
  IsInService = 1
  IsHelicopter = 1
  IsFixedWing = 0
  CruisingAirspeed = 140
  CruisingAltitude = 14750
  MaxAirspeed = 181
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Mil-Mi-24\metadata.json" -Value $metadata_mi24
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Mil-Mi-24\Models\mi24.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Mil-Mi-24\Mil-Mi-24.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Mil-Mi-24\Models\texture.png"

# -------------------- Mirage-2000 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Mirage-2000" -Force
$metadata_mirage2000 = @{
  IsMilitary = 1
  IsInService = 1
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 600
  CruisingAltitude = 50000
  MaxAirspeed = 1450
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Mirage-2000\metadata.json" -Value $metadata_mirage2000
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Mirage-2000\Models\m2000-5.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Mirage-2000\Mirage-2000.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Mirage-2000\Models\texture.png" --exclude "shadow.ac" "turbine.ac"

# -------------------- MirageG8 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\MirageG8" -Force
$metadata_mirageg8 = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 600
  CruisingAltitude = 50000
  MaxAirspeed = 1550
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\MirageG8\metadata.json" -Value $metadata_mirageg8
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\MirageG8\Models\mirageG8.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\MirageG8\MirageG8.fbx" --livery "C:\Users\domin\Documents\FlightGearData\MirageG8\Models\texture.png"

# -------------------- MirageIII --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\MirageIII" -Force
$metadata_mirageiii = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 500
  CruisingAltitude = 50000
  MaxAirspeed = 1460
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\MirageIII\metadata.json" -Value $metadata_mirageiii
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\MirageIII\Models\mirageIII.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\MirageIII\MirageIII.fbx" --livery "C:\Users\domin\Documents\FlightGearData\MirageIII\Models\texture.png"

# -------------------- Mirage_F1 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Mirage_F1" -Force
$metadata_miragef1 = @{
  IsMilitary = 1
  IsInService = 1
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 475
  CruisingAltitude = 36000
  MaxAirspeed = 1450
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Mirage_F1\metadata.json" -Value $metadata_miragef1
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Mirage_F1\Models\Mirage_F1.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Mirage_F1\Mirage_F1.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Mirage_F1\Models\fuselage.png"

# -------------------- Mitsubishi-J2M --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Mitsubishi-J2M" -Force
$metadata_j2m = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 216
  CruisingAltitude = 28870
  MaxAirspeed = 369
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Mitsubishi-J2M\metadata.json" -Value $metadata_j2m
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Mitsubishi-J2M\Models\j2m.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Mitsubishi-J2M\Mitsubishi-J2M.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Mitsubishi-J2M\Models\texture.png"

# -------------------- MRJ --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\MRJ" -Force
$metadata_mrj = @{
  IsMilitary = 0
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 447
  CruisingAltitude = 39000
  MaxAirspeed = 473
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\MRJ\metadata.json" -Value $metadata_mrj
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\MRJ\Models\MRJ90.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\MRJ\MRJ.fbx" --livery "C:\Users\domin\Documents\FlightGearData\MRJ\Models\ANA.png" --exclude "cabin.ac"

# -------------------- MS-406 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\MS-406" -Force
$metadata_ms406 = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 217
  CruisingAltitude = 13120
  MaxAirspeed = 302
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\MS-406\metadata.json" -Value $metadata_ms406
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\MS-406\Models\ms406.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\MS-406\MS-406.fbx" --livery "C:\Users\domin\Documents\FlightGearData\MS-406\Models\texture.png"

# -------------------- MS-760 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\MS-760" -Force
$metadata_ms760 = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 350
  CruisingAltitude = 30000
  MaxAirspeed = 432
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\MS-760\metadata.json" -Value $metadata_ms760
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\MS-760\Models\ms760.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\MS-760\MS-760.fbx" --livery "C:\Users\domin\Documents\FlightGearData\MS-760\Models\texture.png"

# -------------------- Nakajima-B5N --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Nakajima-B5N" -Force
$metadata_b5n = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 160
  CruisingAltitude = 12000
  MaxAirspeed = 235
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Nakajima-B5N\metadata.json" -Value $metadata_b5n
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Nakajima-B5N\Models\kate.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Nakajima-B5N\Nakajima-B5N.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Nakajima-B5N\Models\texture.png"

# -------------------- Nieuport-11 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Nieuport-11" -Force
$metadata_n11 = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 80
  CruisingAltitude = 10000
  MaxAirspeed = 97
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Nieuport-11\metadata.json" -Value $metadata_n11
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Nieuport-11\Models\nieuport11.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Nieuport-11\Nieuport-11.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Nieuport-11\Models\texture.png"

# -------------------- Nord-1405-Gerfaut-II --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Nord-1405-Gerfaut-II" -Force
$metadata_gerfaut = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 520
  CruisingAltitude = 36000
  MaxAirspeed = 1000
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Nord-1405-Gerfaut-II\metadata.json" -Value $metadata_gerfaut
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Nord-1405-Gerfaut-II\Models\gerfaut.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Nord-1405-Gerfaut-II\Nord-1405-Gerfaut-II.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Nord-1405-Gerfaut-II\Models\texture.png"

# -------------------- North-American-RA-5C-Vigilante --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\North-American-RA-5C-Vigilante" -Force
$metadata_ra5c = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 560
  CruisingAltitude = 52100
  MaxAirspeed = 1380
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\North-American-RA-5C-Vigilante\metadata.json" -Value $metadata_ra5c
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\North-American-RA-5C-Vigilante\Models\vigilante.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\North-American-RA-5C-Vigilante\North-American-RA-5C-Vigilante.fbx" --livery "C:\Users\domin\Documents\FlightGearData\North-American-RA-5C-Vigilante\Models\texture.png"

# -------------------- North-American-T6-Texan --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\North-American-T6-Texan" -Force
$metadata_t6 = @{
  IsMilitary = 1
  IsInService = 1
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 126
  CruisingAltitude = 15000
  MaxAirspeed = 181
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\North-American-T6-Texan\metadata.json" -Value $metadata_t6
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\North-American-T6-Texan\Models\t6.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\North-American-T6-Texan\North-American-T6-Texan.fbx" --livery "C:\Users\domin\Documents\FlightGearData\North-American-T6-Texan\Models\texture.png"

# -------------------- Northrop-P61 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Northrop-P61" -Force
$metadata_p61 = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 240
  CruisingAltitude = 25000
  MaxAirspeed = 366
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Northrop-P61\metadata.json" -Value $metadata_p61
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Northrop-P61\Models\p61.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Northrop-P61\Northrop-P61.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Northrop-P61\Models\texture.png"

# -------------------- Northrop-T38-Talon --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Northrop-T38-Talon" -Force
$metadata_t38 = @{
  IsMilitary = 1
  IsInService = 1
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 495
  CruisingAltitude = 50000
  MaxAirspeed = 858
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Northrop-T38-Talon\metadata.json" -Value $metadata_t38
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Northrop-T38-Talon\Models\t38talon.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Northrop-T38-Talon\Northrop-T38-Talon.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Northrop-T38-Talon\Models\texture.png"

# -------------------- Northrop-xb35 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Northrop-xb35" -Force
$metadata_xb35 = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 183
  CruisingAltitude = 40000
  MaxAirspeed = 391
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Northrop-xb35\metadata.json" -Value $metadata_xb35
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Northrop-xb35\Models\xb35.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Northrop-xb35\Northrop-xb35.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Northrop-xb35\Models\texture.png"

# -------------------- Northrop-yb49 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\Northrop-yb49" -Force
$metadata_yb49 = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 350
  CruisingAltitude = 40000
  MaxAirspeed = 493
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Northrop-yb49\metadata.json" -Value $metadata_yb49
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Northrop-yb49\Models\yb49.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Northrop-yb49\Northrop-yb49.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Northrop-yb49\Models\texture.png"

# -------------------- OH-58D --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\OH-58D" -Force
$metadata_oh58d = @{
  IsMilitary = 1
  IsInService = 1
  IsHelicopter = 1
  IsFixedWing = 0
  CruisingAirspeed = 115
  CruisingAltitude = 15000
  MaxAirspeed = 149
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\OH-58D\metadata.json" -Value $metadata_oh58d
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\OH-58D\Models\OH-58D.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\OH-58D\OH-58D.fbx" --livery "C:\Users\domin\Documents\FlightGearData\OH-58D\Models\Liveries\Default.png"

# -------------------- OV10 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\OV10" -Force
$metadata_ov10 = @{
  IsMilitary = 1
  IsInService = 1
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 223
  CruisingAltitude = 10000
  MaxAirspeed = 281
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\OV10\metadata.json" -Value $metadata_ov10
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\OV10\Models\BlkPony\OV10_NATO.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\OV10\OV10.fbx" --livery "C:\Users\domin\Documents\FlightGearData\OV10\Models\BlkPony\ov10_1.rgb" --exclude "mesh_props.ac"

# -------------------- P-38-Lightning --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\P-38-Lightning" -Force
$metadata_p38 = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 275
  CruisingAltitude = 25000
  MaxAirspeed = 414
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\P-38-Lightning\metadata.json" -Value $metadata_p38
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\P-38-Lightning\Models\P38-base.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\P-38-Lightning\P-38-Lightning.fbx" --livery "C:\Users\domin\Documents\FlightGearData\P-38-Lightning\Models\Textures\texture-us\texture-princ.rgb" --exclude "F-5B-nez.ac" "P-38L-nez.ac" "p38-cockpit.ac" "P38-Pilote.ac" "p38-train-complet.ac"

# -------------------- p51d --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\p51d" -Force
$metadata_p51d = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 250
  CruisingAltitude = 25000
  MaxAirspeed = 437
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\p51d\metadata.json" -Value $metadata_p51d
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\p51d\Models\P-51D-25NA.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\p51d\p51d.fbx" --livery "C:\Users\domin\Documents\FlightGearData\p51d\Models\default.png" --exclude "prop.ac" "propDisk.ac" "canopy.ac"

# -------------------- P47 --------------------
New-Item -ItemType Directory -Path "C:\Users\domin\Documents\TruthTracks\Planes\P47" -Force
$metadata_p47 = @{
  IsMilitary = 1
  IsInService = 0
  IsHelicopter = 0
  IsFixedWing = 1
  CruisingAirspeed = 350
  CruisingAltitude = 25000
  MaxAirspeed = 426
} | ConvertTo-Json -Compress
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\P47\metadata.json" -Value $metadata_p47
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\P47\Models\p47d-30.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\P47\P47.fbx" --livery "C:\Users\domin\Documents\FlightGearData\P47\Models\paint1.png"

# Create Base Output Directory
$baseOutputDir = "C:\Users\domin\Documents\TruthTracks\Planes"
if (-not (Test-Path -Path $baseOutputDir)) {
    New-Item -ItemType Directory -Path $baseOutputDir
}

# --- Aircraft: pa22 (Piper PA-22 Tri-Pacer) ---
$aircraftDir_pa22 = "$baseOutputDir\pa22"
New-Item -ItemType Directory -Path $aircraftDir_pa22 -Force
$metadata_pa22 = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 117
    CruisingAltitude = 10000
    MaxAirspeed = 125
}
Set-Content -Path "$aircraftDir_pa22\metadata.json" -Value ($metadata_pa22 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\pa22\Models\Tri-Pacer.ac" --output "$aircraftDir_pa22\pa22_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\pa22\Models\wings.png" --exclude "immat.ac"

# --- Aircraft: pa24-250 (Piper PA-24 Comanche) ---
$aircraftDir_pa24_250 = "$baseOutputDir\pa24-250"
New-Item -ItemType Directory -Path $aircraftDir_24_250 -Force
$metadata_pa24_250 = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 160
    CruisingAltitude = 12000
    MaxAirspeed = 180
}
Set-Content -Path "$aircraftDir_pa24_250\metadata.json" -Value ($metadata_pa24_250 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\pa24-250\Models\pa24-250.ac" --output "$aircraftDir_pa24_250\pa24-250_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\pa24-250\Models\wing2.rgb" --exclude "ControlLight.ac" "MarkerBeacons.ac" "StallWarnLight.ac" "WhiteLight1.ac"

# --- Aircraft: PA28 (Piper PA-28 Cherokee) ---
$aircraftDir_PA28 = "$baseOutputDir\PA28"
New-Item -ItemType Directory -Path $aircraftDir_PA28 -Force
$metadata_PA28 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 120
    CruisingAltitude = 10000
    MaxAirspeed = 140
}
Set-Content -Path "$aircraftDir_PA28\metadata.json" -Value ($metadata_PA28 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\PA28\Models\PA28-161.ac" --output "$aircraftDir_PA28\PA28_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\PA28\Models\PA28-WarriorII.png" --exclude "ap-sw.ac" "circuitbreakers.ac" "yoke-sw.ac" "yoke.ac"

# --- Aircraft: pa28-161 (Piper PA-28-161 Warrior II) ---
$aircraftDir_pa28_161 = "$baseOutputDir\pa28-161"
New-Item -ItemType Directory -Path $aircraftDir_pa28_161 -Force
$metadata_pa28_161 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 115
    CruisingAltitude = 10000
    MaxAirspeed = 135
}
Set-Content -Path "$aircraftDir_pa28_161\metadata.json" -Value ($metadata_pa28_161 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\pa28-161\Models\pa28-161.ac" --output "$aircraftDir_pa28_161\pa28-161_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\pa28-161\Models\wing2.rgb" --exclude "WhiteLight1.ac"

# --- Aircraft: PAC-CT4 (PAC CT/4 Airtrainer) ---
$aircraftDir_PAC_CT4 = "$baseOutputDir\PAC-CT4"
New-Item -ItemType Directory -Path $aircraftDir_PAC_CT4 -Force
$metadata_PAC_CT4 = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 130
    CruisingAltitude = 8000
    MaxAirspeed = 155
}
Set-Content -Path "$aircraftDir_PAC_CT4\metadata.json" -Value ($metadata_PAC_CT4 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\PAC-CT4\Models\pac-ct4.ac" --output "$aircraftDir_PAC_CT4\PAC-CT4_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\PAC-CT4\Models\texture.png" --exclude "interior.ac" "general_pilot.ac"

# --- Aircraft: PBY-Catalina (Consolidated PBY Catalina) ---
$aircraftDir_PBY_Catalina = "$baseOutputDir\PBY-Catalina"
New-Item -ItemType Directory -Path $aircraftDir_PBY_Catalina -Force
$metadata_PBY_Catalina = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 109
    CruisingAltitude = 10000
    MaxAirspeed = 196
}
Set-Content -Path "$aircraftDir_PBY_Catalina\metadata.json" -Value ($metadata_PBY_Catalina | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\PBY-Catalina\Models\pby6Ssnmp.ac" --output "$aircraftDir_PBY_Catalina\PBY-Catalina_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\PBY-Catalina\Models\Textures\texture-protcivil\Ailes.png" --exclude "catalina-capot-moteurV2.ac" "catalina-pilote-et-co.ac" "cde-ignition-pby.ac" "water-fall-vx.ac"

# --- Aircraft: PC-12 (Pilatus PC-12) ---
$aircraftDir_PC_12 = "$baseOutputDir\PC-12"
New-Item -ItemType Directory -Path $aircraftDir_PC_12 -Force
$metadata_PC_12 = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 280
    CruisingAltitude = 30000
    MaxAirspeed = 300
}
Set-Content -Path "$aircraftDir_PC_12\metadata.json" -Value ($metadata_PC_12 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\PC-12\Models\pc-12.ac" --output "$aircraftDir_PC_12\PC-12_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\PC-12\Models\texture.png" --exclude "cockpit.ac" "interior.ac" "general_pilot.ac"

# --- Aircraft: PC-21 (Pilatus PC-21) ---
$aircraftDir_PC_21 = "$baseOutputDir\PC-21"
New-Item -ItemType Directory -Path $aircraftDir_PC_21 -Force
$metadata_PC_21 = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 370
    CruisingAltitude = 25000
    MaxAirspeed = 425
}
Set-Content -Path "$aircraftDir_PC_21\metadata.json" -Value ($metadata_PC_21 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\PC-21\Models\PC-21.ac" --output "$aircraftDir_PC_21\PC-21_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\PC-21\Models\Liveries\Default.png" --exclude "Cockpit.ac" "fighter_default.ac"

# --- Aircraft: PC-6 (Pilatus PC-6 Porter) ---
$aircraftDir_PC_6 = "$baseOutputDir\PC-6"
New-Item -ItemType Directory -Path $aircraftDir_PC_6 -Force
$metadata_PC_6 = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 135
    CruisingAltitude = 10000
    MaxAirspeed = 150
}
Set-Content -Path "$aircraftDir_PC_6\metadata.json" -Value ($metadata_PC_6 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\PC-6\Models\porter.ac" --output "$aircraftDir_PC_6\PC-6_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\PC-6\Models\porter-1.png" --exclude "pilot.ac" "para.ac"

# --- Aircraft: PC-9M (Pilatus PC-9M) ---
$aircraftDir_PC_9M = "$baseOutputDir\PC-9M"
New-Item -ItemType Directory -Path $aircraftDir_PC_9M -Force
$metadata_PC_9M = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 280
    CruisingAltitude = 25000
    MaxAirspeed = 320
}
Set-Content -Path "$aircraftDir_PC_9M\metadata.json" -Value ($metadata_PC_9M | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\PC-9M\Models\PC-9M.ac" --output "$aircraftDir_PC_9M\PC-9M_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\PC-9M\Models\Liveries\Default.png" --exclude "Cockpit-PC9M.ac" "fighter_default.ac"

# --- Aircraft: PE-8 (Petlyakov Pe-8) ---
$aircraftDir_PE_8 = "$baseOutputDir\PE-8"
New-Item -ItemType Directory -Path $aircraftDir_PE_8 -Force
$metadata_PE_8 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 220
    CruisingAltitude = 20000
    MaxAirspeed = 275
}
Set-Content -Path "$aircraftDir_PE_8\metadata.json" -Value ($metadata_PE_8 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\PE-8\Models\pe8.ac" --output "$aircraftDir_PE_8\PE-8_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\PE-8\Models\texture.png" --exclude "interior.ac" "ww2_pilot_old.ac"

# --- Aircraft: Percival-Mew-Gull ---
$aircraftDir_Percival_Mew_Gull = "$baseOutputDir\Percival-Mew-Gull"
New-Item -ItemType Directory -Path $aircraftDir_Percival_Mew_Gull -Force
$metadata_Percival_Mew_Gull = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 200
    CruisingAltitude = 10000
    MaxAirspeed = 230
}
Set-Content -Path "$aircraftDir_Percival_Mew_Gull\metadata.json" -Value ($metadata_Percival_Mew_Gull | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Percival-Mew-Gull\Models\mewgull.ac" --output "$aircraftDir_Percival_Mew_Gull\Percival-Mew-Gull_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Percival-Mew-Gull\Models\texture.png" --exclude "interior.ac" "general_pilot.ac"

# --- Aircraft: Piaggio-P166 ---
$aircraftDir_Piaggio_P166 = "$baseOutputDir\Piaggio-P166"
New-Item -ItemType Directory -Path $aircraftDir_Piaggio_P166 -Force
$metadata_Piaggio_P166 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 175
    CruisingAltitude = 12000
    MaxAirspeed = 200
}
Set-Content -Path "$aircraftDir_Piaggio_P166\metadata.json" -Value ($metadata_Piaggio_P166 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Piaggio-P166\Models\p166.ac" --output "$aircraftDir_Piaggio_P166\Piaggio-P166_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Piaggio-P166\Models\texture.png" --exclude "interior.ac" "general_pilot.ac"

# --- Aircraft: Pilatus-PC-24 ---
$aircraftDir_Pilatus_PC_24 = "$baseOutputDir\Pilatus-PC-24"
New-Item -ItemType Directory -Path $aircraftDir_Pilatus_PC_24 -Force
$metadata_Pilatus_PC_24 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 440
    CruisingAltitude = 45000
    MaxAirspeed = 488
}
Set-Content -Path "$aircraftDir_Pilatus_PC_24\metadata.json" -Value ($metadata_Pilatus_PC_24 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Pilatus-PC-24\Models\pc24.ac" --output "$aircraftDir_Pilatus_PC_24\Pilatus-PC-24_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Pilatus-PC-24\Models\texture.png" --exclude "interior.ac" "liner_pilot.ac"

# --- Aircraft: Pilatus-PC-7 ---
$aircraftDir_Pilatus_PC_7 = "$baseOutputDir\Pilatus-PC-7"
New-Item -ItemType Directory -Path $aircraftDir_Pilatus_PC_7 -Force
$metadata_Pilatus_PC_7 = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 220
    CruisingAltitude = 20000
    MaxAirspeed = 270
}
Set-Content -Path "$aircraftDir_Pilatus_PC_7\metadata.json" -Value ($metadata_Pilatus_PC_7 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Pilatus-PC-7\Models\pc7.ac" --output "$aircraftDir_Pilatus_PC_7\Pilatus-PC-7_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Pilatus-PC-7\Models\texture.png" --exclude "interior.ac" "fighter_default.ac"

# --- Aircraft: Pioneer-200 ---
$aircraftDir_Pioneer_200 = "$baseOutputDir\Pioneer-200"
New-Item -ItemType Directory -Path $aircraftDir_Pioneer_200 -Force
$metadata_Pioneer_200 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 120
    CruisingAltitude = 10000
    MaxAirspeed = 145
}
Set-Content -Path "$aircraftDir_Pioneer_200\metadata.json" -Value ($metadata_Pioneer_200 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Pioneer-200\Models\pioneer200.ac" --output "$aircraftDir_Pioneer_200\Pioneer-200_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Pioneer-200\Models\texture.png" --exclude "interior.ac" "general_pilot.ac"

# --- Aircraft: Piper-PA-18 ---
$aircraftDir_Piper_PA_18 = "$baseOutputDir\Piper-PA-18"
New-Item -ItemType Directory -Path $aircraftDir_Piper_PA_18 -Force
$metadata_Piper_PA_18 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 100
    CruisingAltitude = 10000
    MaxAirspeed = 113
}
Set-Content -Path "$aircraftDir_Piper_PA_18\metadata.json" -Value ($metadata_Piper_PA_18 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Piper-PA-18\Models\pa18.ac" --output "$aircraftDir_Piper_PA_18\Piper-PA-18_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Piper-PA-18\Models\texture.png" --exclude "interior.ac" "general_pilot.ac" "immat.ac"

# --- Aircraft: Piper-PA-23 ---
$aircraftDir_Piper_PA_23 = "$baseOutputDir\Piper-PA-23"
New-Item -ItemType Directory -Path $aircraftDir_Piper_PA_23 -Force
$metadata_Piper_PA_23 = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 175
    CruisingAltitude = 12000
    MaxAirspeed = 190
}
Set-Content -Path "$aircraftDir_Piper_PA_23\metadata.json" -Value ($metadata_Piper_PA_23 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Piper-PA-23\Models\pa23.ac" --output "$aircraftDir_Piper_PA_23\Piper-PA-23_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Piper-PA-23\Models\texture.png" --exclude "interior.ac" "general_pilot.ac"

# --- Aircraft: Piper-PA-32 ---
$aircraftDir_Piper_PA_32 = "$baseOutputDir\Piper-PA-32"
New-Item -ItemType Directory -Path $aircraftDir_Piper_PA_32 -Force
$metadata_Piper_PA_32 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 150
    CruisingAltitude = 10000
    MaxAirspeed = 165
}
Set-Content -Path "$aircraftDir_Piper_PA_32\metadata.json" -Value ($metadata_Piper_PA_32 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Piper-PA-32\Models\pa32.ac" --output "$aircraftDir_Piper_PA_32\Piper-PA-32_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Piper-PA-32\Models\texture.png" --exclude "interior.ac" "general_pilot.ac"

# --- Aircraft: pittss1c ---
$aircraftDir_pittss1c = "$baseOutputDir\pittss1c"
New-Item -ItemType Directory -Path $aircraftDir_pittss1c -Force
$metadata_pittss1c = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 152
    CruisingAltitude = 12000
    MaxAirspeed = 182
}
Set-Content -Path "$aircraftDir_pittss1c\metadata.json" -Value ($metadata_pittss1c | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\pittss1c\Models\s1c.ac" --output "$aircraftDir_pittss1c\pittss1c_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\pittss1c\Models\Liveries\Yellow\fuselageport.rgb"

# --- Aircraft: Polikarpov-I16 ---
$aircraftDir_Polikarpov_I16 = "$baseOutputDir\Polikarpov-I16"
New-Item -ItemType Directory -Path $aircraftDir_Polikarpov_I16 -Force
$metadata_Polikarpov_I16 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 230
    CruisingAltitude = 15000
    MaxAirspeed = 285
}
Set-Content -Path "$aircraftDir_Polikarpov_I16\metadata.json" -Value ($metadata_Polikarpov_I16 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Polikarpov-I16\Models\i16.ac" --output "$aircraftDir_Polikarpov_I16\Polikarpov-I16_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Polikarpov-I16\Models\texture.png" --exclude "interior.ac" "ww2_pilot_old.ac" "immat.ac"

# --- Aircraft: Polikarpov-I5 ---
$aircraftDir_Polikarpov_I5 = "$baseOutputDir\Polikarpov-I5"
New-Item -ItemType Directory -Path $aircraftDir_Polikarpov_I5 -Force
$metadata_Polikarpov_I5 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 130
    CruisingAltitude = 12000
    MaxAirspeed = 155
}
Set-Content -Path "$aircraftDir_Polikarpov_I5\metadata.json" -Value ($metadata_Polikarpov_I5 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Polikarpov-I5\Models\i5.ac" --output "$aircraftDir_Polikarpov_I5\Polikarpov-I5_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Polikarpov-I5\Models\texture.png" --exclude "interior.ac" "ww2_pilot_old.ac"

# --- Aircraft: Pond-Racer ---
$aircraftDir_Pond_Racer = "$baseOutputDir\Pond-Racer"
New-Item -ItemType Directory -Path $aircraftDir_Pond_Racer -Force
$metadata_Pond_Racer = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 350
    CruisingAltitude = 25000
    MaxAirspeed = 400
}
Set-Content -Path "$aircraftDir_Pond_Racer\metadata.json" -Value ($metadata_Pond_Racer | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Pond-Racer\Models\pond.ac" --output "$aircraftDir_Pond_Racer\Pond-Racer_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Pond-Racer\Models\texture.png" --exclude "interior.ac" "general_pilot.ac" "immat.ac"

# --- Aircraft: Potez-630 ---
$aircraftDir_Potez_630 = "$baseOutputDir\Potez-630"
New-Item -ItemType Directory -Path $aircraftDir_Potez_630 -Force
$metadata_Potez_630 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 220
    CruisingAltitude = 15000
    MaxAirspeed = 275
}
Set-Content -Path "$aircraftDir_Potez_630\metadata.json" -Value ($metadata_Potez_630 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Potez-630\Models\potez630.ac" --output "$aircraftDir_Potez_630\Potez-630_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Potez-630\Models\texture.png" --exclude "interior.ac" "ww2_pilot_old.ac"

# --- Aircraft: R22 (Robinson R22) ---
$aircraftDir_R22 = "$baseOutputDir\R22"
New-Item -ItemType Directory -Path $aircraftDir_R22 -Force
$metadata_R22 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 1
    IsFixedWing = 0
    CruisingAirspeed = 95
    CruisingAltitude = 8000
    MaxAirspeed = 117
}
Set-Content -Path "$aircraftDir_R22\metadata.json" -Value ($metadata_R22 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\R22\Models\r22.ac" --output "$aircraftDir_R22\R22_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\R22\Models\Liveries\paint1.png" --exclude "interior.ac"

# --- Aircraft: R44 (Robinson R44) ---
$aircraftDir_R44 = "$baseOutputDir\R44"
New-Item -ItemType Directory -Path $aircraftDir_R44 -Force
$metadata_R44 = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 1
    IsFixedWing = 0
    CruisingAirspeed = 110
    CruisingAltitude = 9000
    MaxAirspeed = 130
}
Set-Content -Path "$aircraftDir_R44\metadata.json" -Value ($metadata_R44 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\R44\Models\r44.ac" --output "$aircraftDir_R44\R44_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\R44\Models\texture.png" --exclude "interior.ac" "general_pilot.ac" "immat.ac"

# --- Aircraft: RAF-S-E-5 ---
$aircraftDir_RAF_S_E_5 = "$baseOutputDir\RAF-S-E-5"
New-Item -ItemType Directory -Path $aircraftDir_RAF_S_E_5 -Force
$metadata_RAF_S_E_5 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 120
    CruisingAltitude = 10000
    MaxAirspeed = 138
}
Set-Content -Path "$aircraftDir_RAF_S_E_5\metadata.json" -Value ($metadata_RAF_S_E_5 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\RAF-S-E-5\Models\se5.ac" --output "$aircraftDir_RAF_S_E_5\RAF-S-E-5_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\RAF-S-E-5\Models\texture.png" --exclude "interior.ac" "gun.ac" "ww1_pilot_old.ac"

# --- Aircraft: rah-66 (Boeing-Sikorsky RAH-66 Comanche) ---
$aircraftDir_rah_66 = "$baseOutputDir\rah-66"
New-Item -ItemType Directory -Path $aircraftDir_rah_66 -Force
$metadata_rah_66 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 1
    IsFixedWing = 0
    CruisingAirspeed = 165
    CruisingAltitude = 10000
    MaxAirspeed = 175
}
Set-Content -Path "$aircraftDir_rah_66\metadata.json" -Value ($metadata_rah_66 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\rah-66\models\rah-66.ac" --output "$aircraftDir_rah_66\rah-66_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\rah-66\models\liveries\default.png" --exclude "panel.ac" "hellfire.ac" "hellfires.ac" "hydra.ac" "stinger.ac"

# --- Aircraft: rallye-MS893 (SOCATA Rallye) ---
$aircraftDir_rallye_MS893 = "$baseOutputDir\rallye-MS893"
New-Item -ItemType Directory -Path $aircraftDir_rallye_MS893 -Force
$metadata_rallye_MS893 = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 110
    CruisingAltitude = 8000
    MaxAirspeed = 125
}
Set-Content -Path "$aircraftDir_rallye_MS893\metadata.json" -Value ($metadata_rallye_MS893 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\rallye-MS893\Models\rallye-MS893.ac" --output "$aircraftDir_rallye_MS893\rallye-MS893_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\rallye-MS893\Models\ms-983-paint.png"

# --- Aircraft: RV-6A (Van's RV-6A) ---
$aircraftDir_RV_6A = "$baseOutputDir\RV-6A"
New-Item -ItemType Directory -Path $aircraftDir_RV_6A -Force
$metadata_RV_6A = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 170
    CruisingAltitude = 8500
    MaxAirspeed = 200
}
Set-Content -Path "$aircraftDir_RV_6A\metadata.json" -Value ($metadata_RV_6A | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\RV-6A\Models\RV-6A.ac" --output "$aircraftDir_RV_6A\RV-6A_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\RV-6A\Models\by_side.png"

# --- Aircraft: Ryan-Navion ---
$aircraftDir_Ryan_Navion = "$baseOutputDir\Ryan-Navion"
New-Item -ItemType Directory -Path $aircraftDir_Ryan_Navion -Force
$metadata_Ryan_Navion = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 155
    CruisingAltitude = 10000
    MaxAirspeed = 163
}
Set-Content -Path "$aircraftDir_Ryan_Navion\metadata.json" -Value ($metadata_Ryan_Navion | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Ryan-Navion\Models\navion.ac" --output "$aircraftDir_Ryan_Navion\Ryan-Navion_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Ryan-Navion\Models\texture.png" --exclude "interior.ac" "general_pilot.ac"

# --- Aircraft: Ryan-PT22 ---
$aircraftDir_Ryan_PT22 = "$baseOutputDir\Ryan-PT22"
New-Item -ItemType Directory -Path $aircraftDir_Ryan_PT22 -Force
$metadata_Ryan_PT22 = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 125
    CruisingAltitude = 12000
    MaxAirspeed = 135
}
Set-Content -Path "$aircraftDir_Ryan_PT22\metadata.json" -Value ($metadata_Ryan_PT22 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Ryan-PT22\Models\pt22.ac" --output "$aircraftDir_Ryan_PT22\Ryan-PT22_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Ryan-PT22\Models\texture.png" --exclude "interior.ac" "ww2_pilot_old.ac"

# --- Aircraft: Ryan-SoSL (Spirit of St. Louis) ---
$aircraftDir_Ryan_SoSL = "$baseOutputDir\Ryan-SoSL"
New-Item -ItemType Directory -Path $aircraftDir_Ryan_SoSL -Force
$metadata_Ryan_SoSL = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 100
    CruisingAltitude = 10000
    MaxAirspeed = 133
}
Set-Content -Path "$aircraftDir_Ryan_SoSL\metadata.json" -Value ($metadata_Ryan_SoSL | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Ryan-SoSL\Models\ryan-sosl.ac" --output "$aircraftDir_Ryan_SoSL\Ryan-SoSL_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Ryan-SoSL\Models\texture.png" --exclude "interior.ac" "ww2_pilot_old.ac"

# --- Aircraft: S-51-Dragonfly ---
$aircraftDir_S_51_Dragonfly = "$baseOutputDir\S-51-Dragonfly"
New-Item -ItemType Directory -Path $aircraftDir_S_51_Dragonfly -Force
$metadata_S_51_Dragonfly = @{
    IsMilitary = 1
    IsInService = 0
    IsHelicopter = 1
    IsFixedWing = 0
    CruisingAirspeed = 85
    CruisingAltitude = 8000
    MaxAirspeed = 103
}
Set-Content -Path "$aircraftDir_S_51_Dragonfly\metadata.json" -Value ($metadata_S_51_Dragonfly | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\S-51-Dragonfly\Models\S51-fuselage-v2.ac" --output "$aircraftDir_S_51_Dragonfly\S-51-Dragonfly_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\S-51-Dragonfly\Models\Textures\Fuse.rgb" --exclude "S51-pilot-in.ac" "S51-pilot-out.ac" "rescue-man.ac" "rescue-op.ac"

# --- Aircraft: S-75 ---
$aircraftDir_S_75 = "$baseOutputDir\S-75"
New-Item -ItemType Directory -Path $aircraftDir_S_75 -Force
$metadata_S_75 = @{
    IsMilitary = 1
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 0
    CruisingAirspeed = 1500
    CruisingAltitude = 65000
    MaxAirspeed = 2300
}
Set-Content -Path "$aircraftDir_S_75\metadata.json" -Value ($metadata_S_75 | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\S-75\Models\S-75.ac" --output "$aircraftDir_S_75\S-75_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\S-75\Models\S-75.png"

# --- Aircraft: QSeries (De Havilland Canada Dash 8) ---
$aircraftDir_QSeries = "$baseOutputDir\QSeries"
New-Item -ItemType Directory -Path $aircraftDir_QSeries -Force
$metadata_QSeries = @{
    IsMilitary = 0
    IsInService = 1
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 360
    CruisingAltitude = 25000
    MaxAirspeed = 414
}
Set-Content -Path "$aircraftDir_QSeries\metadata.json" -Value ($metadata_QSeries | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\QSeries\Models\q400.ac" --output "$aircraftDir_QSeries\QSeries_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\QSeries\Models\Q400_House.png" --exclude "cockpit.ac" "interior-200.ac" "interior-300.ac" "interior.ac" "jacks.ac"

# --- Aircraft: Quickie ---
$aircraftDir_Quickie = "$baseOutputDir\Quickie"
New-Item -ItemType Directory -Path $aircraftDir_Quickie -Force
$metadata_Quickie = @{
    IsMilitary = 0
    IsInService = 0
    IsHelicopter = 0
    IsFixedWing = 1
    CruisingAirspeed = 120
    CruisingAltitude = 10000
    MaxAirspeed = 140
}
Set-Content -Path "$aircraftDir_Quickie\metadata.json" -Value ($metadata_Quickie | ConvertTo-Json)
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Quickie\Models\quickie2.ac" --output "$aircraftDir_Quickie\Quickie_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Quickie\Models\texture.png" --exclude "interior.ac" "general_pilot.ac"


# Commands for SaabJ35F
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SaabJ35F" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 500;
    "CruisingAltitude" = 40000;
    "MaxAirspeed" = 1145
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SaabJ35F\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SaabJ35F\Model\draken.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SaabJ35F\SaabJ35F_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SaabJ35F\Model\draken_main.png"

# Commands for Saunders-Roe-Princess
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Saunders-Roe-Princess" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 280;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 330
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Saunders-Roe-Princess\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Saunders-Roe-Princess\Models\princess.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Saunders-Roe-Princess\Saunders-Roe-Princess_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Saunders-Roe-Princess\Models\texture.png"

# Commands for Savoia-Marchetti-SM-79
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Savoia-Marchetti-SM-79" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 220;
    "CruisingAltitude" = 16400;
    "MaxAirspeed" = 230
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Savoia-Marchetti-SM-79\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Savoia-Marchetti-SM-79\Models\SM-79.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Savoia-Marchetti-SM-79\Savoia-Marchetti-SM-79_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Savoia-Marchetti-SM-79\Models\texture.png"

# Commands for seahawk
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\seahawk" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 434;
    "CruisingAltitude" = 40000;
    "MaxAirspeed" = 521
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\seahawk\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\seahawk\SeaHawk.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\seahawk\seahawk_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\seahawk\Models\seahawk-tx-01-1.png" --exclude "gear.ac"

# Commands for SeaVixen
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SeaVixen" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 469;
    "CruisingAltitude" = 40000;
    "MaxAirspeed" = 600
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SeaVixen\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SeaVixen\Models\sea-vixen-FAW2-ver2.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SeaVixen\SeaVixen_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SeaVixen\Models\sea-vixen-textures.rgb" --exclude "gear.ac"

# Commands for SenecaII
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SenecaII" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 175;
    "CruisingAltitude" = 12000;
    "MaxAirspeed" = 197
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SenecaII\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SenecaII\Models\SenecaII.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SenecaII\SenecaII_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SenecaII\Models\NLG_Texture.png"

# Commands for SF-1_Archon
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SF-1_Archon" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 150;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 180
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SF-1_Archon\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SF-1_Archon\Models\sf-1.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SF-1_Archon\SF-1_Archon_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SF-1_Archon\Models\texture.png"

# Commands for sf25b
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\sf25b" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 70;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 97
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\sf25b\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\sf25b\Models\sf25b.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\sf25b\sf25b_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\sf25b\Textures\D-KOSI.png"

# Commands for SF25C
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SF25C" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 76;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 97
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SF25C\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SF25C\Models\sf25c.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SF25C\SF25C_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SF25C\Models\sf25c.png"

# Commands for SG38
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SG38" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 32;
    "CruisingAltitude" = 1000;
    "MaxAirspeed" = 60
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SG38\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SG38\Models\sg38.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SG38\SG38_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SG38\Models\default.png"

# Commands for sgs233
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\sgs233" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 45;
    "CruisingAltitude" = 5000;
    "MaxAirspeed" = 98
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\sgs233\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\sgs233\Models\sgs233.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\sgs233\sgs233_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\sgs233\Models\s2-33_00.rgb"

# Commands for Short-Stirling
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Short-Stirling" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 174;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 233
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Short-Stirling\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Short-Stirling\Models\stirling.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Short-Stirling\Short-Stirling_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Short-Stirling\Models\texture.png"

# Commands for Short_Empire
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Short_Empire" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 143;
    "CruisingAltitude" = 9000;
    "MaxAirspeed" = 174
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Short_Empire\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Short_Empire\Models\Short_Empire.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Short_Empire\Short_Empire_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Short_Empire\Models\Liveries\Cambria-fuselage.png"

# Commands for shuttle
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\shuttle" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 15200;
    "CruisingAltitude" = 200000;
    "MaxAirspeed" = 17500
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\shuttle\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\shuttle\shuttle.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\shuttle\shuttle_default.fbx" 

# Commands for SIAI-Marchetti-S.16
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SIAI-Marchetti-S.16" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 90;
    "CruisingAltitude" = 8000;
    "MaxAirspeed" = 105
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SIAI-Marchetti-S.16\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SIAI-Marchetti-S.16\Models\s16.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SIAI-Marchetti-S.16\SIAI-Marchetti-S.16_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SIAI-Marchetti-S.16\Models\texture.png"

# Commands for SIAI-Marchetti-S.205R
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SIAI-Marchetti-S.205R" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 140;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 152
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SIAI-Marchetti-S.205R\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SIAI-Marchetti-S.205R\Models\s205.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SIAI-Marchetti-S.205R\SIAI-Marchetti-S.205R_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SIAI-Marchetti-S.205R\Models\texture.png"

# Commands for SIAI-Marchetti-SF.260
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SIAI-Marchetti-SF.260" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 180;
    "CruisingAltitude" = 15000;
    "MaxAirspeed" = 236
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SIAI-Marchetti-SF.260\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SIAI-Marchetti-SF.260\Models\sf260.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SIAI-Marchetti-SF.260\SIAI-Marchetti-SF.260_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SIAI-Marchetti-SF.260\Models\texture.png"

# Commands for Sikorsky-76C
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Sikorsky-76C" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 1;
    "IsFixedWing" = 0;
    "CruisingAirspeed" = 155;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 155
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Sikorsky-76C\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Sikorsky-76C\Models\s76c.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Sikorsky-76C\Sikorsky-76C_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Sikorsky-76C\Models\S76livery.png"

# Commands for Sikorsky-CH-37B-Mojave
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Sikorsky-CH-37B-Mojave" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 1;
    "IsFixedWing" = 0;
    "CruisingAirspeed" = 113;
    "CruisingAltitude" = 8000;
    "MaxAirspeed" = 130
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Sikorsky-CH-37B-Mojave\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Sikorsky-CH-37B-Mojave\Models\ch37.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Sikorsky-CH-37B-Mojave\Sikorsky-CH-37B-Mojave_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Sikorsky-CH-37B-Mojave\Models\texture.png"

# Commands for Sikorsky-S38
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Sikorsky-S38" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 98;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 110
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Sikorsky-S38\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Sikorsky-S38\Models\s38.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Sikorsky-S38\Sikorsky-S38_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Sikorsky-S38\Models\texture.png"

# Commands for Sikorsky-S58
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Sikorsky-S58" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 1;
    "IsFixedWing" = 0;
    "CruisingAirspeed" = 90;
    "CruisingAltitude" = 9500;
    "MaxAirspeed" = 105
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Sikorsky-S58\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Sikorsky-S58\Models\s58.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Sikorsky-S58\Sikorsky-S58_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Sikorsky-S58\Models\texture.png"

# Commands for Silence-Twister
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Silence-Twister" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 138;
    "CruisingAltitude" = 8500;
    "MaxAirspeed" = 155
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Silence-Twister\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Silence-Twister\Models\twister.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Silence-Twister\Silence-Twister_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Silence-Twister\Models\texture.png"

# Commands for Silent2Electro
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Silent2Electro" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 75;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 120
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Silent2Electro\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Silent2Electro\Models\silent2electro.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Silent2Electro\Silent2Electro_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Silent2Electro\Models\silent2electro.png"

# Commands for Sky-sportster
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Sky-sportster" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 90;
    "CruisingAltitude" = 8000;
    "MaxAirspeed" = 100
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Sky-sportster\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Sky-sportster\Models\sportster.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Sky-sportster\Sky-sportster_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Sky-sportster\Models\texture.png"

# Commands for SkyCar
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SkyCar" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 300;
    "CruisingAltitude" = 25000;
    "MaxAirspeed" = 350
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SkyCar\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SkyCar\Models\skycar.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SkyCar\SkyCar_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SkyCar\Models\texture.png"

# Commands for Skyranger
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Skyranger" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 90;
    "CruisingAltitude" = 8000;
    "MaxAirspeed" = 100
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Skyranger\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Skyranger\Models\skyranger.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Skyranger\Skyranger_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Skyranger\Models\texture.png"

# Commands for Skyvan
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Skyvan" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 150;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 175
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Skyvan\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Skyvan\Models\skyvan.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Skyvan\Skyvan_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Skyvan\Models\texture.png"

# Commands for SM-55
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SM-55" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 110;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 130
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SM-55\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SM-55\Models\s55.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SM-55\SM-55_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SM-55\Models\texture.png"

# Commands for SM-64
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SM-64" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 120;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 140
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SM-64\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SM-64\Models\sm64.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SM-64\SM-64_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SM-64\Models\texture.png"

# Commands for SM-65
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SM-65" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 300;
    "CruisingAltitude" = 5000;
    "MaxAirspeed" = 350
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SM-65\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SM-65\Models\sm65.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SM-65\SM-65_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SM-65\Models\texture.png"

# Commands for Socata-ST10
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Socata-ST10" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 135;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 146
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Socata-ST10\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Socata-ST10\Models\st10.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Socata-ST10\Socata-ST10_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Socata-ST10\Models\texture.png"

# Commands for Song-120
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Song-120" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 70;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 90
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Song-120\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Song-120\Models\song120.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Song-120\Song-120_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Song-120\Models\song120.png"

# Commands for sopwithCamel
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\sopwithCamel" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 90;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 113
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\sopwithCamel\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\sopwithCamel\Models\camel.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\sopwithCamel\sopwithCamel_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\sopwithCamel\Models\Textures\camel-texture.rgb"

# Commands for SpaceShip-One
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SpaceShip-One" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 2200;
    "CruisingAltitude" = 300000;
    "MaxAirspeed" = 2200
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SpaceShip-One\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SpaceShip-One\Models\spaceshipone.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SpaceShip-One\SpaceShip-One_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SpaceShip-One\Models\texture.png"

# Commands for SPAD-VII
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SPAD-VII" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 110;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 119
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SPAD-VII\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SPAD-VII\Models\spadvii.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SPAD-VII\SPAD-VII_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SPAD-VII\Models\texture.png"

# Commands for Spitfire
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Spitfire" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 295;
    "CruisingAltitude" = 25000;
    "MaxAirspeed" = 362
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Spitfire\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Spitfire\Models\spitfireIIa.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Spitfire\Spitfire_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Spitfire\Models\spitfire-tx-00.png"

# Commands for spitfireIX
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\spitfireIX" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 324;
    "CruisingAltitude" = 25000;
    "MaxAirspeed" = 408
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\spitfireIX\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\spitfireIX\Models\spitfire9.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\spitfireIX\spitfireIX_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\spitfireIX\Models\spit9-1.png"

# Commands for SR22T
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SR22T" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 180;
    "CruisingAltitude" = 18000;
    "MaxAirspeed" = 215
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SR22T\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SR22T\Models\SR22T.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SR22T\SR22T_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SR22T\Models\SR22T.png"

# Commands for SR71-BlackBird
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SR71-BlackBird" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 1800;
    "CruisingAltitude" = 85000;
    "MaxAirspeed" = 2200
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SR71-BlackBird\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SR71-BlackBird\Models\SR-71A-Blackbird.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SR71-BlackBird\SR71-BlackBird_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SR71-BlackBird\Models\Texture-USAF\fusedessus.png"

# Commands for Stampe-SV4
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Stampe-SV4" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 81;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 93
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Stampe-SV4\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Stampe-SV4\Models\stampe.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Stampe-SV4\Stampe-SV4_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Stampe-SV4\Models\texture.png"

# Commands for Starck-AS-37
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Starck-AS-37" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 80;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 95
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Starck-AS-37\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Starck-AS-37\Models\as37.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Starck-AS-37\Starck-AS-37_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Starck-AS-37\Models\texture.png"

# Commands for Starship
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Starship" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 300;
    "CruisingAltitude" = 35000;
    "MaxAirspeed" = 335
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Starship\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Starship\Models\starship.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Starship\Starship_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Starship\Models\texture.png"

# Commands for Stearman
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Stearman" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 91;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 108
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Stearman\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Stearman\Models\stearman.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Stearman\Stearman_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Stearman\Models\texture.png"

# Commands for Stieglitz
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Stieglitz" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 90;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 100
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Stieglitz\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Stieglitz\Models\Stieglitz.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Stieglitz\Stieglitz_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Stieglitz\Models\Stieglitz.rgb"

# Commands for Stiletto
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Stiletto" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 160;
    "CruisingAltitude" = 12000;
    "MaxAirspeed" = 200
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Stiletto\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Stiletto\Models\stiletto.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Stiletto\Stiletto_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Stiletto\Models\texture.png"

# Commands for Storch
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Storch" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 81;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 94
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Storch\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Storch\Models\storch.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Storch\Storch_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Storch\Models\storch.rgb"

# Commands for Su-25
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Su-25" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 390;
    "CruisingAltitude" = 23000;
    "MaxAirspeed" = 510
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Su-25\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Su-25\Models\Su-25.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Su-25\Su-25_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Su-25\Models\Liveries\Default.png"

# Commands for SU-37
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SU-37" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 800;
    "CruisingAltitude" = 45000;
    "MaxAirspeed" = 1620
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SU-37\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SU-37\Models\SU-37-005-125h.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SU-37\SU-37_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SU-37\Models\SU-37-top.rgb"

# Commands for Submarine_Scout
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Submarine_Scout" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 0;
    "CruisingAirspeed" = 43;
    "CruisingAltitude" = 1000;
    "MaxAirspeed" = 48
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Submarine_Scout\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Submarine_Scout\Models\envelope.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Submarine_Scout\Submarine_Scout_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Submarine_Scout\Models\SSZero_envelope.png"

# Commands for SUHPA-Lazarus
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SUHPA-Lazarus" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 15;
    "CruisingAltitude" = 20;
    "MaxAirspeed" = 20
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SUHPA-Lazarus\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SUHPA-Lazarus\Models\LazarusMKII.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SUHPA-Lazarus\SUHPA-Lazarus_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SUHPA-Lazarus\Models\lazarus.png"

# Commands for Sukhoi-Su-33
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Sukhoi-Su-33" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 700;
    "CruisingAltitude" = 40000;
    "MaxAirspeed" = 1270
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Sukhoi-Su-33\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Sukhoi-Su-33\Models\su33.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Sukhoi-Su-33\Sukhoi-Su-33_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Sukhoi-Su-33\Models\texture.png"

# Commands for SUMPAC
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SUMPAC" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 15;
    "CruisingAltitude" = 10;
    "MaxAirspeed" = 20
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SUMPAC\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SUMPAC\Models\sumpac.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SUMPAC\SUMPAC_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SUMPAC\Models\sumpac.png"

# Commands for Super-Etendard
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Super-Etendard" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 550;
    "CruisingAltitude" = 40000;
    "MaxAirspeed" = 650
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Super-Etendard\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Super-Etendard\Models\super-etendard.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Super-Etendard\Super-Etendard_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Super-Etendard\Models\texture.png"

# Commands for Super-Frelon
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Super-Frelon" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 1;
    "IsInService" = 0;
    "IsHelicopter" = 1;
    "IsFixedWing" = 0;
    "CruisingAirspeed" = 113;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 135
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Super-Frelon\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Super-Frelon\Models\superfrelon.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Super-Frelon\Super-Frelon_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Super-Frelon\Models\texture.png"

# Commands for SuperGuepard912
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\SuperGuepard912" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 100;
    "CruisingAltitude" = 10000;
    "MaxAirspeed" = 124
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\SuperGuepard912\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\SuperGuepard912\Models\superguepard.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\SuperGuepard912\SuperGuepard912_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\SuperGuepard912\Models\texture.png"

# Commands for superguppySGT
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\superguppySGT" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 1;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 220;
    "CruisingAltitude" = 25000;
    "MaxAirspeed" = 250
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\superguppySGT\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\superguppySGT\Models\superguppySGT.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\superguppySGT\superguppySGT_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\superguppySGT\Models\texture.png"

# Commands for Supermarine-S.6B
New-Item -Path "C:\Users\domin\Documents\TruthTracks\Planes\Supermarine-S.6B" -ItemType Directory -Force
$metadata = @{
    "IsMilitary" = 0;
    "IsInService" = 0;
    "IsHelicopter" = 0;
    "IsFixedWing" = 1;
    "CruisingAirspeed" = 350;
    "CruisingAltitude" = 5000;
    "MaxAirspeed" = 407
}
$metadata | ConvertTo-Json | Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Supermarine-S.6B\metadata.json"
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Supermarine-S.6B\Models\s6b.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Supermarine-S.6B\Supermarine-S.6B_default.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Supermarine-S.6B\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Supermarine-Swift
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Supermarine-Swift"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Supermarine-Swift\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 490,
    "CruisingAltitude": 40000,
    "MaxAirspeed": 620
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Supermarine-Swift\Models\swift-fr5.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Supermarine-Swift\Supermarine-Swift.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Supermarine-Swift\Models\Swift_1.jpg"

# -----------------------------------------------------------------------------------------
# Aircraft: Superwal
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Superwal"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Superwal\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 78,
    "CruisingAltitude": 11500,
    "MaxAirspeed": 100
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Superwal\Models\Superwal.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Superwal\Superwal.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Superwal\Models\Wal.rgb" --exclude "Cockpit.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: Swan
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Swan"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Swan\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 119,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 146
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Swan\Models\swan.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Swan\Swan.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Swan\Models\swan.png"

# -----------------------------------------------------------------------------------------
# Aircraft: T-4
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\T-4"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\T-4\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 508,
    "CruisingAltitude": 50000,
    "MaxAirspeed": 560
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\T-4\Models\T-4.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\T-4\T-4.fbx" --livery "C:\Users\domin\Documents\FlightGearData\T-4\Models\T-4.rgb"

# -----------------------------------------------------------------------------------------
# Aircraft: T-50
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\T-50"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\T-50\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 650,
    "CruisingAltitude": 48000,
    "MaxAirspeed": 998
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\T-50\Models\T-50.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\T-50\T-50.fbx" --livery "C:\Users\domin\Documents\FlightGearData\T-50\Liveries\Default.png" --exclude "Gear.ac" "LEngine.ac" "REngine.ac" "Cockpit.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: T37
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\T37"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\T37\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 310,
    "CruisingAltitude": 25000,
    "MaxAirspeed": 369
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\T37\Models\T-37.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\T37\T37.fbx" --livery "C:\Users\domin\Documents\FlightGearData\T37\Models\T-37-livery-main.png" --exclude "rudderandstick.ac" "throttleconsole.ac" "pilot-USAF.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: T38
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\T38"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\T38\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 550,
    "CruisingAltitude": 55000,
    "MaxAirspeed": 812
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\T38\Models\T38.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\T38\T38.fbx" --livery "C:\Users\domin\Documents\FlightGearData\T38\Models\t38.rgb"

# -----------------------------------------------------------------------------------------
# Aircraft: T7-RedHawk
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\T7-RedHawk"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\T7-RedHawk\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 500,
    "CruisingAltitude": 45000,
    "MaxAirspeed": 644
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\T7-RedHawk\Models\t7.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\T7-RedHawk\T7-RedHawk.fbx" --livery "C:\Users\domin\Documents\FlightGearData\T7-RedHawk\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Taurus
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Taurus"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Taurus\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 59,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 81
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Taurus\Models\taurus.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Taurus\Taurus.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Taurus\Models\taurus.png"

# -----------------------------------------------------------------------------------------
# Aircraft: TBM-930
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\TBM-930"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\TBM-930\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 252,
    "CruisingAltitude": 31000,
    "MaxAirspeed": 330
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\TBM-930\Models\tbm930.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\TBM-930\TBM-930.fbx" --livery "C:\Users\domin\Documents\FlightGearData\TBM-930\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: TBM-Avenger
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\TBM-Avenger"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\TBM-Avenger\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 150,
    "CruisingAltitude": 12000,
    "MaxAirspeed": 239
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\TBM-Avenger\Models\avenger.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\TBM-Avenger\TBM-Avenger.fbx" --livery "C:\Users\domin\Documents\FlightGearData\TBM-Avenger\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Tecnam-P2002-Sierra
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tecnam-P2002-Sierra"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tecnam-P2002-Sierra\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 115,
    "CruisingAltitude": 14000,
    "MaxAirspeed": 122
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Tecnam-P2002-Sierra\Models\p2002.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Tecnam-P2002-Sierra\Tecnam-P2002-Sierra.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Tecnam-P2002-Sierra\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Tecnam-P2006T
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tecnam-P2006T"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tecnam-P2006T\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 150,
    "CruisingAltitude": 14000,
    "MaxAirspeed": 155
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Tecnam-P2006T\Models\p2006t.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Tecnam-P2006T\Tecnam-P2006T.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Tecnam-P2006T\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Tecnam-P2010
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tecnam-P2010"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tecnam-P2010\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 136,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 140
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Tecnam-P2010\Models\p2010.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Tecnam-P2010\Tecnam-P2010.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Tecnam-P2010\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Tecnam-P92
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tecnam-P92"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tecnam-P92\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 108,
    "CruisingAltitude": 13123,
    "MaxAirspeed": 124
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Tecnam-P92\Models\p92.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Tecnam-P92\Tecnam-P92.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Tecnam-P92\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Tigre
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tigre"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tigre\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 1,
    "IsFixedWing": 0,
    "CruisingAirspeed": 145,
    "CruisingAltitude": 13123,
    "MaxAirspeed": 158
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Tigre\Models\tigre.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Tigre\Tigre.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Tigre\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: TL96
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\TL96"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\TL96\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 135,
    "CruisingAltitude": 12000,
    "MaxAirspeed": 162
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\TL96\Models\TL96.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\TL96\TL96.fbx" --livery "C:\Users\domin\Documents\FlightGearData\TL96\Models\livery.png" --exclude "chute.ac" "TL96-passenger.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: TU-114
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\TU-114"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\TU-114\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 415,
    "CruisingAltitude": 39000,
    "MaxAirspeed": 475
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\TU-114\Models\TU-114-003-013b.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\TU-114\TU-114.fbx" --livery "C:\Users\domin\Documents\FlightGearData\TU-114\Models\TU-114--tx-01.rgb"

# -----------------------------------------------------------------------------------------
# Aircraft: Tu-134
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tu-134"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tu-134\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 432,
    "CruisingAltitude": 39000,
    "MaxAirspeed": 486
}
"@

# Generate FBX for Tu-134
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Tu-134\Models\tu134.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Tu-134\Tu-134.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Tu-134\Liveries\2048x2048\aeroflot_new.png"

# Generate FBX for tu134
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\tu134\Model\tu134.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Tu-134\tu134.fbx" --livery "C:\Users\domin\Documents\FlightGearData\tu134\Model\TU134_WING.rgb"

# -----------------------------------------------------------------------------------------
# Aircraft: Tu-22-Blinder
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tu-22-Blinder"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tu-22-Blinder\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 500,
    "CruisingAltitude": 40000,
    "MaxAirspeed": 799
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Tu-22-Blinder\Models\tu22.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Tu-22-Blinder\Tu-22-Blinder.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Tu-22-Blinder\Liveries\4096x4096\RuFed121TBAD.png" --exclude "shadow.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: TU-95
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\TU-95"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\TU-95\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 399,
    "CruisingAltitude": 41000,
    "MaxAirspeed": 510
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\TU-95\Models\tu95.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\TU-95\TU-95.fbx" --livery "C:\Users\domin\Documents\FlightGearData\TU-95\Models\texture.png" --exclude "shadow.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: Tu-SB2bis-M103
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tu-SB2bis-M103"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tu-SB2bis-M103\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 221,
    "CruisingAltitude": 25000,
    "MaxAirspeed": 245
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Tu-SB2bis-M103\Models\tu-sb.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Tu-SB2bis-M103\Tu-SB2bis-M103.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Tu-SB2bis-M103\Liveries\2048x2048\defaultHigh.png" --exclude "shadow.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: tu154
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\tu154"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\tu154\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 459,
    "CruisingAltitude": 39000,
    "MaxAirspeed": 500
}
"@

# Generate FBX for tu154
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\tu154\Models\tu154B.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\tu154\tu154.fbx" --livery "C:\Users\domin\Documents\FlightGearData\tu154\Models\tu154B-1.rgb" --exclude "tu154-cockpit.ac" "rud.ac" "main-ai.ac" "alt-metric.ac" "asi-metric.ac"

# Generate FBX for tu154b
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\tu154b\Model\exterior.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\tu154\tu154b.fbx" --livery "C:\Users\domin\Documents\FlightGearData\tu154b\Model\maina_t.png" --exclude "interior.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: Tupolev-I-4
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tupolev-I-4"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tupolev-I-4\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 139,
    "CruisingAltitude": 15000,
    "MaxAirspeed": 161
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Tupolev-I-4\Models\i4.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Tupolev-I-4\Tupolev-I-4.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Tupolev-I-4\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Tupolev-TB-1
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tupolev-TB-1"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Tupolev-TB-1\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 97,
    "CruisingAltitude": 15900,
    "MaxAirspeed": 110
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Tupolev-TB-1\Models\tb1.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Tupolev-TB-1\Tupolev-TB-1.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Tupolev-TB-1\Models\texture.png" --exclude "shadow.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: UH-1
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\UH-1"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\UH-1\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 1,
    "IsFixedWing": 0,
    "CruisingAirspeed": 110,
    "CruisingAltitude": 13000,
    "MaxAirspeed": 124
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\UH-1\Models\uh1.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\UH-1\UH-1.fbx" --livery "C:\Users\domin\Documents\FlightGearData\UH-1\Liveries\2048x2048\Aircav-7.png"

# -----------------------------------------------------------------------------------------
# Aircraft: UH-60
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\UH-60"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\UH-60\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 1,
    "IsFixedWing": 0,
    "CruisingAirspeed": 150,
    "CruisingAltitude": 19000,
    "MaxAirspeed": 159
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\UH-60\Models\uh60.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\UH-60\UH-60.fbx" --livery "C:\Users\domin\Documents\FlightGearData\UH-60\Liveries\2048x2048\heavyd.png"

# -----------------------------------------------------------------------------------------
# Aircraft: V22-Osprey
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\V22-Osprey"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\V22-Osprey\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 1,
    "IsFixedWing": 1,
    "CruisingAirspeed": 241,
    "CruisingAltitude": 25000,
    "MaxAirspeed": 275
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\V22-Osprey\Models\v22.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\V22-Osprey\V22-Osprey.fbx" --livery "C:\Users\domin\Documents\FlightGearData\V22-Osprey\Liveries\2048x2048\USAF.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Velocity-XL
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Velocity-XL"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Velocity-XL\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 185,
    "CruisingAltitude": 18000,
    "MaxAirspeed": 200
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Velocity-XL\Models\velocity.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Velocity-XL\Velocity-XL.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Velocity-XL\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Vickers-Vanguard
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Vickers-Vanguard"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Vickers-Vanguard\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 367,
    "CruisingAltitude": 25000,
    "MaxAirspeed": 367
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Vickers-Vanguard\Models\vanguard.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Vickers-Vanguard\Vickers-Vanguard.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Vickers-Vanguard\Liveries\2048x2048\transcanada.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Vickers-Vimy
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Vickers-Vimy"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Vickers-Vimy\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 78,
    "CruisingAltitude": 10000,
    "MaxAirspeed": 87
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Vickers-Vimy\Models\vimy.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Vickers-Vimy\Vickers-Vimy.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Vickers-Vimy\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: victor
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\victor"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\victor\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 547,
    "CruisingAltitude": 56000,
    "MaxAirspeed": 547
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\victor\Models\victor.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\victor\victor.fbx" --livery "C:\Users\domin\Documents\FlightGearData\victor\Models\camo-victor.png" --exclude "cockpit.ac" "chute.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: Vought-XF5U
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Vought-XF5U"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Vought-XF5U\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 335,
    "CruisingAltitude": 32000,
    "MaxAirspeed": 422
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Vought-XF5U\Models\xf5u.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Vought-XF5U\Vought-XF5U.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Vought-XF5U\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: vulcanb2
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\vulcanb2"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\vulcanb2\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 561,
    "CruisingAltitude": 55000,
    "MaxAirspeed": 561
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\vulcanb2\Models\vulcanb2.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\vulcanb2\vulcanb2.fbx" --livery "C:\Users\domin\Documents\FlightGearData\vulcanb2\Models\XM607.rgb" --exclude "cockpit.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: Westland-Whirlwind
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Westland-Whirlwind"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Westland-Whirlwind\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 1,
    "IsFixedWing": 0,
    "CruisingAirspeed": 87,
    "CruisingAltitude": 13000,
    "MaxAirspeed": 96
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Westland-Whirlwind\Models\whirlwind.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Westland-Whirlwind\Westland-Whirlwind.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Westland-Whirlwind\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Westwind-II
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Westwind-II"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Westwind-II\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 409,
    "CruisingAltitude": 45000,
    "MaxAirspeed": 473
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Westwind-II\Models\westwind.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Westwind-II\Westwind-II.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Westwind-II\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: wrightFlyer1903
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\wrightFlyer1903"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\wrightFlyer1903\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 26,
    "CruisingAltitude": 10,
    "MaxAirspeed": 30
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\wrightFlyer1903\Models\WrightFlyer-pb-jw.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\wrightFlyer1903\wrightFlyer1903.fbx" --livery "C:\Users\domin\Documents\FlightGearData\wrightFlyer1903\Models\WrightFlyer-pb-jw-01.rgb"

# -----------------------------------------------------------------------------------------
# Aircraft: X15
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\X15"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\X15\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 4000,
    "CruisingAltitude": 300000,
    "MaxAirspeed": 4520
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\X15\Models\X15.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\X15\X15.fbx" --livery "C:\Users\domin\Documents\FlightGearData\X15\Models\texture1.rgb" --exclude "X15_landing.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: XB-70
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\XB-70"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\XB-70\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 1787,
    "CruisingAltitude": 70000,
    "MaxAirspeed": 2056
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\XB-70\Models\XB-70.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\XB-70\XB-70.fbx" --livery "C:\Users\domin\Documents\FlightGearData\XB-70\Liveries\NASA1.png" --exclude "shadow.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: XP-67
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\XP-67"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\XP-67\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 274,
    "CruisingAltitude": 25000,
    "MaxAirspeed": 405
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\XP-67\Models\xp67.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\XP-67\XP-67.fbx" --livery "C:\Users\domin\Documents\FlightGearData\XP-67\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Yak-130
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Yak-130"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Yak-130\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 472,
    "CruisingAltitude": 41000,
    "MaxAirspeed": 572
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Yak-130\Models\Yak-130.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Yak-130\Yak-130.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Yak-130\Liveries\Default.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Yak-18T
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Yak-18T"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Yak-18T\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 135,
    "CruisingAltitude": 13000,
    "MaxAirspeed": 162
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Yak-18T\Models\yak18t.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Yak-18T\Yak-18T.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Yak-18T\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Yak-23
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Yak-23"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Yak-23\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 464,
    "CruisingAltitude": 48900,
    "MaxAirspeed": 505
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Yak-23\Models\yak23.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Yak-23\Yak-23.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Yak-23\Liveries\4096x4096\USAFWrightPatterson.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Yak-36
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Yak-36"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Yak-36\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 500,
    "CruisingAltitude": 39000,
    "MaxAirspeed": 567
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Yak-36\Models\Yak-36.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Yak-36\Yak-36.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Yak-36\Liveries\Yak-36_36-Dark.png" --exclude "Yak-36-Shadow.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: yak3
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\yak3"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\yak3\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 340,
    "CruisingAltitude": 15000,
    "MaxAirspeed": 407
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\yak3\Models\yak3.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\yak3\yak3.fbx" --livery "C:\Users\domin\Documents\FlightGearData\yak3\Models\yak-3-1.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Yak-52
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Yak-52"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Yak-52\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 102,
    "CruisingAltitude": 13123,
    "MaxAirspeed": 154
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Yak-52\Models\yak52.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Yak-52\Yak-52.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Yak-52\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: YardStik
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\YardStik"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\YardStik\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 50,
    "CruisingAltitude": 400,
    "MaxAirspeed": 70
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\YardStik\Models\yardstik.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\YardStik\YardStik.fbx" 

# -----------------------------------------------------------------------------------------
# Aircraft: YF-23
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\YF-23"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\YF-23\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 0,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 956,
    "CruisingAltitude": 65000,
    "MaxAirspeed": 1400
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\YF-23\Models\YF23-006-008g11.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\YF-23\YF-23.fbx" --livery "C:\Users\domin\Documents\FlightGearData\YF-23\Models\YF-23-Fuselage-Wings.png" --exclude "YF23-5-1h9.ac"

# -----------------------------------------------------------------------------------------
# Aircraft: YS-11
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\YS-11"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\YS-11\metadata.json" -Value @"
{
    "IsMilitary": 1,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 249,
    "CruisingAltitude": 20000,
    "MaxAirspeed": 297
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\YS-11\Models\YS-11.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\YS-11\YS-11.fbx" --livery "C:\Users\domin\Documents\FlightGearData\YS-11\Models\YS-11.png"

# -----------------------------------------------------------------------------------------
# Aircraft: ZivkoEdge
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\ZivkoEdge"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\ZivkoEdge\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 165,
    "CruisingAltitude": 14000,
    "MaxAirspeed": 230
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\ZivkoEdge\Models\ZivkoEdge540.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\ZivkoEdge\ZivkoEdge.fbx" --livery "C:\Users\domin\Documents\FlightGearData\ZivkoEdge\Liveries\Fuselage-RedBull.png"

# -----------------------------------------------------------------------------------------
# Aircraft: Zlin-50lx
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\Zlin-50lx"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\Zlin-50lx\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 1,
    "CruisingAirspeed": 131,
    "CruisingAltitude": 19685,
    "MaxAirspeed": 182
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\Zlin-50lx\Models\z50lx.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\Zlin-50lx\Zlin-50lx.fbx" --livery "C:\Users\domin\Documents\FlightGearData\Zlin-50lx\Models\texture.png"

# -----------------------------------------------------------------------------------------
# Aircraft: ZLT-NT
# -----------------------------------------------------------------------------------------

# Create Output Folder
New-Item -ItemType Directory -Force -Path "C:\Users\domin\Documents\TruthTracks\Planes\ZLT-NT"

# Create Metadata File
Set-Content -Path "C:\Users\domin\Documents\TruthTracks\Planes\ZLT-NT\metadata.json" -Value @"
{
    "IsMilitary": 0,
    "IsInService": 1,
    "IsHelicopter": 0,
    "IsFixedWing": 0,
    "CruisingAirspeed": 38,
    "CruisingAltitude": 6000,
    "MaxAirspeed": 65
}
"@

# Generate FBX
& "C:\Program Files\Blender Foundation\Blender 4.1\blender.exe" -b --python "C:\Users\domin\Documents\Python Scripts\assemble_aircraft.py" -- --main_model "C:\Users\domin\Documents\FlightGearData\ZLT-NT\Models\ZLT-NT.ac" --output "C:\Users\domin\Documents\TruthTracks\Planes\ZLT-NT\ZLT-NT.fbx" --livery "C:\Users\domin\Documents\FlightGearData\ZLT-NT\Models\c172p-01.rgb" --exclude "interior.ac" "mast.ac"