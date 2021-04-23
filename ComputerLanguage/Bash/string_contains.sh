#!/bin/bash

set -x
test_string_exist(){
    string='My string';

    if [[ $string =~ "My" ]]; then
        echo "It's there!"
    fi
}



test_string_exist
echo "hello world"