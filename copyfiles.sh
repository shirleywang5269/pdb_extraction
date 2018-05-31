#!/bin/bash

for i in ./*;
do 

if [ -d "$i" ]
then 
cp -n sf_move_and_unzip.csh "$i"
cp -n ParallelRosetta_Extract.csh "$i"

fi
done
