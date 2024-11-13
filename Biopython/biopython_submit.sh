#!/bin/bash
#SBATCH --ntasks=1   # number of tasks (i.e. number of .exe's that will run)
#SBATCH --cpus-per-task=1 # number of CPUs to assign to each task
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=4G   # memory per CPU core
#SBATCH -J "biopythontestJob"   # job name
#SBATCH --output=out-%j-%N.log

echo Demo script running on `hostname`

module purge
module load biopython

#Activate the environment we created
conda activate biopython

#Run using python3
python3 genome_diagramming.py

echo Demo script is finished