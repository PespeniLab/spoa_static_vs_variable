# Fig 2

library(stringr)
library(ggplot2)
library(reshape)
library(data.table)
library(gridExtra)
library(scales)

af <- read.table("~/Documents/UVM/spoa/filtered_allele_freqs_v2.txt", header=TRUE)
dat3 <- read.table("~/Documents/UVM/spoa/filtered_variants_v2.txt", header=TRUE)

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


freqs <- t(af[,2:ncol(af)])
colnames(freqs) <- c(paste(dat3$Chrom, dat3$Position, sep=":"))


# apply PCA - scale. = TRUE is highly
# advisable, but default is FALSE.

pcaResult <- prcomp(freqs, scale=TRUE)
round(pcaResult$sdev^2/sum(pcaResult$sdev^2)*100, digits=2)
summary(pcaResult)


#########################################################################################################


# get proportion of total variance explained:
percentVar <- round(pcaResult$sdev^2/sum(pcaResult$sdev^2)*100, digits=2)

dat.p <- data.frame(pH=substr(pops, 4,6), condition=substr(pops, 8,8),
                    day=substr(pops, 1,2),
                    PC1 = pcaResult$x[,1],  PC2= pcaResult$x[,2],
                    treatment= paste(substr(pops, 4,6),substr(pops, 8,8),sep=""))


head(dat.p)

#########################################################################################################

####
##
## plot pca: Day vs. pH vs. Condition
##
####

#  #be0000 - dark red (7.0S)
#  #ff817b - pink (7.0V)
#  #2222ff - blue (7.5S)
#  lightskyblue - light blue (7.5V)
#  darkgreen - 8.1S
#  darkseagreen1 - 8.1V

#dat.p <- read.csv("pca_dat_updated.csv")
head(dat.p)

dat.p$treatment <- factor(dat.p$treatment, levels=c("8_1S","8_1V","7_5S","7_5V","7_0S","7_0V"))
head(dat.p)

library(vegan)
library(pairwiseAdonis)

trt.in <- paste(substr(pops, 4,6),substr(pops, 8,8),sep="")
day.in <- substr(pops, 1,2)
#trt.in <- paste(substr(pops, 4,6),substr(pops, 8,8),sep="")
all.in <- paste(trt.in, day.in, sep="_")

adonis(freqs~all.in)
pairwise.adonis(dist(freqs),all.in, p.adjust.m="fdr")



#

d <- ggplot(dat.p, aes(PC1, PC2, fill=treatment, shape=day, size=day)) +
  geom_point(color="black", alpha=0.75) +
  xlab(paste0("PC1: ",percentVar[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar[2],"% variance")) +
  theme_bw() +
  #ylim(-30, 23) + xlim(-50, 65)+
  scale_shape_manual(values=c(21,24))+
  #scale_color_manual(values=c('#be0000', '#ff817b', '#2222ff', 'lightskyblue', 'darkgreen', 'darkseagreen1'))+
  scale_fill_manual(values=c('darkgreen', 'darkseagreen1', '#2222ff', 'lightskyblue', '#be0000', '#ff817b'), labels = c('8.1S','8.1V','7.5S','7.5V','7.0S','7.0V'))+
  scale_size_manual(values=c(4,4,4,4,4,4))+
  #theme(legend.position = c(0.88,0.17))+
  theme(legend.text=element_text(size=10),legend.title=element_blank())+
  theme(legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid'))+
  guides(fill=guide_legend(override.aes=list(shape=c(24,24,24,24,24,24), 
                                             size=c(5,5,5,5,5,5), fill=c('darkgreen', 'darkseagreen1', '#2222ff', 'lightskyblue', '#be0000', '#ff817b'))))
  #ggtitle("pH vs. Condition vs. Day")


#png("/Users/aprilgarrett/Desktop/MastersThesis/GenomicAnalyses/figures/Fig02_pca.png", res=300, height=5, width=8, units="in")

#dev.off()


### Plotting VD of Sig. SNPs from CMH

# Making Venn Diagram (4-way) of 7.5 and 7.0 S and V, all against D7 control (8.1S)
library(VennDiagram)

venn.plot <- draw.quad.venn(
  area1 = 24,
  area2 = 34,
  area3 = 602,
  area4 = 253,
  n12 = 4,
  n13 = 6,
  n14 = 6,
  n23 = 6,
  n24 = 1,
  n34 = 106,
  n123 = 1,
  n124 = 1,
  n134 = 4,
  n234 = 1,
  n1234 = 1,
  category = c("7.5 Static", "7.5 Variable", "7.0 Static", "7.0 Variable"),
  fill = c("blue","light blue","red","pink"),
  lty = "dashed",
  cex = 1.5,
  cat.cex = 1.2,
  cat.col = c("blue","light blue","red","pink")
)

library(gridBase)
library(multipanelfigure)

figure <- multi_panel_figure(
    width = c(110.4, 73.6),
    height = c(90),
    rows = 1)
figure

figure %<>% 
    fill_panel(d) %<>%
    fill_panel(venn.plot)

pdf("~/Documents/UVM/spoa/figures/Fig02.pdf",height=3.54, width=8.5)

figure
dev.off()

figure %<>% 
    fill_panel(d) %<>%
    fill_panel(d)

figure <- multi_panel_figure(columns = 1, rows = 2)
par(mfrow = c(1,2), mar=c(0,0,0,0), oma=c(0,0,0,0))
# leave left half empty!
plot.new()
grid.draw(venn.plot)
