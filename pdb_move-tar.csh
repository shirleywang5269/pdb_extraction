#!/bin/bash -l
# ****************************************************************************
# Simple script to automate moving and archiving of .pdb files. 
# Updated: 26 March 2018
# NOTE:
#   This script is useful in the case that there are a huge number of PDB 
#   files to move, which is often the case. While a command like 
#   "mv pdbs/*.pdb final/pdbs/" would work fine for small number of files, it 
#   will fail when extremely large numbers are being moved, since the shell 
#   will expand the wildcard operator (*) in the background to include all 
#   matching files.
#
#   This script assumes you have already run a PDB extraction on one or more
#   silent files, and that the output of that extraction is located in
#   subdirectories titled 'pdbs'. It also assumes that renaming scripts have
#   been run to ensure unique file names accross all pdbs of a target (i.e.,
#   "change_pdb_names.py"). It also assumes that you have made the directory
#   './final/' in the current working directory and placed the target's crystal
#   structure inside of it BEFORE running this script (see below).
#
#   For instance, for the target T0870, which
#   this script is set up for, the working directory is t0870/, the
#   subdirectories containing silent files are t0884/0c1/ t0884/1c1, and
#   so on, and each of these subdirectories is assumed to have its own
#   subdirectory titled /pdbs/, which contains all of the extracted pdb files
#   for that silent file. 
#   
#   After moving all of the extracted pdbs into final/pdbs, the script tars up
#   the files along with the crystal structure, which must be manually searched
#   for and taken from /global/project/projectdirs/m1532/meshi.9.32/natives/.
#   You can quickly search that directory and find the needed file via a
#   command like "ls | grep -i t0870". Do this BEFORE running this script!
#
#   Obviously this script has NO ERROR CHECKING! Measure twice and cut once!
# ****************************************************************************
# Change below to match the silent file(s) you are working with.
cd /global/cscratch1/sd/shwang52/target/2017-04-29_00000003_1/
mkdir final_01-01/
mkdir final_01-01/0c1_pdbs/
mkdir final_01-01/1c1_pdbs/
mkdir final_01-01/2c1_pdbs/
echo 01-01_0c1/pdbs/*.pdb | xargs mv -t final_01-01/0c1_pdbs/ &
echo 01-01_1c1/pdbs/*.pdb | xargs mv -t final_01-01/1c1_pdbs/ &
echo 01-01_2c1/pdbs/*.pdb | xargs mv -t final_01-01/2c1_pdbs/ &
#echo 3c1/pdbs/*.pdb | xargs mv -t final/pdbs/ &
#echo 4c1/pdbs/*.pdb | xargs mv -t final/pdbs/ &

wait
echo 'Done moving .pdbs to final/pdbs/'

cd final_01-01/
echo 'Tarring up crystal and final/pdbs/'
# Change below to match the target / silent files / date / crystal.
tar -zcvf 2017-04-29_00000003_1_0c1_pdbs.tar.gz 0c1_pdbs/
tar -zcvf 2017-04-29_00000003_1_1c1_pdbs.tar.gz 1c1_pdbs/
tar -zcvf 2017-04-29_00000003_1_2c1_pdbs.tar.gz 2c1_pdbs/


echo 'Done moving and tarring.'

cp 2017-04-29_00000003_1_0c1_pdbs.tar.gz /global/project/projectdirs/m1532/downloads/cameo/2017-04-29_00000003_1/
cp 2017-04-29_00000003_1_1c1_pdbs.tar.gz /global/project/projectdirs/m1532/downloads/cameo/2017-04-29_00000003_1/
cp 2017-04-29_00000003_1_2c1_pdbs.tar.gz /global/project/projectdirs/m1532/downloads/cameo/2017-04-29_00000003_1/

echo 'Done moving tar.gz file to project directory'
cp -r 0c1_pdbs  /global/project/projectdirs/m1532/downloads/cameo/2017-04-29_00000003_1/01_01_cm
cp -r 1c1_pdbs  /global/project/projectdirs/m1532/downloads/cameo/2017-04-29_00000003_1/01_01_cm
cp -r 2c1_pdbs  /global/project/projectdirs/m1532/downloads/cameo/2017-04-29_00000003_1/01_01_cm
echo 'Done moving pdbs'
