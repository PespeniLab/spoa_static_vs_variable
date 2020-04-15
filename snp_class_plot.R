library(ggplot2)
library(ggpubr)
library(dplyr)
library(arm)

d1 <- read.table("~/Documents/UVM/spoa/formatted.annotations.out", sep="\t", header=T)

d2 <- read.table("~/Documents/UVM/spoa/cmh.out.2.txt", sep="\t", header=T)

dat <- merge(d1, d2, by="SNP")

#make dataframe
df.out <- as.data.frame(matrix(, nrow=0, ncol=5))
for(idin in c("DAY7_D7_8_1_V","DAY7_D7_7_5_S","DAY7_D7_7_5_V", "DAY7_D7_7_0_S", "DAY7_D7_7_0_V")){

    tmpdf <- data.frame(SNP = dat$SNP, class = dat$class, pval =  dat[,paste(idin, "_selection_pval", sep="")],
        sig = dat[,paste(idin, "_SIG", sep="")], group=idin)
       df.out<-  rbind(df.out,tmpdf)

}

df.out$class <- as.character(df.out$class)
df.out$class[which(df.out$class == "non-synonymous")] <- c("exon")
df.out$class[which(df.out$class == "synonymous")] <- c("exon")

tb.out <- table(df.out$class, df.out$sig, df.out$group)
dim(tb.out)


# add tb.all to prop.out2

tb.all <- table(df.out$class, df.out$sig)
tb.out <- array.append(tb.all,tb.out)

rownames(tb.out) <- c("exon", "intergenic" ,"intron"   ,  "upstream")
colnames(tb.out) <- c("FALSE", "TRUE")

#make table of prop sig:
namesin <- c("all_groups_combined","DAY7_D7_8_1_V","DAY7_D7_7_5_S","DAY7_D7_7_5_V", "DAY7_D7_7_0_S", "DAY7_D7_7_0_V")
prop.out <- data.frame(matrix(nrow=48, ncol=8))
colnames(prop.out) <- c("group","Value", "snp_class", "n_TRUE", "n_FALSE", "prop", "p_val", "Expected")

prop.out$group <- as.vector(sapply(namesin, function (x) rep(x,8)))
o_e <- rep(c(rep("observed", 4),rep("expected", 4)),6)
prop.out$Value <- o_e


for(n.in in 1:6){
    inloc <- which(prop.out$group == namesin[n.in])
    Xsq <- (chisq.test(tb.out[,,n.in]))
    obs <- inloc[1:4]
    expt <- inloc[5:8]
    # observed first
    prop.out$n_TRUE[obs] <- as.character(Xsq$observed[,2])
    prop.out$n_FALSE[obs] <- Xsq$observed[,1]
    prop.out$prop[obs] <- Xsq$observed[,2]/(Xsq$observed[,2]+Xsq$observed[,1])
    prop.out$p_val[obs] <- Xsq$p.value
    prop.out$snp_class[obs] <- names(tb.out[,2,n.in])
    #expected
    prop.out$n_TRUE[expt] <- as.character(Xsq$expected[,2])
    prop.out$n_FALSE[expt] <- Xsq$expected[,1]
    prop.out$prop[expt] <- Xsq$expected[,2]/(Xsq$expected[,2]+Xsq$expected[,1])
    prop.out$p_val[expt] <- Xsq$p.value
    prop.out$snp_class[expt] <- names(tb.out[,2,n.in])

    #prop expected
    prop.out$Expected[inloc] <- prop.out$prop[expt[1]]

}

prop.out$total <- as.numeric(prop.out$n_TRUE) + as.numeric(prop.out$n_FALSE)
prop.out$n_TRUE <- as.integer(prop.out$n_TRUE)
# now get CIs

prop.out2 <-mutate(prop.out,      
       low.ci = apply(prop.out[c("n_TRUE", "total", "Expected")],
                       1,
                       function(x)
                       binom.test(x["n_TRUE"], x["total"], x["Expected"]
                                 )$ conf.int[1]),
                                
        upper.ci = apply(prop.out[c("n_TRUE", "total", "Expected")],
                       1,
                       function(x)
                       binom.test(x["n_TRUE"], x["total"], x["Expected"]
                                 )$ conf.int[2])
         )


prop.out2$low.counts<- prop.out2$low.ci*prop.out2$total
prop.out2$high.counts<- prop.out2$upper.ci*prop.out2$total

prop.out2$low.counts [prop.out2$Value == "expected"] <- 0
prop.out2$high.counts [prop.out2$Value == "expected"] <- 0
prop.out2$group[which(prop.out2$group == "DAY7_D7_8_1_V")] <- c("pH 8.1 V")
prop.out2$group[which(prop.out2$group == "DAY7_D7_7_5_S")] <- c("pH 7.5 S")
prop.out2$group[which(prop.out2$group == "DAY7_D7_7_5_V")] <- c("pH 7.5 V")
prop.out2$group[which(prop.out2$group == "DAY7_D7_7_0_S")] <- c("pH 7.0 S")
prop.out2$group[which(prop.out2$group == "DAY7_D7_7_0_V")] <- c("pH 7.0 V")
prop.out2$group[which(prop.out2$group == "all_groups_combined")] <- c("All groups combined")

prop.out2$snp_class <- factor(prop.out2$snp_class, c("upstream", "exon","intron" ,"intergenic"))



p.out <- ggplot(prop.out2,
   aes(x = snp_class, y = as.numeric(n_TRUE), fill = Value))  +
       geom_bar(aes(y=n_TRUE),stat="identity", width = 0.4, position = "dodge", color="black")  +
       #geom_errorbar(position=position_dodge(width=0.9), color="black")    +   ## ggtitle("Main title") +
       theme_bw() + facet_wrap(vars(group), scales = "free") +
          geom_errorbar(position=position_dodge(width=0.4),
                     width=0.0, size=0.5, color="black",
                     aes(ymax=low.counts, ymin=high.counts))+
          theme(axis.text.x = element_text(angle = 45, hjust = 1))+
          xlab("") + ylab("number of significant loci") +
          scale_fill_manual(values = c("darkgrey", "lightgoldenrod2"))+
            theme(legend.title=element_blank())



ggsave(p.out, file="~/Documents/UVM/spoa/figures/FigS1_class_sig_pvals.pdf", h=5, w=9)

# print out xsq pvals, skip combined
for(n.in in 1:6){
    Xsq <- (chisq.test(tb.out[,,n.in]))
    print(Xsq$p.value)     # standardized residuals

}


# groups are: "all", "DAY7_D7_8_1_V","DAY7_D7_7_5_S","DAY7_D7_7_5_V", "DAY7_D7_7_0_S", "DAY7_D7_7_0_V"
#
#[1] 6.1e-22
#[1] 0.26
#[1] 0.082
#[1] 0.033
#[1] 3e-14
#[1] 2.1e-05

# mult testing correct, skipping the combined cat.
p.adjust(c(0.26, 0.082, 0.033, 3e-14, 2.1e-05), method="fdr")


