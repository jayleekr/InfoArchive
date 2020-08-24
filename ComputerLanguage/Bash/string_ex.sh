#!/bin/bash


test_string_exist(){
    set -e 
    TEST="11"
    if [ -e "$TEST" ];then
        echo "String Exist"
        exit 1
    fi
}
test_fail(){
    mkdir /a
    echo "test_fail"
}


test_string_exist
test_fail
echo "hello world"