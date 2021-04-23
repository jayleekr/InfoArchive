#!/bin/bash
set -x

for file in $(find . -name "*.txt")
do
    echo $file
    eval sed -i "/confidential/d" $file # confidential 이 포함된 라인 지우기
done