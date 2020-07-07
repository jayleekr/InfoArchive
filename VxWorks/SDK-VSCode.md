# Fusion SDK Generator - Visual Studio Code Extension

## Table of Contents

- [About](#about)
- [Setup Procedure](#setup-procedure)
- [Debug Support](#debug-support)
- [Known Limitations](#known-limitations)

## About

The Visual Studio Code (VSCode) extension allows developers to create, compile, and debug VxWorks Downloadable Kernel Modules (DKMs), Real-Time Processes (RTPs), and libraries entirely within the VSCode ecosystem.

## Setup Procedure

1. [Download and install VSCode](https://code.visualstudio.com/download).

2. Launch VSCode.

3. Open the `Extensions` Window.

4. Install the VxWorks 7 VSCode extension:

    1. Select the `...` button (near the top of the window) and choose `Install from VSIX...`.

        ![VSCode Extension](resources/extension_install.gif)

    2. Locate the VxWorks 7 VSCode extension, found within the *`<SDK_DIRECTORY>/VSCode-extension`* directory.

5. Provide the VSCode extension with the SDK location:

    1. Open the VSCode `Settings` menu (`File` -> `Preferences` -> `Settings`).

    2. Search for the *`Vscode:Vxsdk`* settings field.

    3. Enter the file location of the SDK directory.

    ![SDK Path](resources/extension_settings.gif)

## Debug Support

1. Launch VSCode.

2. Open an existing workspace.

3. Open the `Debugger` window.

4. Select the cogwheel button (near the top of the window) and select the *`wrdbg`* environment.
    This will create a new *`launch.json`* file consisting of two new debugging configurations: *`Launch DKM`* and *`Launch RTP`*

    ![VSCode Debugging](resources/extension_debug_launch.gif)

5. Ensure the following fields are changed according to your specifications:

    * **target** - Name of the target binary (*`<FILE>.out`* for DKM, *`<FILE>.vxe`* for RTP)
        * Replace *`<DKM.OUT_FILE>`*/*`<RTP.VXE_FILE>`* with the name of a debuggable DKM/RTP
    * **cwd** - Directory that contains the target binary
        * Replace *`<DKM_DIRECTORY>`*/*`<RTP_DIRECTORY>`* with the DKM/RTP project directory name
    * **debugger_args** - Arguments passed to the debugger
        * Replace *`<TARGET_IP>`* with the IP address of the target hardware or virtual machine

    ***NOTE:*** By default, the *`launch.json`* will be configured to use the RTOS image provided by the SDK (*`<SDK_DIRECTORY>/bsps/<BSP_NAME>/boot/vxWorks`*). To debug using a different RTOS image, modify the *`"-kernel"`* parameter with the path to the new RTOS image.

    ***NOTE:*** By adding *`"-debug"`* to the **debugger_args**, VSCode will produce more debug information to the user.

## Known Limitations

Though the VSCode extension is capable of creating, compiling, and debugging applications, it still remains a work-in-progress and should be treated as such.

Below are some of the know limitations of the extension:

* Only basic debug functionality have been tested (break, next, step, continue, etc.)
* When debugging a DKM task, the debugger will initially stop at the entry point. This is when breakpoints should be added, otherwise they will be ignored
* The debug output is redirected to the serial console when debugging a DKM

As of now, if the VSCode extension is unable to meet your debugging needs, use the **`wrdbg`** shell via the command-line.


        Copyright (C) 2019 Wind River Systems, Inc.