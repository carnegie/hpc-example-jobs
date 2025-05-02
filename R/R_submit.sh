#!/bin/bash
#SBATCH --ntasks=1   # number of tasks (i.e. number of .exe's that will run)
#SBATCH --cpus-per-task=10   # number of cores to run in parallel
#SBATCH --mem-per-cpu=1G   # memory per CPU core
#SBATCH -J "RtestJob"   # job name
#SBATCH --output=out-%j-%N.log

echo Demo script running on `hostname`

module purge
module load r/4.3.2

#Run R script
Rscript R_parallel.R

echo Demo script is finished