#!/bin/bash
#SBATCH --ntasks=1   # number of tasks (i.e. number of .exe's that will run)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=8G   # memory per CPU core
#SBATCH -J "Hello World HDF5"   # job name
#SBATCH --output=out-%j-%N.log #will create file in dir as (out-job#-node#.log)

module purge
module load conda

conda activate hdf5

echo Demo script running on `hostname`

# Compile the source code
gcc -o test_hdf5_crtdat h5_crtdat.c -lm -lhdf5

# Run
./test_hdf5_crtdat

# Test the output file by viewing the file contents
file dset.h5
h5dump -n dset.h5

echo Demo script is finished