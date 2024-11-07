from mpi4py import MPI

# Initialize the MPI env
comm = MPI.COMM_WORLD
# Get the total number of ranks and the communicator among ranks
size = comm.Get_size()
rank = comm.Get_rank()

# Print a hello message from the current process with the rank and total number of processes
print('Hi, I am rank ', rank, ' among ', size, ' available ranks!')

if rank == 0:
    print('Rank ', rank, ' : You can command me privately by specifying my id!')