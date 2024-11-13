import os
import math

# Retrieve the index for the SLURM job array from the environment variable
task_index = int(os.environ["SLURM_ARRAY_TASK_ID"])

# Build the filename based on the task index
input_filename = f'{task_index}.in'

# Read the contents of the file corresponding to the task index
with open(input_filename, 'r') as file:
    content = file.readlines()

# Convert the list of strings into integers
number_strings = content[0].strip().split(",")
numbers = [int(num) for num in number_strings]

# Calculate the square root of each number in the list
sqrt_numbers = [math.sqrt(num) for num in numbers]
print(f"Square roots of numbers from {input_filename}: {sqrt_numbers}")