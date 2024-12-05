# hpc-example-jobs

## Overview

This repository contains Carnegie HPC intro example code and scripts to help users get started with modules, softwares and Slurm job management techniques.

## Getting Started

Be cautious as to which cluster you run these on. All were written specifically for Carnegie HPC clusters, however not all clusters have the same hardware resources (GPUs for example).

For a few of the more advanced examples, please refer to the README in the working directory.

To run:

      $user@host[~]:   ssh <user>@<cluster>.carnegiescience.edu
      $user@host[~]:   cd $SLURM_SUBMIT_Dir
      $user@host[~]:   sbatch <script_name>.sh

## Cloning the Repository

Clone this to the cluster or your local machine:

      $ git clone https://github.com/carnegie/hpc-example-jobs.git
      $ cd hpc-example-jobs

## Troubleshooting and Additional Resources

Here are a few recommended articles:
* [Quick Start](https://carnegiescience.refined.site/space/HPC/215351316/Quick+Start)
* [Running Jobs](https://carnegiescience.refined.site/space/HPC/215121978/Running+Jobs)
* [FAQ](https://carnegiescience.refined.site/space/HPC/215187457/FAQ)

If you encounter issues, please check our [documentation](https://carnegiescience.refined.site/space/HPC) or reach out to our [HPC team](https://carnegiescience.atlassian.net/servicedesk/customer/portal/3/group/18/create/60).