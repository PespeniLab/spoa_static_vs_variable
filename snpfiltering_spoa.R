library(stringr)

dat <- read.table("~/RESEARCH/SpOA/combined_data/analysis/snp_all_out", stringsAsFactors=FALSE, skip=1)

datnm <- read.table("~/RESEARCH/SpOA/combined_data/analysis/snp_all_out", stringsAsFactors=FALSE, nrows=1)

pops <- c(
                "D1_7_0_S_02", "D1_7_0_S_03", "D1_7_0_S_04", "D1_7_0_S_05",
                "D1_7_0_S_08", "D1_7_5_S_01", "D1_7_5_S_03", "D1_7_5_S_04",
                "D1_7_5_S_05", "D1_7_5_S_08", "D1_8_1_S_01", "D1_8_1_S_03",
                "D1_8_1_S_05", "D1_8_1_S_08", "D7_7_0_S_25", "D7_7_0_S_26",
                "D7_7_0_S_27", "D7_7_0_S_28", "D7_7_0_S_29", "D7_7_0_S_30",
                "D7_7_0_V_02", "D7_7_0_V_03", "D7_7_0_V_04", "D7_7_0_V_05",
                "D7_7_0_V_06", "D7_7_5_S_31", "D7_7_5_S_32", "D7_7_5_S_33",
                "D7_7_5_S_36", "D7_7_5_V_07", "D7_7_5_V_08", "D7_7_5_V_09",
                "D7_7_5_V_10", "D7_7_5_V_12", "D7_8_1_S_13", "D7_8_1_S_14",
                "D7_8_1_S_15", "D7_8_1_S_18", "D7_8_1_V_19", "D7_8_1_V_20",
                "D7_8_1_V_21", "D7_8_1_V_22", "D7_8_1_V_23", "D7_8_1_V_24")

colnames(dat) <- c(datnm[1,1:10], pops)

### (1) Filter out all where the number of samples not covered/called is 0
dat1 <- dat[which(dat$SamplesNC == 0),]
nrow(dat1)


### (2) Filter to include only variable sites
dat1 <- dat1[which(dat1$SamplesRef < 41 & dat1$SamplesHom < 41 ),]
nrow(dat1)
dat2 <- dat1


### (3) Filter by coverage
filt <- (median(as.numeric((str_split_fixed(dat2[,5] , ":", n=6))[,2])))*3
dat3 <- dat2[(which(as.numeric((str_split_fixed(dat2[,5] , ":", n=6))[,2]) < filt)),]
nrow(dat3)

keep <- as.data.frame(matrix(nrow=nrow(dat3), ncol=length(pops)))
colnames(keep) <- pops
    # cycle through each population
    for(i_pop in pops){

        tmp_pop <- dat3[,grep(i_pop, colnames(dat3))]
        maj <- as.numeric(str_split_fixed(tmp_pop, ":", n=6)[,3])
        minor <- as.numeric(str_split_fixed(tmp_pop, ":", n=6)[,4])
        # sum up reads
        keep[,grep(i_pop, colnames(keep))] <- (maj+ minor)

    }

low_cv <- (apply(keep, 1, function(x) {ifelse((length(which(x < 30)) > 0), FALSE, TRUE)}))
sum(low_cv)
dat4 <- dat3[low_cv,]
dat3 <- dat4


### (4) Calculate allele freqs
# columns for each call are: consensus genotype, total depth, num of read 1, num of read 2, allele freq, pvalue of snp.
af <- as.data.frame(matrix(nrow=nrow(dat3), ncol=length(pops)))
colnames(af) <- pops
    # cycle through each population
    for(i_pop in pops){

        tmp_pop <- dat3[,grep(i_pop, colnames(dat3))]
        maj <- as.numeric(str_split_fixed(tmp_pop, ":", n=6)[,3])
        minor <- as.numeric(str_split_fixed(tmp_pop, ":", n=6)[,4])

        # calculate af
        af[,grep(i_pop, colnames(af))] <- maj/(maj+ minor)

    }

afct.maf <- (sapply(af,function(x)
          ifelse(x > 0.5, (1-x), x)))

low_maf <- (apply(afct.maf, 1, function(x) {ifelse((length(which(x > 0.025)) < 4), FALSE, TRUE)}))
sum(low_maf)

dat4 <- dat3[low_maf,]
nrow(dat4)

af_f <- af[low_maf,]

af.out <- (cbind(paste(dat4$Chrom, dat4$Position, sep=":"),af_f))

colnames(af.out) <- c("SNP", colnames(af_f))



### (5) save filtered genotypes
write.table(file="~/RESEARCH/SpOA/combined_data/analysis/filtered_variants_v2.txt", dat4, sep="\t",
              row.names=FALSE, quote=FALSE)

write.table(file="~/RESEARCH/SpOA/combined_data/analysis/filtered_allele_freqs_v2.txt", af.out, sep="\t",
              row.names=FALSE, quote=FALSE)
