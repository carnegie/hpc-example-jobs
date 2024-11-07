#include <stdio.h>
#include <mpi.h>  //MPI Library

int main(int argc, char** argv)
{
	MPI_Init(NULL, NULL);  //Initialize the MPI Env

    // MPI_COMM_RANK is a function that determines the rank of the process within a communicator
	int PID;  //Process Identifier
	MPI_Comm_rank(MPI_COMM_WORLD, &PID);
	
    // MPI_COMM_SIZE is a function that determines the amount of concurrency 
    int number_of_processes;
	MPI_Comm_size(MPI_COMM_WORLD, &number_of_processes);

    // Print a hello world message from the current process with the rank and total number of processes
	char processor_name[MPI_MAX_PROCESSOR_NAME];
	int name_length;
	MPI_Get_processor_name(processor_name, &name_length);
	printf("Hello MPI user: from process PID %d out of %d processes on machine %s\n", PID, number_of_processes, processor_name);
	
    MPI_Finalize();  //Finalize the env, no MPI routines should follow this
	return 0;
}