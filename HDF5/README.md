## HDF5 Environment Instructions

HDF5 is a data model, library, and file format for storing and managing data. It supports an unlimited variety of datatypes, and is designed for flexible and efficient I/O and for high volume and complex data.

HDF5 is available as a module on our Carnegie clusters, but for this example please follow the instructions for setting up a custom library version. 

1. Create and activate a Conda environment for mpi4py
    ```
    $ module load conda
    $ conda create -n hdf5
    $ conda activate hdf5
    ```

2. Install HDF5 1.14.5 in the Conda environment (this is to ensure the headers and library match, you will receive nasty errors if they do not)
    ```
    $ conda install -c anaconda hdf5=1.14.5
    ```

Running h5_crtdat.c will create the file, dset.h5 in the working directory that you run the job from. 