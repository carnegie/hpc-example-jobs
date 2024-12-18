#!/bin/bash
#SBATCH --ntasks=1   # number of tasks (i.e. number of .exe's that will run)
#SBATCH --cpus-per-task=1 # number of CPUs to assign to each task
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=4G   # memory per CPU core
#SBATCH -J "tensorflowApptainerTest"   # job name
#SBATCH --output=out-%j-%N.log #will create file in dir as (out-job#-node#.log)

echo Demo script running on `hostname`

module purge

# In general to Run via batch submission: apptainer exec <Path/to/.sif> <compiler> <program>
apptainer exec /carnegie/nobackup/scratch/tkaminski/container_images/tensorflow-2.18.0-jupyter.sif python3 tfquickstartadv.py

echo Demo script is finished