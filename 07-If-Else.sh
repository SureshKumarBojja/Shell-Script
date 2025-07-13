#!/bin/bash

NUM=$!

read NUM

if [[$NUM -gt 100]]
then
echo "$NUM is greater than 100"
else
echo "$NUM is Less than 100"
fi
