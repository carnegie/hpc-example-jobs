#include <stdio.h>
#include <cuda_runtime.h>

int main( ) {
        int deviceCount = 0;
        cudaDeviceProp prop;
        cudaGetDeviceProperties(&prop, deviceCount);

        // This function call returns 0 if there are no CUDA capable devices.
        if (deviceCount == 0) {
                printf("There are no available device(s) that support CUDA\n");
        } else {
                printf("Detected %d CUDA Capable device(s)\n", deviceCount);
        }

        printf("device id %d, name %s\n", deviceCount, prop.name);
        printf("number of multi-processors = %d\n",
            prop.multiProcessorCount);
        printf("Total constant memory: %4.2f kb\n",
            prop.totalConstMem/1024.0);
        printf("Memory Clock rate: %.0f Mhz\n",
           prop.memoryClockRate * 1e-3f);
        printf("GPU Max Clock rate: %.0f MHz (%0.2f ""GHz)\n",
           prop.clockRate * 1e-3f, prop.clockRate * 1e-6f);
        printf("Memory Bus Width: %d-bit\n",
           prop.memoryBusWidth);
        printf("Shared memory per block: %4.2f kb\n",
            prop.sharedMemPerBlock/1024.0);
        printf("Total registers per block: %d\n",
            prop.regsPerBlock);
        printf("Maximum threads per block: %d\n",
            prop.maxThreadsPerBlock);
        printf("Maximum threads per multi-processor: %d\n",
            prop.maxThreadsPerMultiProcessor);
        printf("Maximum number of warps per multi-processor %d\n",
            prop.maxThreadsPerMultiProcessor/32);
        printf("Run time limit on kernels: %s\n",
            prop.kernelExecTimeoutEnabled ? "Yes" : "No");
        printf("Integrated GPU sharing Host Memory: %s\n",
            prop.integrated ? "Yes" : "No");
        printf("Support host page-locked memory mapping: %s\n",
            prop.canMapHostMemory ? "Yes" : "No");
        printf("Alignment requirement for Surfaces: %s\n",
            prop.surfaceAlignment ? "Yes" : "No");
        printf("Device has ECC support: %s\n",
            prop.ECCEnabled ? "Enabled" : "Disabled");
        return 0;
}