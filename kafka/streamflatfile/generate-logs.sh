#!/bin/bash

for ((i = 1; i <= 20; i++)); do
    logger "This is a test log message $i"
done
