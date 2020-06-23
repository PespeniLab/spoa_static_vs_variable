# Unique genomic and phenotypic responses to extreme and variable pH conditions in purple urchin larvae

This repository contains scripts for analyses of a static and variable pH single generation selection experiment in S. purpuratus. This is published in Integrative and Comparative Biology. Link to paper [here](https://doi.org/10.1093/icb/icaa072).

If you use these resources, please cite the following publication:

Garrett, A.D., Brennan, R.S., Steinhart, A.L., Pelletier, A.M. and Pespeni, M.H., 2020. Unique genomic and phenotypic responses to extreme and variable pH conditions in purple urchin larvae. Integrative and Comparative Biology.

We are happy to discuss any issues and/or answer questions about the scripts.


## Data availability

All data for these analyses are available for public use. Please contact us with any questions.

- Raw sequence data: ???  
- pH: `data/pH_Data.csv`  
- Morphology: `data/Body_length_Data.csv`  
- Survival: `data/Survival_Data.csv`  

Summary table of results:  
- allele frequencies for all loci: `filtered_allele_freqs.txt.gz`  
- CMH results: `cmh_output.txt.gz`  

## Scripts

Below are scripts to run the full analysis for the manuscript. A short description accompanies each.

### data processing, variant calling and filtering

#### Prep for alignment

- Trim with trimmomatic
    - `FILENAME`
- sort and index genome
    - `SortIndexSamtools.sh`

#### align

- align with bwa mem
    - `FILENAME`

#### Call variants

- initially using varscan with very lenient parameters. This requires more stringent filtering in the next step.
    - `FILENAME`

#### Filter variants

- Filter by missing, depth, MAF, and so on.
    - `FILENAME`

### Analysis and figures

-PCA, PERMANOVA
  - `Fig02_PCA.R`

- Calculate CMH statistic
    - `FILENAME`

- Run GO enrichment
  - `gene_annotation_enrichment.md`
  - These scripts link SNPs to genes, gene annotations, and performs functional enrichment/ generates the GO figure.

#### Figures

- fig 1: `Fig01.R`
- fig 2: `Fig02_PCA.R`
- fig 3: `snp_class_plot.R`
- fig 4: `CorrelationPlots.R`
- fig 5: in `gene_annotation_enrichment.md`

- supplemental figures
  - Fig. S1: `snp_class_plot.R`
  - GO supplemental figures in `gene_annotation_enrichment.md`

