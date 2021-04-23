#!/bin/bash

lists=("V0.1.0" "V1.0.0")
echo "[1] : "${lists[1]}
echo "[0] : "${lists[0]}
echo "[3] : "${lists[3]}
echo "[-1] : "${lists[-1]}

selected=${lists[-1]}
echo "selected : "$selected