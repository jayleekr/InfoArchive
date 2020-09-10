#!/bin/bash


test_string_exist(){
    set -e 
    TEST="11"
    TEST2="22"
    if [ "$TEST" == "11" ] && [ "$TEST2" == "22" ] ;then
        echo "String Exist"
        exit 1
    fi
}
test_string_exist
echo "hello world"