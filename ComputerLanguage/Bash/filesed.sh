#!/bin/bash
set -x

for file in $(find . -name "layer.vsbl")
do
    echo $file
    eval sed -i "/LAYER_REQUIRES/d" $file
done