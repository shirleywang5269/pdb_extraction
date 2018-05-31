#!/bin/bash

for d in */ ; do
    mkdir $d/01-01_0c1
    rm -rf $d/ok
done
