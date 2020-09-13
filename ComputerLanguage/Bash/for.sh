#!/bin/bash

LISTS=("a" "b" "c") 

# Don't forget Brace!
echo ${LISTS[0]}
echo ${LISTS[1]}
echo ${LISTS[2]}
# Don't forget Brace!
for item in ${LISTS[@]}
do
    echo $item
done