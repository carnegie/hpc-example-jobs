## Job Arrays

This example is meant to demonstrate using Slurm job arrays for running the same calculation on multiple differing input files. 

In this example, each task in a SLURM array job reads its corresponding file (e.g., 1.in, 2.in), processes the data, and performs a mathematical operation on the numbers. Specifically we calculate the square roots of the numbers in the input file.

When the job array runs, each task is assigned a unique index (SLURM environment variable SLURM_ARRAY_TASK_ID). This index is used to determine which file to process (e.g., task 1 processes 1.in, task 2 processes 2.in, etc.)

Outputs will look as follows
    ```
    $ cat out.log
    ```

    My SLURM_ARRAY_JOB_ID is #####.
    My SLURM_ARRAY_TASK_ID is 1
    Executing on the machine: <node_name>.hpc.carnegiescience.edu
    Square roots of numbers from 1.in: [2.449489742783178, 2.6457513110645907, 2.8284271247461903, 3.0, 3.1622776601683795]

For more advanced Job Array usage, please see the [Slurm Job Array Documentation](https://slurm.schedmd.com/job_array.html) or or reach out to our [HPC team](https://carnegiescience.atlassian.net/servicedesk/customer/portal/3/group/18/create/60) with specific questions. 