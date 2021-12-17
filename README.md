# WSB-autosetup
Starts Windows Sandbox and automatically installs 2010-2022 Visual C++ Redistributables
> This assumes your user profile is on the C:\ drive. **THIS WILL FAIL IF IT ISN'T.**

## Instructions (Github Desktop)
Recommended, makes it easier.
1. Install GitHub Desktop
2. Clone the repository "Nordii08/WSB-autosetup"
3. (Optional) Create a shortcut to your preferred .wsb file wherever you'd like.

## Instructions (Manual)
Not recommended.
1. Download this repository as a .zip
2. Create a folder called "GitHub" in your documents folder
3. Create a folder called "WSB-autosetup" in the "GitHub" folder
4. Extract all the files within the .zip you downloaded to the folder you created in step 3 
5. (Optional) Create a shortcut to your preferred .wsb file wherever you'd like.

## Glossary
Each folder correspondsd to the max amount of RAM that will be allocated.
`Run-xGB.wsb` Starts with vGPU and Networking disabled.
`Run-Net-xGB.wsb` Starts with Networking enabled and vGPU disabled.
`Run-vGPU-xGB.wsb` Starts with vGPU enabled and Networking disabled.
`Run-vGPU-Net-xGB.wsb` Starts with vGPU and Networking enabled.

Clipboard redirection is always on.

### (I hope I'm not violating any terms by including the Visual C++ Redistributables in here. I mean, they're called "Redistributables", so I'm assuming it's okay. If anybody from Microsoft isn't okay with this, just shoot me an email.)