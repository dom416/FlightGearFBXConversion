# FlightGearFBXConversion
These scripts convert all the aircraft assets from flightgear .ac format into .fbx format for unreal engine



Step 1: Clone Aircraft folder through FlightGear SourceForge

First, download an svn program like TortoiseSVN, ensure you have at least 40 GB of space on your computer, then type this command in powershell with your desired file path and version of FlightGear:

svn checkout "https://svn.code.sf.net/p/flightgear/fgaddon/branches/release-2024.1/Aircraft" "C:\Users\domin\Documents\FlightGearData"



Step 2: Download Blender, ac3d add-on, and pillow

I used blender version 4.1.1, available here:
and the addon is the most up to date ac3d add-on found here: https://github.com/NikolaiVChr/Blender-AC3D/tree/4.1 or https://wiki.flightgear.org/Howto:Work_with_AC3D_files_in_Blender
follow the instructions on the flight gear wiki link to properly install

Finally, many of the planes use .rgb textures instead of .png, so the conversion script uses this for conversion. Find your python environment for blender (should be something like: "C:\Program Files\Blender Foundation\Blender 4.1\4.1\python\bin\python.exe") and install pillow in powershell with: "C:\Program Files\Blender Foundation\Blender 4.1\4.1\python\bin\python.exe" -m pip install Pillow


Step 3: download the assemble_aircraft.py file, and save it to your PC



Step 4: download and run Batch-Processor-Powershell.ps1 in your powershell. It is modular so you can just run parts of it if you don't need all the planes or just want certain planes. you will need to replace my file paths with your file paths.

or (optional) generate your own batch processing script using the PlaneParsingPrompt.txt as a prompt for google gemini. you will also need to use an updated file tree if you use a different version of flight gear, but FlightGearData_File_List.txt works for this version. Paste the prompt into gemini and then follow it with 15,000 lines from the data file list. I recommend gemini because it has a 1,000,000 token context window, which allows to process all the planes in less than 20 chunks/prompts. I added .json outputs that describe each plane with cruising airspeed, max airspeed, cruising altitude, and flags for historical or military planes. You can add more if you like the LLM was really accurate with these for the most part and this saves days of research and input time.



Step 5: Import the planes into unreal: when importing, rotate 180 degrees about the z axis. This is intentional because the rotations in blender do not work with .ac files well and give inconsistent rotations between aircraft.


Notes: 

The baseline script will merge most of the parts into a single mesh and the powershell script specifies some parts like the flight gear to be excluded and added into unreal as seperate parts. The script is not perfect and the extra assets like effects are not in their correct place by default since fligt gear uses a unique xml structure to deal with this. The powershell commands  I do this because my planes will mostly just be flying in my use case but you can change the script and powershell commands as needed. Also many of the optional assets like afterburner, lights, shock cones, etc. may be hidden from unreal by the script so you may have to change that as well. 

FlightGear uses the GNU General Public License, version 2, which is a copyleft license. So if you use these assets and want to distribute your program then they need to be freely available and fall under this license or a more permissive one and the license needs to be included with your project. Also if you make modified derivative assets (possibly including your entire game itself) based on these assets then those assets or your game also fall under this license.

