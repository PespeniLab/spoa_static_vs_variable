## Functional annotation, GO enrichment

The code below links snps to genes, genes to annotations, runs functional enrichment, and generates the heirarchical clustering for the GO plot.

### link snps to genes with SnpEff

input: final set of filtered snps: `final_snps.vcf`
output: SnpEff annotations: `annotation.out`

```bash

java -Xmx4g -jar ~/bin/snpEff/snpEff.jar -c ~/bin/snpEff/snpEff.config -no-downstream -v Strongylocentrotus_purpuratus  ~/spoa/analysis/final_snps.vcf  > ~/spoa/analysis/annotation.out

```

Next, we need to modify the format of the SnpEff output `annotation.out` and assign each snp to a gene and broad category (exon, non-coding, etc). Run in R

input: `annotation.out`
output: `formatted.annotations.out`

```r

library(stringr)
library(ggplot2)
library(gridExtra)
library(MASS)

dat <- read.table("~/spoa/analysis/annotation.out", stringsAsFactors=FALSE)

# split annotations
eff <- strsplit(as.character(dat$V8), split=",", fixed=TRUE)

out <- dat

for (i in 1:length(eff)){
    if(length(eff[[i]]) == 1){
        out$V8[i] <- eff[[i]]
    }
    else{
        # pull out the effect of each variant
        # they're ordered by severity
        out$V8[i] <- eff[[i]][1]
        }
    }

# add snp id
out$SNP <- paste(out$V1, out$V2, sep=":")

out_ann <- data.frame(SNP=out$SNP, ANN=out$V8)
# split annotation
ann_split <- (str_split_fixed(out$V8, "\\|", n=16))
out_ann <-(cbind(out$SNP, ann_split))

colnames(out_ann) <- c("SNP","Allele","Annotation","Annotation_Impact","Gene_Name","Gene_ID", "Feature_Type","Feature_ID", "Transcript_BioType","Rank","HGVS.c","HGVS.p","cDNA.pos",  "cDNA.length","CDS.pos","Distance","WARNINGS")

########################################
# assign functional categories
########################################

new <- as.data.frame(out_ann)

# assign class  ie, intergenic, etc
new$class <- c(NA)

new$class[which(new$Annotation == "downstream_gene_variant" |
    new$Annotation == "intergenic_region")] <- c("intergenic")
new$class[which(new$Annotation == "upstream_gene_variant")] <- c("upstream")
new$class[which(new$Annotation == "intron_variant" |
    new$Annotation == "splice_region_variant&intron_variant"|
    new$Annotation == "splice_acceptor_variant&intron_variant"|
    new$Annotation == "splice_donor_variant&splice_region_variant&intron_variant"|
    new$Annotation == "splice_region_variant"|
    new$Annotation == "splice_region_variant&intron_variant" |
    new$Annotation == "splice_region_variant&synonymous_variant"|
    new$Annotation == "splice_region_variant&non_coding_transcript_exon_variant"|
    new$Annotation == "non_coding_transcript_exon_variant"|
    new$Annotation == "splice_donor_variant&intron_variant"|
    new$Annotation == "3_prime_UTR_variant"|
    new$Annotation == "splice_acceptor_variant&splice_donor_variant&intron_variant"|
    new$Annotation == "splice_acceptor_variant&splice_region_variant&intron_variant")] <- c("intron")
new$class[which(new$Annotation == "synonymous_variant" |
    new$Annotation == "stop_retained_variant"|
    new$Annotation == "splice_region_variant&stop_retained_variant")] <- c("synonymous")
new$class[which(new$Annotation == "missense_variant" |
    new$Annotation == "stop_gained" |
    new$Annotation == "stop_lost"|
    new$Annotation == "missense_variant&splice_region_variant"|
    new$Annotation == "start_lost"|
    new$Annotation == "stop_gained&splice_region_variant"|
    new$Annotation == "stop_lost&splice_region_variant"|
    new$Annotation == "frameshift_variant"|
    new$Annotation == "disruptive_inframe_deletion"|
    new$Annotation == "frameshift_variant&stop_gained"|
    new$Annotation == "conservative_inframe_insertion"|
    new$Annotation == "conservative_inframe_deletion"|
    new$Annotation == "start_lost&conservative_inframe_deletion"|
    new$Annotation == "disruptive_inframe_insertion"|
    new$Annotation == "stop_gained&disruptive_inframe_insertion"|
    new$Annotation == "frameshift_variant&splice_region_variant"|
    new$Annotation == "frameshift_variant&stop_lost"|
    new$Annotation == "frameshift_variant&splice_region_variant"|
    new$Annotation == "frameshift_variant&splice_acceptor_variant&splice_region_variant&intron_variant"|
    new$Annotation == "initiator_codon_variant")] <- c("non-synonymous")

write.table(file="~/spoa/analysis/formatted.annotations.out", new,
    col.name=TRUE, quote=FALSE, row.name=FALSE, sep= "\t" )

```

