# Sort the sums
def sort_out(input_files, output_file):
    # Read all the numbers from the input files
    sums = []
    for input_file in input_files:
        with open(input_file, 'r') as f:
            sums.append(float(f.read().strip()))
    
    # Sort the sums
    sums.sort()
    
    # Write the sorted sums to the output file
    with open(output_file, 'w') as f:
        for sum in sums:
            f.write(f"{sum}\n")

sort_out(snakemake.input, snakemake.output[0])