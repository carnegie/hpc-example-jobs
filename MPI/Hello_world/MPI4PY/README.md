## MPI4PY Environment Instructions

To use mpi4py, please follow the instructions for setting up the environment first

1. Create and activate a Conda environment for mpi4py
    ```
    $ module load anaconda
    $ conda create --name mpi4py
    $ conda activate mpi4py
    ```

2. Install mpi4py in the Conda environment
    ```
    $ module load openmpi
    $ export MPICC=$(which mpicc)  # Set the loaded version of MPI to be used with mpi4py
    $ pip install mpi4py --no-cache-dir
    ```
3. Verify Installation
    ```
    $ python -c "import mpi4py"
    ```