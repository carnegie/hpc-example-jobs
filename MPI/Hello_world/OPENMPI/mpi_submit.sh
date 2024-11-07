#!/bin/bash
#SBATCH --ntasks=4   # number of tasks (i.e. number of .exe's that will run)
#SBATCH --nodes=2   # number of nodes
#SBATCH --mem-per-cpu=8G   # memory per CPU core
#SBATCH -J "Hello World OPENMPI"   # job name
#SBATCH --output=out-%j-%N.log #will create file in dir as (out-job#-node#.log)

module purge
module load openmpi

#Compile the source code (since this is written in c -> use mpicc)
mpicc -o hello_world_mpi hello_world_mpi.c

#Run across 4 CPU's (4 processes)
mpirun -n 4 ./hello_world_mpi