### link genes to annotations/GO terms

input: `formatted.annotations.out`
output: `go.out`

The following is python2.7 and the code is very slow. Sorry.

```python

## ~/spoa/analysis/formatted.annotations.out contains spu assignments
# ~/reference/ensembl_goterms.txt were downloaded on 2/18/18

# want to link spu from formatted.annotations.out to spu in ensembl_goterms.txt to get GO terms
# secondly, can pull down gene description from wiki gene

# some of these are no longer necessary...
import pandas as pd
import numpy as np
import gzip
import csv
import itertools
import re
from collections import OrderedDict
import time

# assign GO terms
go_path = '/users/r/b/rbrennan/reference/ensembl_goterms.txt'

#make empty array to save output. This speeds things up compared to appending each iteration.
# appending requires resaving entire array
go_out = np.empty(shape=(54427,5), dtype = object)

i=0 # start counter. not necessary, but useful when trouble shooting

# note that in the go terms, there are multiple rows for each spu if mnultiple GO terms are assigned

with open('/users/r/b/rbrennan/spoa/analysis/formatted.annotations.out') as master_file:
    header_line = next(master_file) # skip header row
    #start_time = time.time()
    for idx, line in enumerate(master_file):
        tmp_snp = line.split("\t")[0] # pull out snp name
        tmp_spu = line.split("\t")[5] # pull out sput
        tmp_go = ""
        tmp_short = ""

        with open(go_path) as go_file:
            for go_line in go_file:
                # check if spu matches each row of go terms
                # but some spu are between two genes. want to use both
                if(len(tmp_spu.split("-")) == 2):
                    spu1 = tmp_spu.split("-")[0]
                    spu2 = tmp_spu.split("-")[1]
                    # match spu1
                    if spu1 == go_line.split("\t")[0]:
                        if len(tmp_go) == 0:  # if this is the first match, fill
                            tmp_go = go_line.split("\t")[6]
                        if len(tmp_short) == 0:
                            tmp_short = go_line.split("\t")[4]
                        if len(tmp_go) > 0: # if this isn't the first match, append.
                            tmp_go = tmp_go + ";" +  go_line.split("\t")[6]
                        if len(tmp_short) > 0:
                            tmp_short = go_line.split("\t")[4] + ";" + tmp_short

                    if spu2 == go_line.split("\t")[0]:
                        if len(tmp_go) == 0:
                            tmp_go = go_line.split("\t")[6]
                        if len(tmp_short) == 0:
                            tmp_short = go_line.split("\t")[4]
                        if len(tmp_go) > 0:
                            tmp_go = tmp_go + ";" +  go_line.split("\t")[6]
                        if len(tmp_short) > 0:
                            tmp_short = tmp_short + ";" +  go_line.split("\t")[4]
                else:
                    if tmp_spu == go_line.split("\t")[0]:
                    # if tmp go is empty, assign all values to it
                        if len(tmp_go) == 0:
                            tmp_go = go_line.split("\t")[6]
                            tmp_short= go_line.split("\t")[4]
                        # is not empty, already have names, etc. just add additional go terms
                        if len(tmp_go) > 0:
                            tmp_go = tmp_go + ";" +  go_line.split("\t")[6]
        # pull out class
        tmp_class = line.split("\t")[17].split("\n")[0]
        tmp_short1 = tmp_short.split(";")
        tmp_short2 = ";".join(list(OrderedDict.fromkeys(tmp_short1)))
        tmp_go1 = tmp_go.split(";")
        tmp_go2 = ";".join(list(OrderedDict.fromkeys(tmp_go1)))
        # if no GO term will be blank
        out_1 = tmp_snp + "\t" + tmp_spu + "\t" + tmp_short2 + "\t" + tmp_class + "\t" + tmp_go2
        go_out[idx]= out_1.split("\t")
        i=i+1
        if i % 5000 == 0: print(i)


# pull out common gene name ~/reference/annotation.build8/gene_info_table.txt
# in column 8 of this table
# spu in column 2

nm_out = np.empty(shape=(54427,2), dtype = object)
i=0 # start counter

for idx, go_line in enumerate(go_out):
    tmp_nm = "NA"
    with open('/users/r/b/rbrennan/reference/annotation.build8/gene_info_table.txt') as nm_file:
        header_line = next(nm_file) # skip header row
        for nm_line in nm_file:
            tmp_spu = nm_line.split("\t")[1]
            if tmp_spu == go_line[1]:
                tmp_nm = nm_line.split("\t")[7]
    out1 = go_line[1] + "\t" + tmp_nm
    nm_out[idx] = out1.split("\t")
    i=i+1
    if i % 2500 == 0: print(i)

# combine and save all
out_1 = np.column_stack((nm_out, go_out))
head =  "SPU_1" + "\t" + "description" + "\t" + "SNP_2"  "\t" + "SPU_2"  + "\t" + "short_name" + "\t" + "class" + "\t" + "GO_term"
head = head.split("\t")
out_final = np.vstack((head, out_1))
np.savetxt('/users/r/b/rbrennan/spoa/analysis/go.out', out_final,fmt='%5s', delimiter='\t')


```

