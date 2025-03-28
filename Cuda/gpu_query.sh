#!/bin/bash
#SBATCH --ntasks=1   # number of tasks (i.e. number of .exe's that will run)
#SBATCH --nodes=1   # number of nodes
#SBATCH --gres=gpu:1   # number of gpus
#SBATCH -J "cudagpuTest"   # job name
#SBATCH --output=out-%j-%N.log #will create file in dir as (out-job#-node#.log)

# Load CUDA module
module load cuda

# Run CUDA code
srun -n 1 ./gpu_query