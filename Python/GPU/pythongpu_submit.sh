#!/bin/bash
#SBATCH --ntasks=1   # number of tasks (i.e. number of .exe's that will run)
#SBATCH --cpus-per-task=1 # number of CPUs to assign to each task
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=4G   # memory per CPU core
#SBATCH --gres=gpu:1   # number of gpus per node
#SBATCH -J "pythongpuTest"   # job name
#SBATCH --output=out-%j-%N.log #will create file in dir as (out-job#-node#.log)

echo Demo script running on `hostname`

module purge
module load conda
module load pytorch

# Run code
python3 pytorch_svd.py

echo Demo script is finished