#!/bin/bash

for i in ./*;
do 

if [ -d "$i" ]
then 
cp -n new_pdb_names.py "$i"
#cp  ParallelRosetta_Extract.csh "$i"

fi
done
