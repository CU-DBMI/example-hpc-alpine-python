#!/bin/bash

# referenced with modifications from:
# https://curc.readthedocs.io/en/latest/clusters/alpine/examples.html#full-example-job-script

#SBATCH --partition=amilan
#SBATCH --job-name=example-job
#SBATCH --output=example-job.%j.out
#SBATCH --time=01:00:00
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mail-type=ALL
#SBATCH --mail-user=youridentikey@colorado.edu

module purge
module load anaconda
conda activate example_env

python code/example.py
