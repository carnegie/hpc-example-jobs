# Pytorch test to calculate the Singular Value Decomposition (SVD) using GPU functionality
from time import perf_counter
import torch

# Create matrix
N = 1000
# Specify the GPU Device (1 gpu => cuda:0)
cuda0 = torch.device('cuda:0')

# Create a random matrix on the GPU
x = torch.randn(N, N, dtype=torch.float64, device=cuda0)

# Start the timer, compute SVD and then calculate the computation time
t0 = perf_counter()
u, s, v = torch.svd(x)
elapsed_time = perf_counter() - t0

print("Execution time: ", elapsed_time)
print("Result: ", torch.sum(s).cpu().numpy())
print("PyTorch version: ", torch.__version__)