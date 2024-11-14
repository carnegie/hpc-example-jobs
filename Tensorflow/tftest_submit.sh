#!/bin/bash
#SBATCH --nodes=2   # number of nodes
#SBATCH --gpus=tesla-m60:2   # request 2 gpu's for code
#SBATCH -J "tensorflowTest"   # job name
#SBATCH --output=out-%j-%N.log #will create file in dir as (out-job#-node#.log)

echo Demo script running on `hostname`

module purge
module load tensorflow
conda activate tensorflow-2.15.0

# Run code
python3 tensorflow_test.py

echo Demo script is finished