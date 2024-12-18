#!/bin/bash
#SBATCH --ntasks=1   # number of tasks (i.e. number of .exe's that will run)
#SBATCH --cpus-per-task=1 # number of CPUs to assign to each task
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=4G   # memory per CPU core
#SBATCH --gres=gpu:1   # number of gpus per node
#SBATCH -J "tensorflowApptainerGPUTest"   # job name
#SBATCH --output=out-%j-%N.log #will create file in dir as (out-job#-node#.log)

echo Demo script running on `hostname`

module purge

# Load compatible version of CUDA to match Tensorflow image
module load cuda/11.8

export APPTAINERENV_CUDA_VISIBLE_DEVICES=${CUDA_VISIBLE_DEVICES}

# Need --nv for GPU use
apptainer exec --nv /carnegie/nobackup/scratch/tkaminski/container_images/tensorflow-2.13.0-gpu.sif python3 gpuvscpu_tf.py

echo Demo script is finished