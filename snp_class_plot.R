library(ggplot2)
library(ggpubr)

d1 <- read.table("~/Documents/UVM/spoa/formatted.annotations.out", sep="\t", header=T)

d2 <- read.table("~/Documents/UVM/spoa/cmh.out.txt", sep="\t", header=T)

dat <- merge(d1, d2, by="SNP")

#make dataframe
df.out <- as.data.frame(matrix(, nrow=0, ncol=5))
for(idin in c("DAY7_D7_8_1_V","DAY7_D7_7_5_S", "DAY7_D7_7_5_S","DAY7_D7_7_5_V", "DAY7_D7_7_0_S", "DAY7_D7_7_0_V")){

    tmpdf <- data.frame(SNP = dat$SNP, class = dat$class, pval =  dat[,paste(idin, "_selection_pval", sep="")],
        sig = dat[,paste(idin, "_SIG", sep="")], group=idin)
       df.out<-  rbind(df.out,tmpdf)

}

sig.out <- df.out[which(df.out$sig == TRUE),]

p <- ggplot(sig.out, aes(x=group, y=-log10(pval), fill=class))+ geom_boxplot() +
    ggtitle("Significant loci in each group")


# stats

qqnorm(sig.out$pval)
# very non-norm

kruskal.test(-log10(pval) ~ class, data = sig.out)
# p 0.266
# and parse down to each group

for(idin in c("DAY7_D7_8_1_V","DAY7_D7_7_5_S","DAY7_D7_7_5_V", "DAY7_D7_7_0_S", "DAY7_D7_7_0_V")){

    tmpsig <- sig.out[which(sig.out$group == idin),]
    pval <- kruskal.test(-log10(pval) ~ class, data = tmpsig)$p.value
    print(idin)
    print(pval)

}

# marginally sig? 7.5 S. but very few snps in this set

[1] "DAY7_D7_8_1_V"
[1] 0.2127539
[1] "DAY7_D7_7_5_S"
[1] 0.03596471
[1] "DAY7_D7_7_5_V"
[1] 0.3279771
[1] "DAY7_D7_7_0_S"
[1] 0.1846796
[1] "DAY7_D7_7_0_V"
[1] 0.2335073

#make dataframe
df.out <- as.data.frame(matrix(, nrow=0, ncol=5))
for(idin in c("DAY7_D7_8_1_V","DAY7_D7_7_5_S", "DAY7_D7_7_5_S","DAY7_D7_7_5_V", "DAY7_D7_7_0_S", "DAY7_D7_7_0_V")){

    tmpdf <- data.frame(SNP = dat$SNP, class = dat$class, pval =  dat[,paste(idin, "_selection_pval", sep="")],
        sig = dat[,paste(idin, "_SIG", sep="")], group=idin)
    tmpdf2 <- tmpdf[which(tmpdf$pval < quantile(tmpdf$pval, 0.025)),]

       df.out<-  rbind(df.out,tmpdf2)

}

sig.out <- df.out

p1 <- ggplot(sig.out, aes(x=group, y=-log10(pval), fill=class))+ geom_boxplot() +
    ggtitle("2.5% most significant for each group")


for(idin in c("DAY7_D7_8_1_V","DAY7_D7_7_5_S","DAY7_D7_7_5_V", "DAY7_D7_7_0_S", "DAY7_D7_7_0_V")){

    tmpsig <- sig.out[which(sig.out$group == idin),]
    pval <- kruskal.test(-log10(pval) ~ class, data = tmpsig)$p.value
    print(idin)
    print(pval)

}

[1] "DAY7_D7_8_1_V"
[1] 0.2241431
[1] "DAY7_D7_7_5_S"
[1] 0.4401055
[1] "DAY7_D7_7_5_V"
[1] 0.5137767
[1] "DAY7_D7_7_0_S"
[1] 0.4307119
[1] "DAY7_D7_7_0_V"
[1] 0.4335362

#ggarrange(p,p1, labels=c("A", "B"),common.legend = TRUE, h=5, w=15)
ggsave("~/Documents/UVM/spoa/figures/class_sig_pvals.png",plot=ggarrange(p,p1, labels=c("A", "B"),common.legend = TRUE), h=5, w=15)


