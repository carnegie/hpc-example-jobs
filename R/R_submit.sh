#!/bin/bash
#SBATCH --ntasks=1   # number of tasks (i.e. number of .exe's that will run)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=4G   # memory per CPU core
#SBATCH -J "RtestJob"   # job name
#SBATCH --output=out-%j-%N.log

echo Demo script running on `hostname`

module purge
module load R

# Run R for batch
Rscript <code>.R

echo Demo script is finished