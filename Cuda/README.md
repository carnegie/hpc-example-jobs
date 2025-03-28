## Cuda

This example demonstrates how to create and use Cuda on Carnegie HPC. CUDA (Compute Unified Device Architecture) is a C/C++/Fortran parallel computing platform and application programming interface (API) that allows software to use graphics processing units (GPUs) for general purpose processing built by Nvidia.

In this example, we do a simple gpu device query using compiled Cuda code. To compile run: <br />
    ```
    $ nvcc -o gpu_query gpu_query.cu
    ```

Then to submit the job, run:
    ```
    $ sbatch gpu_query.sh
    ```

This example is a modified version of a tutorial from Nvidia for using Cuda sourced from: https://github.com/NVIDIA/cuda-samples/blob/master/Samples/1_Utilities/deviceQuery/deviceQuery.cpp

By following these steps, you should be able to run the program on Carnegie HPC.

The output will display the device queries (note this specific output was from BSE HPC):
    ```
    $ cat out-63760-vgpu-2017-001.log
    ```

    device id 0, name Tesla M60
    number of multi-processors = 16
    Total constant memory: 64.00 kb
    Memory Clock rate: 2505 Mhz
    GPU Max Clock rate: 1178 MHz (1.18 GHz)
    Memory Bus Width: 256-bit
    Shared memory per block: 48.00 kb
    Total registers per block: 65536
    Maximum threads per block: 1024
    Maximum threads per multi-processor: 2048
    Maximum number of warps per multi-processor 64
    Run time limit on kernels: Yes
    Integrated GPU sharing Host Memory: No
    Support host page-locked memory mapping: Yes
    Alignment requirement for Surfaces: Yes
    Device has ECC support: Disabled

For more advanced usage, please see the [Cuda Documentation](https://docs.nvidia.com/cuda/)