#!/bin/bash
test_dir_exist(){
    set -e 
    if [ -e "/home/jayleekr/workspace/00_codes/05_info_archive" ];then
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