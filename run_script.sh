#!/bin/bash

########################################################
# File description:
# An example run script for use with:
# https://github.com/CU-DBMI/example-hpc-alpine-python
#
# Referenced with modifications from:
# https://curc.readthedocs.io/en/latest/clusters/alpine/examples.html#full-example-job-script
########################################################

########################################################
# Slurm directives:
# -------------------
# Below are configurations for Slurm, letting it know
# what and how you'd like to use resources on Alpine.
# Generally documentation on these may be found here:
# https://slurm.schedmd.com/sbatch.html
########################################################

# Indicates which Alpine-specific hardware partition you'd
# like to make use of to accomplish the work in this script.
# See: https://curc.readthedocs.io/en/latest/running-jobs/job-resources.html#partitions
#SBATCH --partition=amilan

# Provide a specific name used for identifying the job 
# as it proceeds through Slurm.
#SBATCH --job-name=example-hpc-alpine-python

# Tells Slurm to gather standard output from running this
# file and send to a specific file.
# Special variable symbols may be used here:
# %j - job ID
# %a - job array index
# %A - job array job ID
#SBATCH --output=example-hpc-alpine-python.%j.out

# Sets a limit on the total time this work may take.
# The format below is in the form of hours:minutes:seconds.
#SBATCH --time=01:00:00

# Sets certain Alpine-specific characteristics the Slurm work
# performed. Can be one of: normal, long, mem.
# See: https://curc.readthedocs.io/en/latest/running-jobs/job-resources.html#quality-of-service
#SBATCH --qos=normal

# Advises Slurm about the minimum nodes necessary for completing
# the work included in this script.
#SBATCH --nodes=1

# Advises Slurm about the maximum number of tasks involved 
# with batch processing.
#SBATCH --ntasks=4

# Sets an email address to receive notifications from Alpine
#SBATCH --mail-user=your-email-address-here@cuanschutz.edu

# Indicate which notifications you'd like to receive from Alpine
# this can also be set to START, END, or FAIL.
#SBATCH --mail-type=ALL

########################################################
# Module package commands:
# ------------------------
# Next, we use the module package to help load 
# software which is pre-loaded on Alpine.
########################################################

# unloads all existing modules which may have been previously loaded
module purge
# use module package to load anaconda software so it may
# be used by your processes
module load anaconda

########################################################
# Anaconda environment manangement:
# ---------------------------------
# Here we load the Anaconda environment to be used
# for running the Python code below.
########################################################
conda activate example_env

########################################################
# Run a Python file (within Anaconda environment):
# ------------------------------------------------
# After loading the environment we run the Python
# code to perform the work we'd like to accomplish.
########################################################
python code/example.py
