#!/bin/bash

while getopts "dhlc:" setup_flag
do
    case $setup_flag in 
        d)
            echo "DEBUG"
            CMAKE_BUILD_TYPE="Debug";;
        c)
            echo "C"
            echo "OPTARG : $OPTARG";;
        ?)
            echo "[Error] Unknown option : $setup_flag"
            exit 1;;
    esac
done