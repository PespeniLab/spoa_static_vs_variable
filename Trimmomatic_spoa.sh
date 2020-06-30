#!/bin/bash

for f1 in *_R1.fastq.gz

do

f2=${f1%%_R1.fastq.gz}"_R2.fastq.gz"



java -jar /data/programs/Trimmomatic-0.36/trimmomatic-0.36.jar PE \
        -threads 10 \
        -phred33 \
         "$f1" \
         "$f2" \
         /users/a/m/amakukho/RESEARCH/SpOA/data/clippedtrimmed/"$f1"_R1_clean_paired.fq \
         /users/a/m/amakukho/RESEARCH/SpOA/data/clippedtrimmed/"$f1"_R1_clean_unpaired.fq \
         /users/a/m/amakukho/RESEARCH/SpOA/data/clippedtrimmed/"$f2"_R2_clean_paired.fq \
         /users/a/m/amakukho/RESEARCH/SpOA/data/clippedtrimmed/"$f2"_R2_clean_unpaired.fq \
        ILLUMINACLIP:/data/programs/Trimmomatic-0.36/adapters/TruSeq2-PE.fa:2:30:10 \
        SLIDINGWINDOW:20:2 \
        LEADING:2 \
        TRAILING:2 \
        MINLEN:35

done
