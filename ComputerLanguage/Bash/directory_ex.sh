#!/bin/bash
test_dir_exist(){
    set -ex
    if [ -e "/home/jayleekr/workspace/07_infoArchive/ComputerLanguage/Bash" ];then
        echo "DIR Exist"
        exit 1

    fi
}
test_fail(){
    mkdir /a
    echo "test_fail"
}
test_dir_exist
echo "hello world"