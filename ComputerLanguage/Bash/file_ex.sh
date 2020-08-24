#!/bin/bash


file_exist(){
    set -e 
    TEST="/home/jayleekr/workspace/00_codes/05_info_archive/InfoArchive/ComputerLanguage/Bash/file_ex.sh"
    if [ -f "$TEST" ];then
        echo "File Exist"
        exit 1
    fi
}
test_fail(){
    mkdir /a
    echo "test_fail"
}

file_exist
echo "hello world"