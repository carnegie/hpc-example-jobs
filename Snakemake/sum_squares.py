# Calculate the sum of squares of a list
def sum_squares(numbers):
    return sum(x ** 2 for x in numbers)

def process_file(input_file, output_file):
    # Read the numbers from the input file
    with open(input_file, 'r') as f:
        numbers = [float(line.strip()) for line in f]
    
    # Compute the sum of squares
    result = sum_squares(numbers)
    
    # Write the result to the output file
    with open(output_file, 'w') as f:
        f.write(str(result))

# Snakemake will automatically provide input and output files based on the rules in the Snakefile
process_file(snakemake.input[0], snakemake.output[0])