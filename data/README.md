Source of the data files

# Genome: S_lycopersicum_chromosomes.2.40.chr6-0-100000.2bit

The whole genome was downloaded from http://bioviz.org/quickload/S_lycopersicum_May_2012/S_lycopersicum_May_2012.2bit 

The cropping was done with
```sh
conda install -c bioconda ucsc-twobittofa ucsc-twobittofa ucsc-fatotwobit 
twoBitToFa -seq=SL2.40ch06 -start=0 -end=100000 S_lycopersicum_May_2012.2bit S_lycopersicum_chromosomes.2.40.chr6-0-100000.fa
faToTwoBit S_lycopersicum_chromosomes.2.40.chr6-0-100000.fa S_lycopersicum_chromosomes.2.40.chr6-0-100000.2bit
```

# Genes: S_lycopersicum_May_2012.chr6-0-100000.bb

The bed file of the whole genome was downloaded from 
http://bioviz.org/quickload/S_lycopersicum_May_2012/S_lycopersicum_May_2012.bed.gz

The cropping was done with
```sh
conda install -c bioconda ucsc-twoBitInfo ucsc-bigBedToBed ucsc-bedToBigBed
twoBitInfo S_lycopersicum_May_2012.2bit genome.txt
# description field is too long for bedToBigBed so it must be trimmed
gunzip -c S_lycopersicum_May_2012.bed.gz | perl -n -e 'chomp;@F=split(/\t/);$F[13] = substr($F[13],0,255); print join("\t", @F),"\n";'  > S_lycopersicum_May_2012.bed.trimmed
bedToBigBed -tab -type=bed12+2 S_lycopersicum_May_2012.bed.trimmed genome.txt S_lycopersicum_May_2012.bb
bigBedToBed -chrom=SL2.40ch06 -start=0 -end=100000 S_lycopersicum_May_2012.bb S_lycopersicum_May_2012.chr6-0-100000.bed
bedToBigBed -tab -type=bed12+2 S_lycopersicum_May_2012.chr6-0-100000.bed genome.txt S_lycopersicum_May_2012.chr6-0-100000.bb
```

# Feature: A-AFFY-87.bb

AFFY-87 microarray probes as feature annotations.

The big bed was constructed from a gff file using the following commands:
```sh
conda install -c bioconda ucsc-twoBitInfo ucsc-bigBedToBed ucsc-bedToBigBed pybedtools bedops
# Download a gff file
wget ftp://ftp.solgenomics.net/tomato_genome/microarrays_mapping/A-AFFY-87_AffyGeneChipTomatoGenome.probes_ITAG2.3genome_mapping.gff
# Sort gff
bedtools sort -i A-AFFY-87_AffyGeneChipTomatoGenome.probes_ITAG2.3genome_mapping.gff > A-AFFY-87_AffyGeneChipTomatoGenome.probes_ITAG2.3genome_mapping.sorted.gff
# Convert gff to bed
gff2bed < A-AFFY-87_AffyGeneChipTomatoGenome.probes_ITAG2.3genome_mapping.sorted.gff > A-AFFY-87_AffyGeneChipTomatoGenome.probes_ITAG2.3genome_mapping.bed
# Fetch chrom sizes
twoBitInfo S_lycopersicum_May_2012.2bit genome.txt
# Convert bed to bigbed
wget https://raw.githubusercontent.com/nlesc-ave/ave-rest-service/master/gff3.as
bedToBigBed -tab -type=bed6+4 -as=gff3.as A-AFFY-87_AffyGeneChipTomatoGenome.probes_ITAG2.3genome_mapping.bed genome.txt A-AFFY-87.bb
```

# Variants: tomato_snps.chr6-0-100000.bcf + tomato_snps.chr6-0-100000.bcf.csi

All the anaylis VCF files of https://www.ebi.ac.uk/ena/data/view/PRJEB5235 project where downloaded and combined into a single bcf file using the commands described at
https://github.com/nlesc-ave/ave-rest-service/blob/master/README.md#Variants

Cropping was done with
```
conda install -c bioconda bcftools
bcftools view -O b -r SL2.40ch06:0-100000 tomato_snps.bcf > tomato_snps.chr6-0-100000.bcf
bcftools index tomato_snps.chr6-0-100000.bcf
```
