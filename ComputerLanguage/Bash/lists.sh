#!/bin/bash

LISTS=()
for line in $(docker ps -a | grep adar | awk '{print $12}')
do
    LISTS+=("$line") # Don't forget Bracket
done

# Don't forget Brace!
echo ${LISTS[0]}
echo ${LISTS[1]}
echo ${LISTS[2]}