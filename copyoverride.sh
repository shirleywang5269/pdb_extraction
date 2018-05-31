#!/bin/bash

for i in ./2017-05-06*;
do 

if [ -d "$i" ]
then 
cp  sf_move_and_unzip.csh "$i"
cp  ParallelRosetta_Extract.csh "$i"

fi
done
