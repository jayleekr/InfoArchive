``` sh
# Author : Jay Lee
# E-mail : jaewon.lee@hyundai-autron.com
# Last-Edit : 2020-07-17

#!/bin/bash

MACHINE=s32g274aevb
DOWNLOAD_DIR=/adar/downloads
SSTATE_CACHE_DIR=/adar/sstate-cache
PATCH_DIR=/adar/patch
BSP_DIR=/adar/fsl-auto-yocto-bsp/sources/

IS_VERBOSE=""



do_patch(){
    cp -rf $PATCH_DIR/* $BSP_DIR/
}

do_setup_env() {
    cd /adar/fsl-auto-yocto-bsp
    source nxp-setup-alb.sh -m $MACHINE -d $DOWNLOAD_DIR -c $SSTATE_CACHE_DIR
    bitbake-layers add-layer /adar/meta-mobilgene
    do_patch 
}

do_verbose() {
    IS_VERBOSE=" -v"
}

do_compile() {
    do_setup_env
    bitbake $IS_VERBOSE mobilgene
}

do_populate_sdk() {
    do_setup_env
    bitbake $IS_VERBOSE fsl-image-mobilgene -c populate_sdk
}

do_build_image() {
    do_setup_env
    bitbake $IS_VERBOSE fsl-image-mobilgene
}

do_build_all() {
    do_compile
    do_build_image
    do_populate_sdk
}

usage(){
    echo "****************************************************************************************"
    echo "mobilgene SDK Build Tool"
    echo "This tool helps builds.."
    echo "  1. S32G Evaluation Board (s32gaevb) Linux BSP"
    echo "  2. Libraries which is necessary for mobilgene Adaptive SDK"
    echo "  3. mobilgene Adaptive SDK"
    echo \
"
    *** Possible Options
        * [-h]:         Print Usages   
        * [-v]:         Verbose Mode on
        * [-c]:         Build mobilgene SDK only (/adar/fsl-auto-yocto-bsp/build_s32g274aevb/tmp/deploy/rpm/aarch64/mobilgene-0.1.1-r0.aarch64.rpm)
        * [-i]:         Generate Image (/adar/fsl-auto-yocto-bsp/build_s32g274aevb/tmp/deploy/images/s32g274aevb/*)
        * [-s]:         Generate mobilgene SDK installer (/adar/fsl-auto-yocto-bsp/build_s32g274aevb/tmp/deploy/sdk/fsl-auto-glibc-x86_64-aarch64-toolchain-1.0.sh)
        * [-a]:         Generate All : mobilgene SDK, Image, Installer
"
    echo "****************************************************************************************"
    exit 1
}

if [ $# -eq 0 ] || [ $# -gt 2  ]; then
    echo "[Error] Check your option : $@, $#"  
    usage
fi

while getopts "hvcisa" setup_flag
do
    echo "flag : $setup_flag"
    case $setup_flag in
        h)
            # [-h]:         Print Usages   
            usage
            ;;
        v) 
            # [-v]:         Verbose Mode on
            do_verbose
            ;;
        c) 
            # [-c]:         Build mobilgene SDK only
            b_setup_compile="true";
            break
            ;;
        i)
            # [-i]:         Generate Image
            b_setup_build_image="true";
            break
            ;;
        s)
            # [-s]:         Generate mobilgene SDK installer 
            b_setup_populate_sdk="true";
            break
            ;;
        a)
            # [-a]:         Generate All : mobilgene SDK, Image, Installer
            b_setup_build_all="true";
            break
            ;;
        ?) 
            echo "Unrecognizable option."
            usage
            ;;
    esac
done

if [ -z $b_setup_compile ]; then 
    do_compile
elif [ -z $b_setup_build_image ]; then
    do_build_image 
elif [ -z $b_setup_populate_sdk ]; then 
    do_populate_sdk
elif [ -z $b_setup_build_all ]; then 
    do_build_all
else
    echo "[Error] Undefined function"
fi

echo "Build Done"

```