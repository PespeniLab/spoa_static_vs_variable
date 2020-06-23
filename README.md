# S. purpuratus variable and static pH experiment

This repository contains scripts for analyses of a static and variable pH single generation selection experiment in S. purpuratus. 

## Data availability

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

