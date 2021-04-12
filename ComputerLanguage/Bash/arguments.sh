#!/bin/bash

_function ()
{
    echo $@ # all
    echo $# # count
    echo $1 # first argument
    echo $2 # second argument
}

_function a b c 1 2 3

TODO
1.
${MGA_TOP_SOURCE_DIR}/ara-api
->
${CMAKE_INSTALL_PREFIX}/include