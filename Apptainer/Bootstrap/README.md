## Apptainer Custom Containers

Apptainer Build is a tool that allows you to create containers. One common case users run into is using a Python container hosted on HPC, but finding they need additional packages installed in the image. To do this, we can do what is called 'bootstraping' off a local image using a defintion file. An Apptainer Definition File (or “def file” for short) is like a set of blueprints explaining how to build a custom container. It includes specifics about the base OS to build or the base container to start from, as well as software to install, environment variables to set at runtime, files to add from the host system, and container metadata.

Let's say for example, we want to use the HPC container tensorflow-2.18.0-jupyter.sif from Dockerhub located in /carnegie/nobackup/scratch/$USER/container_images/ that we had previously already pulled, but we need it to have the astropy package installed, which is currently missing. We can create a definition file that takes this local image, bootstraps off it, and pip-installs astropy. The example definition file can be found in this directory. 

Definition files must always have a header describing the core OS to build on, and sections thereafter are optional which contain the rest of your build-time executables (sections are sometimes referred to as blobs). In this case, since we are using a locally pulled image we already had, we simply bootstrap a local image. If we were to not have this local image, you can bootstrap from docker directly for example. Bootstrap is the keyword that needs to be the first entry in the header section.

Then, to build, use the apptainer build <output_image> <def_file> command. You should see the following:
```
    $ cd /carnegie/nobackup/scratch/$USER/container_images/
    $ apptainer build tf2.18astropy_bootstrap.sif bootstrap_example.def

        INFO:    User not listed in /etc/subuid, trying root-mapped namespace
        INFO:    The %post section will be run under the fakeroot command
        INFO:    Starting build...
        INFO:    Verifying bootstrap image /carnegie/nobackup/scratch/tkaminski/container_images/tensorflow-2.18.0-jupyter.sif
        INFO:    Extracting local image...
        INFO:    Running post scriptlet
        + echo Adding Astropy Package
        Adding Astropy Package
        + pip install astropy
        Collecting astropy
        Downloading astropy-7.0.0-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (10 kB)
        Requirement already satisfied: numpy>=1.23.2 in /usr/local/lib/python3.11/dist-packages (from astropy) (2.0.2)
        Collecting pyerfa>=2.0.1.1 (from astropy)
        Downloading pyerfa-2.0.1.5-cp39-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (5.7 kB)
        Collecting astropy-iers-data>=0.2024.10.28.0.34.7 (from astropy)
        Downloading astropy_iers_data-0.2024.12.16.0.35.48-py3-none-any.whl.metadata (5.1 kB)
        Requirement already satisfied: PyYAML>=6.0.0 in /usr/local/lib/python3.11/dist-packages (from astropy) (6.0.2)
        Requirement already satisfied: packaging>=22.0.0 in /usr/local/lib/python3.11/dist-packages (from astropy) (24.1)
        Downloading astropy-7.0.0-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (10.7 MB)
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 10.7/10.7 MB 103.8 MB/s eta 0:00:00
        Downloading astropy_iers_data-0.2024.12.16.0.35.48-py3-none-any.whl (1.9 MB)
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.9/1.9 MB 91.7 MB/s eta 0:00:00
        Downloading pyerfa-2.0.1.5-cp39-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (738 kB)
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 738.7/738.7 kB 37.2 MB/s eta 0:00:00
        Installing collected packages: pyerfa, astropy-iers-data, astropy
        Successfully installed astropy-7.0.0 astropy-iers-data-0.2024.12.16.0.35.48 pyerfa-2.0.1.5
        
        INFO:    Adding help info
        INFO:    Adding runscript
        INFO:    Adding testscript
        INFO:    Running testscript
        looking for Astropy
        Astropy is installed.
        INFO:    Creating SIF file...
        INFO:    Build complete: astropy_bootstrap.sif
```

For more information on using and building definition files, please see the following [Apptainer Definition Files Documentation](https://apptainer.org/docs/user/main/definition_files.html). 