### Run GO enrichment with topGO

In R

input: `go.out` and `cmh.out.txt`
output: files for each gene set that end in `_GO.out`

```r

library(topGO)

dat <- read.csv("~/spoa/analysis/go.out", header=T, sep="\t", , na.strings=c("", "NA"))
dat$SNP <- dat$SNP_2
sig <- read.csv("~/spoa/analysis/cmh.out.2.txt", sep="\t", header=T)

all <- merge(dat, sig, by="SNP")

# some formatting problems.
length(which(all$GO_term == "     "))
all$GO_term <- as.character(all$GO_term)
all$GO_term[which(all$GO_term == "     ")] <- (c("unknown"))
all$GO_term[which(all$GO_term == "unknown")] <- NA

all.rm <- all[!is.na(all$GO_term),]
all <- all.rm
#unique(all$SPU_1)

all$SPU_1 <- gsub("CHR_START-", "", all$SPU_1)
all$SPU_1 <- gsub("-CHR_END-", "", all$SPU_1)

genes <- unique(all$SPU_1)

#toTest <- c("DAY7_D7_7_0_S", "DAY7_D7_7_0_V", "DAY7_D7_7_5_S", "DAY7_D7_7_5_V", "DAY7_D7_8_1_V" )
toTest <- c("DAY7_D7_7_0_S", "DAY7_D7_7_0_V", "DAY7_D7_7_5_S", "DAY7_D7_7_5_V", "DAY7_D7_8_1_V",
            "D7_7_0_S", "D7_7_0_V", "D7_7_5_S", "D7_7_5_V", "D7_8_1_V", "D7_8_1_S" )

for(test_set in toTest){
    out <- as.data.frame(matrix(nrow=length(genes), ncol=2))
    ofInterest <- c()
    out.save <- as.data.frame(matrix(ncol=8, nrow=0))
    colnames(out.save) <- c("GO.ID", "Term","Annotated","Significant","Expected","classicFisher","weight", "ontology")
    for(i in 1:length(genes)){
        a <- all[which(all$SPU_1 == genes[i]),]
        out[i,1] <- as.character(a$SPU_1[1])
        out[i,2] <- a$GO_term[1]
        if(sum(a[,paste(test_set, "_SIG", sep="")]) > 0){
            ofInterest[i] <- TRUE
        } else{ofInterest[i] <- FALSE}
    }

    write.table(file= "~/spoa/analysis/test.go", out, quote=FALSE, col.names=TRUE, row.names=FALSE, sep="\t")

    system('cat ~/spoa/analysis/test.go |  sed \'s/;/,/g\' | sed \'s/,$//g\' > ~/spoa/analysis/test.annotation')

    geneID2GO <- readMappings(file = "~/spoa/analysis/test.annotation")
    # set gene background
    geneUniverse <- names(geneID2GO)

    genesOfInterest <- names(geneID2GO[ofInterest])

    #show genes of interest in universe vector
    geneList <- factor(as.integer(geneUniverse %in% genesOfInterest))
    names(geneList) <- geneUniverse


    for(j in c("BP", "CC", "MF")){

        myGOdata <- new("topGOdata", description="My project", 
            ontology=j, allGenes=geneList,
            annot = annFUN.gene2GO, gene2GO = geneID2GO,
            nodeSize = 5 )
        resultWeight <- runTest(myGOdata, algorithm="weight01", statistic="fisher")
        resultClassic <- runTest(myGOdata, algorithm="classic", statistic="fisher")
        allRes <- GenTable(myGOdata, classicFisher = resultClassic,  weight = resultWeight, orderBy = "weight", ranksOf = "weight"  ,
            topNodes = 100)
        allRes$ontology <- j
        out.save <- rbind(out.save,allRes[which(allRes$weight < 0.05 ),])
    }

    write.table(file=paste("~/spoa/analysis/node5", test_set, "_GO.out", sep=""), 
             out.save, col.names=TRUE,
            row.names=FALSE, quote=FALSE,sep="\t")
}


###########
##
### GO enrichment, coding vs non
##
###########



```





