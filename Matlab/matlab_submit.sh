#!/bin/bash
#SBATCH --ntasks=1   # number of tasks (i.e. number of .exe's that will run)
#SBATCH --cpus-per-task=4 # number of CPUs to assign to each task
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=4G   # memory per CPU core
#SBATCH -J "parallelmatlabtestJob"   # job name
#SBATCH --output=out-%j-%N.log

echo Demo script running on `hostname`

module purge
module load stanford/matlab/r2024a

#Run MATLAB with the GUI suppressed
matlab -batch parfor

echo Demo script is finished