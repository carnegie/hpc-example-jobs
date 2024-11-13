#!/bin/bash
#SBATCH --time=0:01:00   # time limit
#SBATCH --ntasks=1   # number of tasks (i.e. number of .exe's that will run)
#SBATCH --cpus-per-task=1 # number of CPUs to assign to each task
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem=1G   # memory per CPU core
#SBATCH -J "astropytestJob"   # job name
#SBATCH --output=out-%j-%N.log

echo Demo script running on `hostname`

module purge
module load python

#Run using python3
python3 cosmology.py

echo Demo script is finished
