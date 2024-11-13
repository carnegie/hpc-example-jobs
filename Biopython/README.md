## Biopython Environment Instructions

This example of Biopython is built from GenomeDiagram Introduction tutorial from: https://biopython.org/docs/dev/Tutorial/chapter_graphics.html

This code uses the Bio.Graphics.GenomeDiagram module. GenomeDiagram was designed for drawing whole genomes. This example draws a whole genome from a SeqRecord object read in from a GenBank file. This example uses the pPCP1 plasmid from Yersinia pestis biovar Microtus, the file 'sampleinput.gb' is from online on the Biopython website.

This example also uses the Bio.Graphics module which depends on the third party Python library ReportLab. So to run this example of Biopython, please follow the instructions for setting up the environment first

1. Create and activate a Conda environment
    ```
    $ module load anaconda
    $ module load biopython
    $ conda create --name biopython
    $ conda activate biopython
    ```

2. Install the required package in the Conda environment
    ```
    $ pip install reportlab
    ```
3. Verify Installation
    ```
    $ python -c "import reportlab"
    $ python -c "import Bio"
    ```

There are many ways to view the generated PDF, but one is to copy the output file to your local computer. If you are using command line, use rsync:
    ```
    $ rsync -av --progress username@dtn.'div_name'hpc.carnegiescience.edu:/path/to/submit/dir/plasmid_linear.pdf /path/on/local/computer
    ```