### heirarchical clustering for plots

input: `*GO.out` files
output:

```r

library(GOSemSim)
library(ggplot2)
library(ggdendro)
library(dplyr)
library(org.Dm.eg.db)
#################
## BP
#################

### first, want to generate a table of all our go terms
S70 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_7_0_S_GO.out", header=TRUE, sep="\t")
V70 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_7_0_V_GO.out", header=TRUE, sep="\t")
S75 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_7_5_S_GO.out", header=TRUE, sep="\t")
V75 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_7_5_V_GO.out", header=TRUE, sep="\t")
V81 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_8_1_V_GO.out", header=TRUE, sep="\t")

S70 <- S70[which(S70$ontology == "BP"),]
V70 <- V70[which(V70$ontology == "BP"),]
S75 <- S75[which(S75$ontology == "BP"),]
V75 <- V75[which(V75$ontology == "BP"),]
V81 <- V81[which(V81$ontology == "BP"),]

goids <- unique(rbind(S70[,1:2],V70[,1:2], S75[,1:2],V75[,1:2],V81[,1:2]))

goids <- merge(goids,data.frame(GO.ID = S70$GO.ID,pH_7.0_S_pval= S70$weight), by="GO.ID", all=T)
goids <- merge(goids,data.frame(GO.ID = V70$GO.ID,pH_7.0_V_pval= V70$weight), by="GO.ID", all=T)
goids <- merge(goids,data.frame(GO.ID = S75$GO.ID,pH_7.5_S_pval= S75$weight), by="GO.ID", all=T)
goids <- merge(goids,data.frame(GO.ID = V75$GO.ID,pH_7.5_V_pval= V75$weight), by="GO.ID", all=T)
goids <- merge(goids,data.frame(GO.ID = V81$GO.ID,pH_8.1_V_pval= V81$weight), by="GO.ID", all=T)

write.table(goids,"~/Documents/UVM/spoa/node5_summarytable_BP.txt", col.names=T, row.names=F, quote=F, sep="\t")

df <- read.csv("~/Documents/UVM/spoa/node5_summarytable_BP.txt", header=T, sep="\t")

#BiocManager::install("org.Dm.eg.db")
### IMPORTANT!!!
# trace(godata, edit=TRUE)
## need to edit this from GO to GOALL to work with topgo...
## note that this makes the go mapping data MUCH slower to compute.
## this needs to be done every time youopen a new R session
hsGObp <- godata('org.Dm.eg.db', ont="BP", computeIC=FALSE)
hsGOmf <- godata('org.Dm.eg.db', ont="MF", computeIC=FALSE)
hsGOcc <- godata('org.Dm.eg.db', ont="CC",computeIC=FALSE)

# pull out the go terms from the df
gobp <- as.character(df$GO.ID)

# calculate distance matrix
bpdist <- (mgoSim(gobp, gobp, semData=hsGObp, measure="Wang", combine=NULL))
# using lapply, loop over columns and match values to the look up table. store in "new".
# this gives us the actual names of the GO terms
row.names(bpdist) <- paste(row.names(bpdist),(unlist(lapply(row.names(bpdist), function(x) df$Term[match(x, df$GO.ID)]))), sep=": ")
colnames(bpdist) <- paste(colnames(bpdist),(unlist(lapply(colnames(bpdist), function(x) df$Term[match(x, df$GO.ID)]))), sep=": ")

clusterbp <- hclust(1-as.dist(bpdist), method = "ward.D2")

#convert cluster object to use with ggplot
dendrbp <- dendro_data(clusterbp, type="rectangle") 

#your own labels (now rownames) are supplied in geom_text() and label=label
bpplot <- ggplot() + 
  geom_segment(data=segment(dendrbp), aes(x=x, y=y, xend=xend, yend=yend)) + 
  #geom_text(data=label(dendr), aes(x=x, y=y, label=label, hjust=0), size=4) +
  coord_flip() + scale_y_reverse(expand=c(0.2, 0)) + 
 scale_x_continuous(breaks = label(dendrbp)$x,
                    labels=label(dendrbp)$label,
                     position = "top")+
   theme_minimal() +
  theme(axis.title = element_blank(),
        axis.text.y = element_text(size = rel(1.1), hjust=10),
        panel.grid = element_blank(),
         axis.text.x=element_blank(),
)


#################
## CC
#################

# cc
S70 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_7_0_S_GO.out", header=TRUE, sep="\t")
V70 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_7_0_V_GO.out", header=TRUE, sep="\t")
S75 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_7_5_S_GO.out", header=TRUE, sep="\t")
V75 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_7_5_V_GO.out", header=TRUE, sep="\t")
V81 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_8_1_V_GO.out", header=TRUE, sep="\t")

S70 <- S70[which(S70$ontology == "CC"),]
V70 <- V70[which(V70$ontology == "CC"),]
S75 <- S75[which(S75$ontology == "CC"),]
V75 <- V75[which(V75$ontology == "CC"),]
V81 <- V81[which(V81$ontology == "CC"),]

goids <- unique(rbind(S70[,1:2],V70[,1:2], S75[,1:2],V75[,1:2],V81[,1:2]))

goids <- merge(goids,data.frame(GO.ID = S70$GO.ID,pH_7.0_S_pval= S70$weight), by="GO.ID", all=T)
goids <- merge(goids,data.frame(GO.ID = V70$GO.ID,pH_7.0_V_pval= V70$weight), by="GO.ID", all=T)
goids <- merge(goids,data.frame(GO.ID = S75$GO.ID,pH_7.5_S_pval= S75$weight), by="GO.ID", all=T)
goids <- merge(goids,data.frame(GO.ID = V75$GO.ID,pH_7.5_V_pval= V75$weight), by="GO.ID", all=T)
goids <- merge(goids,data.frame(GO.ID = V81$GO.ID,pH_8.1_V_pval= V81$weight), by="GO.ID", all=T)

write.table(goids,"~/Documents/UVM/spoa/node5_summarytable_CC.txt", col.names=T, row.names=F, quote=F, sep="\t")

df <- read.csv("~/Documents/UVM/spoa/node5_summarytable_CC.txt", header=T, sep="\t")

gocc <- as.character(df$GO.ID)

ccdist <- (mgoSim(gocc, gocc, semData=hsGOcc, measure="Wang", combine=NULL))
# using lapply, loop over columns and match values to the look up table. store in "new".
row.names(ccdist) <- paste(row.names(ccdist),(unlist(lapply(row.names(ccdist), function(x) df$Term[match(x, df$GO.ID)]))), sep=": ")
colnames(ccdist) <- paste(colnames(ccdist),(unlist(lapply(colnames(ccdist), function(x) df$Term[match(x, df$GO.ID)]))), sep=": ")

clustercc <- hclust(1-as.dist(ccdist), method = "ward.D2")

#convert cluster object to use with ggplot
dendrcc <- dendro_data(clustercc, type="rectangle") 

#your own labels (now rownames) are supplied in geom_text() and label=label
ccplot <- ggplot() + 
  geom_segment(data=segment(dendrcc), aes(x=x, y=y, xend=xend, yend=yend)) + 
  #geom_text(data=label(dendr), aes(x=x, y=y, label=label, hjust=0), size=4) +
  coord_flip() + scale_y_reverse(expand=c(0.2, 0)) + 
 scale_x_continuous(breaks = label(dendrcc)$x,
                    labels=label(dendrcc)$label,
                     position = "top")+
   theme_minimal() +
  theme(axis.title = element_blank(),
        axis.text.y = element_text(size = rel(1.1), hjust=10),
        panel.grid = element_blank(),
         axis.text.x=element_blank(),
)

#################
## MF
#################

# mf
S70 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_7_0_S_GO.out", header=TRUE, sep="\t")
V70 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_7_0_V_GO.out", header=TRUE, sep="\t")
S75 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_7_5_S_GO.out", header=TRUE, sep="\t")
V75 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_7_5_V_GO.out", header=TRUE, sep="\t")
V81 <- read.csv("~/Documents/UVM/spoa/GO_results/node5DAY7_D7_8_1_V_GO.out", header=TRUE, sep="\t")

S70 <- S70[which(S70$ontology == "MF"),]
V70 <- V70[which(V70$ontology == "MF"),]
S75 <- S75[which(S75$ontology == "MF"),]
V75 <- V75[which(V75$ontology == "MF"),]
V81 <- V81[which(V81$ontology == "MF"),]

goids <- unique(rbind(S70[,1:2],V70[,1:2], S75[,1:2],V75[,1:2],V81[,1:2]))

goids <- merge(goids,data.frame(GO.ID = S70$GO.ID,pH_7.0_S_pval= S70$weight), by="GO.ID", all=T)
goids <- merge(goids,data.frame(GO.ID = V70$GO.ID,pH_7.0_V_pval= V70$weight), by="GO.ID", all=T)
goids <- merge(goids,data.frame(GO.ID = S75$GO.ID,pH_7.5_S_pval= S75$weight), by="GO.ID", all=T)
goids <- merge(goids,data.frame(GO.ID = V75$GO.ID,pH_7.5_V_pval= V75$weight), by="GO.ID", all=T)
goids <- merge(goids,data.frame(GO.ID = V81$GO.ID,pH_8.1_V_pval= V81$weight), by="GO.ID", all=T)

write.table(goids,"~/Documents/UVM/spoa/node5_summarytable_MF.txt", col.names=T, row.names=F, quote=F, sep="\t")

df <- read.csv("~/Documents/UVM/spoa/node5_summarytable_MF.txt", header=T, sep="\t")

gomf <- as.character(df$GO.ID)

mfdist <- (mgoSim(gomf, gomf, semData=hsGOmf, measure="Wang", combine=NULL))
# using lapply, loop over columns and match values to the look up table. store in "new".
row.names(mfdist) <- paste(row.names(mfdist),(unlist(lapply(row.names(mfdist), function(x) df$Term[match(x, df$GO.ID)]))), sep=": ")
colnames(mfdist) <- paste(colnames(mfdist),(unlist(lapply(colnames(mfdist), function(x) df$Term[match(x, df$GO.ID)]))), sep=": ")

clustermf <- hclust(1-as.dist(mfdist), method = "ward.D2")

#convert cluster object to use with ggplot
dendrmf <- dendro_data(clustermf, type="rectangle") 

#your own labels (now rownames) are supplied in geom_text() and label=label
mfplot <- ggplot() + 
  geom_segment(data=segment(dendrmf), aes(x=x, y=y, xend=xend, yend=yend)) + 
  #geom_text(data=label(dendr), aes(x=x, y=y, label=label, hjust=0), size=4) +
  coord_flip() + scale_y_reverse(expand=c(0.2, 0)) + 
 scale_x_continuous(breaks = label(dendrmf)$x,
 					labels=label(dendrmf)$label,
                     position = "top")+
   theme_minimal() +
  theme(axis.title = element_blank(),
        axis.text.y = element_text(size = rel(1.1), hjust=10),
        panel.grid = element_blank(),
         axis.text.x=element_blank(),
)



ggsave("~/Documents/UVM/spoa/figures/mf.pdf", plot=mfplot, 
		width=5, height=3, units="in")
ggsave("~/Documents/UVM/spoa/figures/cc.pdf", plot=ccplot, 
		width=5, height=3, units="in")
ggsave("~/Documents/UVM/spoa/figures/bp.pdf", plot=bpplot, 
		width=6, height=7, units="in")


# note that final figures were made in inkscape.

```








