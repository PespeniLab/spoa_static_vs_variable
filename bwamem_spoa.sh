#!/bin/bash

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_0_S_08\tSM:SpOA_DNA_D1_7_0_S_08\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_0_S_08_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_0_S_08_R2_clean_paired.fq > SpOA_DNA_D1_7_0_S_08_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_8_1_S_05\tSM:SpOA_DNA_D1_8_1_S_05\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_8_1_S_05_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_8_1_S_05_R2_clean_paired.fq > SpOA_DNA_D1_8_1_S_05_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_0_S_02\tSM:SpOA_DNA_D1_7_0_S_02\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_0_S_02_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_0_S_02_R2_clean_paired.fq > SpOA_DNA_D1_7_0_S_02_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_5_S_04\tSM:SpOA_DNA_D1_7_5_S_04\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_5_S_04_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_5_S_04_R2_clean_paired.fq > SpOA_DNA_D1_7_5_S_04_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_V_09\tSM:SpOA_DNA_D7_7_5_V_09\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_V_09_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_V_09_R2_clean_paired.fq > SpOA_DNA_D7_7_5_V_09_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_S_26\tSM:SpOA_DNA_D7_7_0_S_26\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_S_26_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_S_26_R2_clean_paired.fq > SpOA_DNA_D7_7_0_S_26_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_V_03\tSM:SpOA_DNA_D7_7_0_V_03\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_V_03_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_V_03_R2_clean_paired.fq > SpOA_DNA_D7_7_0_V_03_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_S_30\tSM:SpOA_DNA_D7_7_0_S_30\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_S_30_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_S_30_R2_clean_paired.fq > SpOA_DNA_D7_7_0_S_30_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_8_1_S_03\tSM:SpOA_DNA_D1_8_1_S_03\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_8_1_S_03_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_8_1_S_03_R2_clean_paired.fq > SpOA_DNA_D1_8_1_S_03_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_5_S_05\tSM:SpOA_DNA_D1_7_5_S_05\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_5_S_05_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_5_S_05_R2_clean_paired.fq > SpOA_DNA_D1_7_5_S_05_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_8_1_S_08\tSM:SpOA_DNA_D1_8_1_S_08\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_8_1_S_08_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_8_1_S_08_R2_clean_paired.fq > SpOA_DNA_D1_8_1_S_08_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_S_28\tSM:SpOA_DNA_D7_7_0_S_28\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_S_28_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_S_28_R2_clean_paired.fq > SpOA_DNA_D7_7_0_S_28_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_S_15\tSM:SpOA_DNA_D7_8_1_S_15\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_S_15_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_S_15_R2_clean_paired.fq > SpOA_DNA_D7_8_1_S_15_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_V_07\tSM:SpOA_DNA_D7_7_5_V_07\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_V_07_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_V_07_R2_clean_paired.fq > SpOA_DNA_D7_7_5_V_07_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_8_1_S_01\tSM:SpOA_DNA_D1_8_1_S_01\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_8_1_S_01_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_8_1_S_01_R2_clean_paired.fq > SpOA_DNA_D1_8_1_S_01_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_V_08\tSM:SpOA_DNA_D7_7_5_V_08\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_V_08_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_V_08_R2_clean_paired.fq > SpOA_DNA_D7_7_5_V_08_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_V_02\tSM:SpOA_DNA_D7_7_0_V_02\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_V_02_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_V_02_R2_clean_paired.fq > SpOA_DNA_D7_7_0_V_02_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_5_S_03\tSM:SpOA_DNA_D1_7_5_S_03\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_5_S_03_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_5_S_03_R2_clean_paired.fq > SpOA_DNA_D1_7_5_S_03_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_S_27\tSM:SpOA_DNA_D7_7_0_S_27\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_S_27_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_S_27_R2_clean_paired.fq > SpOA_DNA_D7_7_0_S_27_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_S_36\tSM:SpOA_DNA_D7_7_5_S_36\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_S_36_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_S_36_R2_clean_paired.fq > SpOA_DNA_D7_7_5_S_36_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_S_13\tSM:SpOA_DNA_D7_8_1_S_13\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_S_13_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_S_13_R2_clean_paired.fq > SpOA_DNA_D7_8_1_S_13_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_V_04\tSM:SpOA_DNA_D7_7_0_V_04\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_V_04_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_V_04_R2_clean_paired.fq > SpOA_DNA_D7_7_0_V_04_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_S_33\tSM:SpOA_DNA_D7_7_5_S_33\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_S_33_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_S_33_R2_clean_paired.fq > SpOA_DNA_D7_7_5_S_33_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_V_19\tSM:SpOA_DNA_D7_8_1_V_19\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_V_19_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_V_19_R2_clean_paired.fq > SpOA_DNA_D7_8_1_V_19_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_0_S_04\tSM:SpOA_DNA_D1_7_0_S_04\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_0_S_04_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_0_S_04_R2_clean_paired.fq > SpOA_DNA_D1_7_0_S_04_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_V_23\tSM:SpOA_DNA_D7_8_1_V_23\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_V_23_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_V_23_R2_clean_paired.fq > SpOA_DNA_D7_8_1_V_23_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_S_29\tSM:SpOA_DNA_D7_7_0_S_29\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_S_29_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_S_29_R2_clean_paired.fq > SpOA_DNA_D7_7_0_S_29_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_V_12\tSM:SpOA_DNA_D7_7_5_V_12\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_V_12_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_V_12_R2_clean_paired.fq > SpOA_DNA_D7_7_5_V_12_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_5_S_08\tSM:SpOA_DNA_D1_7_5_S_08\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_5_S_08_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_5_S_08_clean_paired.fq > SpOA_DNA_D1_7_5_S_08_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_V_24\tSM:SpOA_DNA_D7_8_1_V_24\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_V_24_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_V_24_R2_clean_paired.fq > SpOA_DNA_D7_8_1_V_24_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_V_10\tSM:SpOA_DNA_D7_7_5_V_10\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_V_10_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_V_10_R2_clean_paired.fq > SpOA_DNA_D7_7_5_V_10_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_S_31\tSM:SpOA_DNA_D7_7_5_S_31\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_S_31_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_S_31_clean_paired.fq > SpOA_DNA_D7_7_5_S_31_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_V_21\tSM:SpOA_DNA_D7_8_1_V_21\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_V_21_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_V_21_R2_clean_paired.fq > SpOA_DNA_D7_8_1_V_21_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_S_25\tSM:SpOA_DNA_D7_7_0_S_25\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_S_25_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_S_25_R2_clean_paired.fq > SpOA_DNA_D7_7_0_S_25_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_S_18\tSM:SpOA_DNA_D7_8_1_S_18\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_S_18_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_S_18_R2_clean_paired.fq > SpOA_DNA_D7_8_1_S_18_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_0_S_05\tSM:SpOA_DNA_D1_7_0_S_05\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_0_S_05_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_0_S_05_R2_clean_paired.fq > SpOA_DNA_D1_7_0_S_05_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_0_S_03\tSM:SpOA_DNA_D1_7_0_S_03\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_0_S_03_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_0_S_03_R2_clean_paired.fq > SpOA_DNA_D1_7_0_S_03_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_V_20\tSM:SpOA_DNA_D7_8_1_V_20\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_V_20_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_V_20_R2_clean_paired.fq > SpOA_DNA_D7_8_1_V_20_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_V_05\tSM:SpOA_DNA_D7_7_0_V_05\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_V_05_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_V_05_R2_clean_paired.fq > SpOA_DNA_D7_7_0_V_05_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_S_32\tSM:SpOA_DNA_D7_7_5_S_32\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_S_32_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_5_S_32_clean_paired.fq > SpOA_DNA_D7_7_5_S_32_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_S_14\tSM:SpOA_DNA_D7_8_1_S_14\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_S_14_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_S_14_R2_clean_paired.fq > SpOA_DNA_D7_8_1_S_14_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_V_22\tSM:SpOA_DNA_D7_8_1_V_22\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_V_22_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_8_1_V_22_R2_clean_paired.fq > SpOA_DNA_D7_8_1_V_22_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_V_06\tSM:SpOA_DNA_D7_7_0_V_06\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_V_06_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D7_7_0_V_06_clean_paired.fq > SpOA_DNA_D7_7_0_V_06_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_5_S_01\tSM:SpOA_DNA_D1_7_5_S_01\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_5_S_01_R1_clean_paired.fq ~/RESEARCH/SpOA/data/clippedtrimmed/SpOA_DNA_D1_7_5_S_01_R2_clean_paired.fq > SpOA_DNA_D1_7_5_S_01_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_0_S_08\tSM:SpOA_DNA_D1_7_0_S_08\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_0_S_08_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_0_S_08_R2_clean_paired.fq > SpOA_DNA_D1_7_0_S_08_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_8_1_S_05\tSM:SpOA_DNA_D1_8_1_S_05\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_8_1_S_05_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_8_1_S_05_R2_clean_paired.fq > SpOA_DNA_D1_8_1_S_05_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_0_S_02\tSM:SpOA_DNA_D1_7_0_S_02\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_0_S_02_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_0_S_02_R2_clean_paired.fq > SpOA_DNA_D1_7_0_S_02_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_5_S_04\tSM:SpOA_DNA_D1_7_5_S_04\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_5_S_04_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_5_S_04_R2_clean_paired.fq > SpOA_DNA_D1_7_5_S_04_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_V_09\tSM:SpOA_DNA_D7_7_5_V_09\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_V_09_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_V_09_R2_clean_paired.fq > SpOA_DNA_D7_7_5_V_09_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_S_26\tSM:SpOA_DNA_D7_7_0_S_26\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_S_26_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_S_26_R2_clean_paired.fq > SpOA_DNA_D7_7_0_S_26_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_V_03\tSM:SpOA_DNA_D7_7_0_V_03\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_V_03_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_V_03_R2_clean_paired.fq > SpOA_DNA_D7_7_0_V_03_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_S_30\tSM:SpOA_DNA_D7_7_0_S_30\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_S_30_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_S_30_R2_clean_paired.fq > SpOA_DNA_D7_7_0_S_30_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_8_1_S_03\tSM:SpOA_DNA_D1_8_1_S_03\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_8_1_S_03_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_8_1_S_03_R2_clean_paired.fq > SpOA_DNA_D1_8_1_S_03_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_5_S_05\tSM:SpOA_DNA_D1_7_5_S_05\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_5_S_05_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_5_S_05_R2_clean_paired.fq > SpOA_DNA_D1_7_5_S_05_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_8_1_S_08\tSM:SpOA_DNA_D1_8_1_S_08\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_8_1_S_08_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_8_1_S_08_R2_clean_paired.fq > SpOA_DNA_D1_8_1_S_08_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_S_28\tSM:SpOA_DNA_D7_7_0_S_28\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_S_28_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_S_28_R2_clean_paired.fq > SpOA_DNA_D7_7_0_S_28_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_S_15\tSM:SpOA_DNA_D7_8_1_S_15\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_S_15_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_S_15_R2_clean_paired.fq > SpOA_DNA_D7_8_1_S_15_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_V_07\tSM:SpOA_DNA_D7_7_5_V_07\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_V_07_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_V_07_R2_clean_paired.fq > SpOA_DNA_D7_7_5_V_07_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_8_1_S_01\tSM:SpOA_DNA_D1_8_1_S_01\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_8_1_S_01_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_8_1_S_01_R2_clean_paired.fq > SpOA_DNA_D1_8_1_S_01_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_V_08\tSM:SpOA_DNA_D7_7_5_V_08\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_V_08_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_V_08_R2_clean_paired.fq > SpOA_DNA_D7_7_5_V_08_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_V_02\tSM:SpOA_DNA_D7_7_0_V_02\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_V_02_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_V_02_R2_clean_paired.fq > SpOA_DNA_D7_7_0_V_02_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_5_S_03\tSM:SpOA_DNA_D1_7_5_S_03\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_5_S_03_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_5_S_03_R2_clean_paired.fq > SpOA_DNA_D1_7_5_S_03_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_S_27\tSM:SpOA_DNA_D7_7_0_S_27\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_S_27_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_S_27_R2_clean_paired.fq > SpOA_DNA_D7_7_0_S_27_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_S_36\tSM:SpOA_DNA_D7_7_5_S_36\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_S_36_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_S_36_R2_clean_paired.fq > SpOA_DNA_D7_7_5_S_36_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_S_13\tSM:SpOA_DNA_D7_8_1_S_13\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_S_13_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_S_13_R2_clean_paired.fq > SpOA_DNA_D7_8_1_S_13_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_V_04\tSM:SpOA_DNA_D7_7_0_V_04\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_V_04_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_V_04_R2_clean_paired.fq > SpOA_DNA_D7_7_0_V_04_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_S_33\tSM:SpOA_DNA_D7_7_5_S_33\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_S_33_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_S_33_R2_clean_paired.fq > SpOA_DNA_D7_7_5_S_33_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_V_19\tSM:SpOA_DNA_D7_8_1_V_19\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_V_19_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_V_19_R2_clean_paired.fq > SpOA_DNA_D7_8_1_V_19_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_0_S_04\tSM:SpOA_DNA_D1_7_0_S_04\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_0_S_04_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_0_S_04_R2_clean_paired.fq > SpOA_DNA_D1_7_0_S_04_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_V_23\tSM:SpOA_DNA_D7_8_1_V_23\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_V_23_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_V_23_R2_clean_paired.fq > SpOA_DNA_D7_8_1_V_23_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_S_29\tSM:SpOA_DNA_D7_7_0_S_29\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_S_29_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_S_29_R2_clean_paired.fq > SpOA_DNA_D7_7_0_S_29_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_V_12\tSM:SpOA_DNA_D7_7_5_V_12\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_V_12_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_V_12_R2_clean_paired.fq > SpOA_DNA_D7_7_5_V_12_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_5_S_08\tSM:SpOA_DNA_D1_7_5_S_08\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_5_S_08_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_5_S_08_clean_paired.fq > SpOA_DNA_D1_7_5_S_08_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_V_24\tSM:SpOA_DNA_D7_8_1_V_24\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_V_24_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_V_24_R2_clean_paired.fq > SpOA_DNA_D7_8_1_V_24_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_V_10\tSM:SpOA_DNA_D7_7_5_V_10\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_V_10_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_V_10_R2_clean_paired.fq > SpOA_DNA_D7_7_5_V_10_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_S_31\tSM:SpOA_DNA_D7_7_5_S_31\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_S_31_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_S_31_clean_paired.fq > SpOA_DNA_D7_7_5_S_31_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_V_21\tSM:SpOA_DNA_D7_8_1_V_21\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_V_21_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_V_21_R2_clean_paired.fq > SpOA_DNA_D7_8_1_V_21_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_S_25\tSM:SpOA_DNA_D7_7_0_S_25\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_S_25_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_S_25_R2_clean_paired.fq > SpOA_DNA_D7_7_0_S_25_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_S_18\tSM:SpOA_DNA_D7_8_1_S_18\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_S_18_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_S_18_R2_clean_paired.fq > SpOA_DNA_D7_8_1_S_18_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_0_S_05\tSM:SpOA_DNA_D1_7_0_S_05\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_0_S_05_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_0_S_05_R2_clean_paired.fq > SpOA_DNA_D1_7_0_S_05_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_0_S_03\tSM:SpOA_DNA_D1_7_0_S_03\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_0_S_03_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_0_S_03_R2_clean_paired.fq > SpOA_DNA_D1_7_0_S_03_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_V_20\tSM:SpOA_DNA_D7_8_1_V_20\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_V_20_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_V_20_R2_clean_paired.fq > SpOA_DNA_D7_8_1_V_20_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_V_05\tSM:SpOA_DNA_D7_7_0_V_05\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_V_05_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_V_05_R2_clean_paired.fq > SpOA_DNA_D7_7_0_V_05_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_5_S_32\tSM:SpOA_DNA_D7_7_5_S_32\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_S_32_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_5_S_32_clean_paired.fq > SpOA_DNA_D7_7_5_S_32_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_S_14\tSM:SpOA_DNA_D7_8_1_S_14\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_S_14_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_S_14_R2_clean_paired.fq > SpOA_DNA_D7_8_1_S_14_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_8_1_V_22\tSM:SpOA_DNA_D7_8_1_V_22\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_V_22_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_8_1_V_22_R2_clean_paired.fq > SpOA_DNA_D7_8_1_V_22_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D7_7_0_V_06\tSM:SpOA_DNA_D7_7_0_V_06\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_V_06_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D7_7_0_V_06_clean_paired.fq > SpOA_DNA_D7_7_0_V_06_bwamem.sam

/data/programs/bwa/bwa mem -t 4 -k 5 -R '@RG\tID:SpOA_DNA_D1_7_5_S_01\tSM:SpOA_DNA_D1_7_5_S_01\tPL:Illumina' ~/RESEARCH/OASV2/data/bwa_mapped/ref/ref ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_5_S_01_R1_clean_paired.fq ~/RESEARCH/SpOA/NewData/clippedtrimmed/SpOA_DNA_D1_7_5_S_01_R2_clean_paired.fq > SpOA_DNA_D1_7_5_S_01_bwamem.sam
