# Fusion SDK Generator - Application Developer

## Table of Contents

- [Fusion SDK Generator - Application Developer](#fusion-sdk-generator---application-developer)
  - [Table of Contents](#table-of-contents)
  - [About](#about)
  - [SDK Directory Structure](#sdk-directory-structure)
  - [Booting a VxWorks Target](#booting-a-vxworks-target)
  - [Application Development](#application-development)
    - [Method 1: Command-line](#method-1-command-line)
      - [Command-line Prerequisites](#command-line-prerequisites)
      - [Connecting to a VxWorks Target](#connecting-to-a-vxworks-target)
      - [Building Applications](#building-applications)
        - [Building DKMs](#building-dkms)
        - [Building RTPs](#building-rtps)
      - [Running Applications](#running-applications)
        - [Running DKMs](#running-dkms)
        - [Running RTPs](#running-rtps)
      - [Debugging Applications](#debugging-applications)
        - [Debugging DKMs](#debugging-dkms)
        - [Debugging RTPs](#debugging-rtps)
    - [Method 2: Visual Studio Code Extension](#method-2-visual-studio-code-extension)
      - [VSCode Prerequisites](#vscode-prerequisites)
      - [Creating DKMs/RTPs](#creating-dkmsrtps)
      - [Building DKMs/RTPs](#building-dkmsrtps)
      - [Debugging DKMs/RTPs](#debugging-dkmsrtps)
  - [Inline Assembly](#inline-assembly)

## About

The role of the **Application Developer** is to create Downloadable Kernel Modules (DKMs), Real-Time Processes (RTPs), and libraries for a given VxWorks Source Build (VSB) and VxWorks Image Project (VIP).
The Software Development Kit (SDK) provides the **Application Developer** with the tools necessary to compile, debug, and test new applications/libraries.

## SDK Directory Structure

The following is an example of the SDK directory:
```
WRSDK_VXWORKS-7_<VIP_NAME>_<VSB_ARCH>_<HOST_TYPE>_<TIMESTAMP>
|
|---bsps    # Contains VxWorks images and files related to booting
|   |
|   ----<BSP>
|       |
|       ----boot
|       |   |
|       |   | vxWorks
|       |
|       ----uboot
|       |   |
|       |   | uVxWorks
|       |   | vxWorks.bin
|       |
|       ----readme
|           |
|           | readme.md
|
----toolkit    # Contains application developer tools for cross-compilation
|   |
|   ---- bin
|   ---- compilers
|   ---- include
|   ---- lib
|   ---- license
|
----scripts    # Contains scripts for the application developer
|
----artifacts    # Contains build artifacts to recreate the VxWorks VSB and VIP projects
|   |
|   | <VIP_PROFILE>.cdf
|   | vsb.config
|
----examples    # Contains a buildable set of examples for the application developer
|
----docs    # Contains VxWorks API and BSP documentation
|   |
|   ----html
|   ----man
```

## Booting a VxWorks Target

The VxWorks RTOS image within the SDK can be booted one of two ways:

1. Directly on the targeted hardware.

2. Through a virtualization platform like [QEMU](FusionSDK-QEMU-Guide.html).

For more information on how to boot the VxWorks RTOS image on the targeted hardware, see the README files within the *`<SDK_DIRECTORY>/bsps/<BSP_NAME>/readme`* directory.

## Application Development

### Method 1: Command-line

#### Command-line Prerequisites

* Source the SDK environment file to update your `PATH` and environmental variables, gaining direct access to the tools included within the SDK.

    **Linux**
    ```
    source <SDK_DIR>/toolkit/wind_sdk_env.linux
    ```

    **Windows**
    ```
    <SDK_DIR>\toolkit\wind_sdk_env.bat
    ```

#### Connecting to a VxWorks Target

Interacting with a running VxWorks target can be achieved through the **`wrdbg`** shell.

1. [Boot](#booting-a-vxworks-target) VxWorks on the target hardware or virtual machine using the files within the *`bsps`* directory.

2. Determine the assigned IP address for the target hardware or virtual machine.

3. Launch the Wind River Debug (**`wrdbg`**) shell:

    ```
    wrdbg
    ```

4. Connect to the target hardware or virtual machine using the **`wrdbg`** shell:

    ```
    target connect vxworks7:TCP:<TARGET_IP_ADDRESS>:1534 -kernel <PATH_TO_VXWORKS_IMAGE>
    ```

    Example:
    > target connect vxworks7:TCP:128.100.100.100:1534 -kernel C:\Users\user\SDK\bsps\ti_sitara_a8_2_0_1_0\boot\vxWorks

#### Building Applications

##### Building DKMs

**Linux**

```
$CC -k <DKM_FILE>.c -o <NAME OF_OUTPUT>.out
```

**Windows**

```
%CC% -k <DKM_FILE>.c -o <NAME_OF_OUTPUT>.out
```

##### Building RTPs

**Linux**

```
$CC <RTP_FILE>.c -o <NAME_OF_OUTPUT>.vxe -static
```

**Windows**

```
%CC% <RTP_FILE>.c -o <NAME_OF_OUTPUT>.vxe -static
```

#### Running Applications

##### Running DKMs

1. Using the **`wrdbg`** shell, [connect](#connecting-to-a-vxworks-target) to the target hardware or virtual machine.

2. Locate the location of the [compiled](#building-dkms) DKM on the host machine.

3. Using the **`wrdbg`** shell, load the DKM application onto the target hardware or virtual machine:

    ```
    module load <PATH_TO_DKM_APP>
    ```

    Example:
    > module load ~/SDK/examples/hello_world/DKM/dkm.out

4. Using the **`VxWorks Kernel`** shell, confirm that the DKM has been properly loaded:

    Example:
    > lkup "myDkmFunc"

    The name of the searched function should be returned if found within the kernel symbol table.
    If the value returned is zero, then no function was found.

5. Using the **`VxWorks Kernel`** shell, start a function (provided by the DKM) by typing the function name.

##### Running RTPs

1. Using the **`wrdbg`** shell, [connect](#connecting-to-a-vxworks-target) to the target hardware or virtual machine.

2. Locate the location of the [compiled](#building-rtps) RTP on the host machine.

3. Using the **`wrdbg`** shell, load the RTP application onto the target hardware or virtual machine:

    ```
    file <PATH_TO_RTP_APP>
    ```

    Example:
    > file ~/SDK/examples/hello_world/RTP/rtp.vxe

4. Using the **`wrdbg`** shell, type *`run`* to execute the RTP.

#### Debugging Applications

##### Debugging DKMs

1. Using the **`wrdbg`** shell, [connect](#connecting-to-a-vxworks-target) to the target hardware or virtual machine.

2. Locate the location of the [compiled](#building-dkms) RTP on the host machine.

3. Using the **`wrdbg`** shell, load the DKM application onto the target hardware or virtual machine:

    ```
    module load <PATH_TO_DKM_APP>
    ```

    Example:
    > module load ~/SDK/examples/hello_world/DKM/dkm.out

4. Using the **`wrdbg`** shell, create a task using one of the functions provided by the DKM:

    ```
    task create <FUNCTION>
    ```

    Example:
    > task create myDkmFunc

    With the task created, the DKM is ready to be debugged.
    For more information on the **`wrdbg`** shell and the commands available, see the [WRDBG Reference Guide](https://docs.windriver.com/bundle/WRDBG_Debug_Shell_Reference_1/page/1536389.html).

##### Debugging RTPs

1. Using the **`wrdbg`** shell, [connect](#connecting-to-a-vxworks-target) to the target hardware or virtual machine.

2. Locate the location of the [compiled](#building-rtps) RTP on the host machine.

3. Using the **`wrdbg`** shell, load the RTP application onto the target hardware or virtual machine:

    ```
    file <PATH_TO_RTP_APP>
    ```

    Example:
    > file ~/SDK/examples/hello_world/RTP/rtp.vxe

    With the application loaded, the RTP is ready to be debugged.
    For more information on the **`wrdbg`** shell and the commands available, see the [WRDBG Reference Guide](https://docs.windriver.com/bundle/WRDBG_Debug_Shell_Reference_1/page/1536389.html).

### Method 2: Visual Studio Code Extension

#### VSCode Prerequisites

* Follow the instructions outlined in the ***Setup Procedure*** section of the [VSCode Extension Guide](FusionSDK-VSCode-Guide.html)

#### Creating DKMs/RTPs

1. Launch VSCode.

2. Create/open a workspace.

3. Right-click within the `Explorer` window (the window that displays the workspace) and select `New VxWorks Downloadable Kernel Module` or `New Real-Time Process`.

4. Enter a project name.

    ![Project Creation](resources/create_project.gif)

#### Building DKMs/RTPs

1. Launch VSCode.

2. Open an existing workspace.

3. Right-click the DKM/RTP directory and select `Build Project`.

    ![Project Building](resources/buildProject.png)

#### Debugging DKMs/RTPs

1. Follow the instructions outlined in the ***Dubug Support*** section of the [VSCode Extension Guide](FusionSDK-VSCode-Guide.html) to create a *`launch.json`* configuration file.

2. Open the `Debugger` window.

3. Select the drop-down button (near the top of the window) and choose a debug configuration.

4. Press the green &#9655; button to start the debugging the configured DKM/RTP.

***Note:*** When debugging DKMs, the program will stop at the main function first. Then, you can set breakpoints as you desire.

## Inline Assembly

It is possible to include assembly instructions within your C/C++ application by using the *`asm`* keyword.

```
#include "vxWorks.h"
void main(void){
    __asm("mov ax, bx");
}
```

Multiple assembly instructions can be ran sequentially within the same *`asm`* call by separating them with a semicolon.

```
#include "vxWorks.h"
void main(void){
 __asm("push {fp, lr}; \
        add fp, sp, #4; \
        mov r3, #0; \
        mov r0, r3; \
        pop {fp, pc};");
}
```
Note that assembly code is specific to the CPU that your application will be running on and that these examples may not work on your target.


        Copyright (C) 2019 Wind River Systems, Inc.