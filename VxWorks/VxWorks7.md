VxWorks 7 SDK Quick Start Guide
===

# Overview

The VxWorks 7 SDK is a development environment dedicated to VxWorks application developers which include the following features:
* standard cross-compilation tools based on clang/LLVM which can be used to build both downloadable kernel modules (DKM) and RTP applications
* simplified build management: makefile, cmake, roll-your own
* target / architecture specific: includes a generic VxWorks kernel which is bootable on the target platform
* header files and libraries for application development
* Wind River Debugger (wrdbg)
* documentation

# Prerequisite(s)

## Host dependencies

The SDK is meant to run on Linux hosts. On Debian derivatives, the following packages need to be installed:
```sudo apt install build-essentials libc6:i386```

Having an FTP server installed on your development host will make application deployment easier and allow you to access the host file system from a vxWorks target.

```sudo apt install vsftpd```

Running the VxWorks kernel and the applications created with the SDK requires installing QEMU

```sudo apt install qemu-system-x86```


# Application development

Source the SDK environment file to update your PATH and environmental variables, gaining direct access to the tools included within the SDK. 

```
$ source <SDK_DIR>/toolkit/wind_sdk_env.linux 
```

## Building applications

A "hello world" RTPs example RTP can be built as:
```
$ $CC hello.c -static -o hello
```
Make a note of the location of your application.

## Running applications

QEMU can be used to run the VxWorks kernel included in the SDK and to deploy VxWorks applications.

```
qemu-system-x86_64 -m 512M  -kernel bsps/itl_generic_2_0_0_2/boot/vxWorks \
-display none -serial stdio -monitor none \
-append "bootline:fs(0,0)host:vxWorks h=10.0.2.2 e=10.0.2.15 u=target pw=boot o=gei0" 
```

Customizing the values for the user (u) and password (pw) parameters to the ones matching a valid FTP user on your development host will allow you to access the host file system from the VxWorks instance running in QEMU. The VxWorks instance will have access to the root folder of your FTP server.

After starting QEMU you will be presented with a command shell:
```
Target Name: vxTarget 


              VxWorks 7 SMP 64-bit

Copyright 1984-2019 Wind River Systems, Inc.

     Core Kernel version: 3.1.0.0
              Build date: Nov  7 2019 17:47:09
                   Board: x86 Processor (ACPI_BOOT_OP) SMP/SMT
               CPU Count: 1
          OS Memory Size: ~446MB
        ED&R Policy Mode: Deployed
     Debug Agent: Started (always)

->
```

Switching to the "cmd" shell will allow you to nvidate to the location of your application with greater ease.

E.g.
```
-> cmd
[vxWorks *]# 
```

Placing the application in a location accessible over FTP will make it visible with minimal configuration to the VxWorks instance.

Assuming the application is located in $HOME/opt and the FTP server uses a minimal configuration which provides FTP access to $HOME:

```
[vxWorks *]# cd opt
[vxWorks *]# ls
opt/./hello
opt/./hello.c
[vxWorks *]# more hello.c
#include <stdio.h>

int main(int arcg, char **argv) {
	printf("Hello World\n");
	return 0;
}
[vxWorks *]# hello
Launching process 'hello' ...
Process 'hello' (process Id = 0xffff8000004bb6e0) launched.
Hello World
```

Refer to the documentation in docs for additional information on creating and debugging applications.
