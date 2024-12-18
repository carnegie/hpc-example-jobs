#!/bin/bash
#SBATCH --ntasks=4   # number of tasks (i.e. number of .exe's that will run)
#SBATCH --cpus-per-task=1 # number of CPUs to assign to each task
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=1G   # memory per CPU core
#SBATCH -J "mpi4py Test Job"   # job name
#SBATCH --output=out-%j-%N.log

module purge
module load conda
module load openmpi

# Activate mpi4py conda env
conda activate mpi4py

# Run across 4 CPU's (4 processes)
mpirun -np 4 python3 hello_world_mpi.py