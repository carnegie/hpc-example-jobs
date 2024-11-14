#!/bin/bash
#SBATCH --ntasks=1   # number of tasks (i.e. number of .exe's that will run)
#SBATCH --cpus-per-task=4 # number of CPUs to assign to each task
#SBATCH --mem-per-cpu=4G   # memory per CPU core
#SBATCH -J "snakemakeTest"   # job name
#SBATCH --output=out-%j-%N.log

echo Demo script running on `hostname`

module purge
module load snakemake

# Run Snakemake, --cores specifies #cores snakemake should use for the execution
snakemake --cores 4 sorted_sums.txt
# Creates a Visualization of the DAG of our workflow
snakemake --dag sorted_sums.txt | dot -Tsvg > dag.svg

echo Demo script is finished