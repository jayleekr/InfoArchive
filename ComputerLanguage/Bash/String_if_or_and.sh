#!/bin/bash


test_string_exist(){
    TEST="11"
    TEST2="22"
    if [ "$TEST" == "11" ] && [ "$TEST2" == "22" ] ;then
        echo "String Exist by And"
    fi

    if [ "$TEST" == "33" ] || [ "$TEST2" == "22" ] ;then
        echo "String Exist by Or"
    fi
}

test_string_exist