#!/bin/bash

FRUITS=("APPLE" "ORANGE" "GRAPES" "SAPOTA" "PINE APPLE" "BANANA")
echo "1st: ${FRUITS[0]}"
echo "2nd: ${FRUITS[1]}"
echo "first 3: ${FRUITS[@]:0:3}"
echo "All: ${FRUITS[@]}"