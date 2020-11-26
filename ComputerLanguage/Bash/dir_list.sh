#!/bin/bash

for dir in $(ls -d ../*)
do 
    echo "dir : $dir"
    echo "full path : $(readlink -f $dir)"
done