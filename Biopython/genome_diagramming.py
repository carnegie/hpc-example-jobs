#Biopython example taken from the [Biopython tutorials](https://biopython.org/docs/dev/Tutorial/chapter_graphics.html) pages. 

# Genome diagraming
from Bio import SeqIO
from reportlab.lib import colors
from reportlab.lib.units import cm
from Bio.Graphics import GenomeDiagram

# Import sample gb file
record = SeqIO.read("sampleinput.gb", "genbank")

# Create an empty diagram and to that add an (empty) feature set
gd_diagram = GenomeDiagram.Diagram("Yersinia pestis biovar Microtus plasmid pPCP1")
# Then add an (empty) track
gd_track_for_features = gd_diagram.new_track(1, name="Annotated Features")
# And then add empty featureset to the track
gd_feature_set = gd_track_for_features.new_set()

# Take each gene SeqFeature object in our SeqRecord, and use it to generate a feature on the diagram
for feature in record.features:
    if feature.type != "gene":
        # Exclude this feature
        continue
    if len(gd_feature_set) % 2 == 0:
        color = colors.blue
    else:
        color = colors.lightblue
    gd_feature_set.add_feature(feature, color=color, label=True)

# Make the output file
gd_diagram.draw(
    format="linear",
    orientation="landscape",
    pagesize="A4",
    fragments=4,
    start=0,
    end=len(record),
)
gd_diagram.write("plasmid_linear.pdf", "PDF")