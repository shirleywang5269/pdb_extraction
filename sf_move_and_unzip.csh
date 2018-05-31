#!/bin/bash -l
# ****************************************************************************
# Simple script to automate the unzipping of Rosetta silent files. 
# Updated: 24 March 2018
#
# NOTE:
#   This script's purpose is to allow you to set a large number of silent files
#   to be copied and unzipped at once, and the case that it illustrates
#   provides a good example of why it can be useful - in this case it would
#   take over 45 minutes to manually do all of this. 
#
#   Copying these silent files manually is annoying but not too long, but 
#   un-bzipping them is a very tedious process and doing them one-by-one is 
#   miserable. Set this script up to match your cases (it will take a few minutes, 
#   but will be worth it) and then let it run in the background. 
# 
#   This script is intended to be used from within a target directory that you
#   have created AFTER you have made subdirectories for each silent file to
#   live in. 
#
#   Obviously there is NO ERROR CHECKING HERE!
# ****************************************************************************
cp /global/project/projectdirs/m1532/downloads/cameo/2017-05-06_00000011_1/01_01_cm/rb_05_05_74485_117613__t000__0_C1_SAVE_ALL_OUT__482253_0.all.out.bz2 ./01-01_0c1 &
cp /global/project/projectdirs/m1532/downloads/cameo/2017-05-06_00000011_1/01_01_cm/rb_05_05_74485_117613__t000__0_C2_SAVE_ALL_OUT__482253_0.all.out.bz2 ./01-01_1c1 &
cp /global/project/projectdirs/m1532/downloads/cameo/2017-05-06_00000003_1/01_01_cm/rb_04_28_74311_117446__t000__2_C1_SAVE_ALL_OUT__481695_0.all.out.bz2 ./01-01_2c1 &
wait
#196M http://files.ipd.uw.edu/robetta/robetta_decoys/cameo/2017-05-06_00000011_1/01_01_cm/rb_05_05_74485_117613__t000__0_C1_SAVE_ALL_OUT__482253_0.all.out.bz2

echo 'Copying complete...beginning unzip'

bzip2 -dk /global/cscratch1/sd/shwang52/target/2017-05-06_00000011_1/01-01_0c1/*.bz2 &
bzip2 -dk /global/cscratch1/sd/shwang52/target/2017-05-06_00000011_1/01-01_1c1/*.bz2 &
#bzip2 -dk /global/cscratch1/sd/shwang52/target/2017-04-29_00000003_1/01-01_2c1/*.bz2 &
wait

echo 'Unzipping complete.'

echo 'Done moving and unzipping .bz2 files.'
