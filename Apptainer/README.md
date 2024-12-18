## Apptainer Instructions

This repository contains three examples of using prebuilt Apptainer images built from Dockerhub, on our HPC Clusters. Containers provide users a way to package complex simulations with all necessary dependencies, input files, and configurations, ensuring reproducibility and ease of use for new users. The examples here are organized into different directories based on a combination of run-method and hardware resource requirements: Batch, GPU and Open OnDemand Juypter Notebook.

You can fetch images from container registries such as Docker Hub or the NVidia NGC Catalog. The instructions below show how to create an Apptainer container from a registry, set it up for use to run jobs in various configurations.
 
Since container images can take up a significant amount of disk space (typically several gigabytes), it is recommended to change the default location Apptainer uses to cache these files. To do so, add and subsequently source the following line to your ~/.bashrc file:

  e.g. export APPTAINER_CACHEDIR=/carnegie/nobackup/scratch/$USER/.apptainer

Now to proceed:

1. In a terminal session, pull and convert this image to a local Apptainer image file (.sif) using the 'apptainer build' command:
    ```
    # This example is pulling from Docker Hub (https://hub.docker.com/)
    $ apptainer build tensorflow-2.18.0-jupyter.sif docker://tensorflow/tensorflow:2.18.0-jupyter
    ```
2. In the OnDemand setup, you can then define the Apptainer container to use a JupyterLab kernel

    Python Install: <br>
        Singularity

    Singularity / Apptainer Image: <br>
        ```
        /carnegie/nobackup/scratch/$USER/container_images/tensorflow-2.18.0-jupyter.sif
        ```

   Alternatively, if using batch, add the following line to your submit script to run code in your container environment
    ```
    # in general: apptainer exec <Path/to/.sif> <compiler> <program>
    $ apptainer exec /carnegie/nobackup/scratch/$USER/container_images/tensorflow-2.18.0-jupyter.sif python3 tfquickstartadv.py
    ```

3. Verify the Installation once setup in your Jupyterlab session or in your output log for a batch job. 
    ```
    import tensorflow as tf
    print("TensorFlow version:", tf.__version__)
    ```

This verification can be run using the example notebooks/codes in each corresponding directory. This setup will enable JupyterLab or your Slurm Job to run using the specified container image, providing access to all the dependencies and tools within the container.