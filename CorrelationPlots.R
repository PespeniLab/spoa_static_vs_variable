#Edited by RSB 2020-04-10

library(scales)


af <- read.table("~/Documents/UVM/spoa/cmh.out.polarizedadaptive.txt", header = TRUE)
head(af)

cmh2 <- read.table("~/Documents/UVM/spoa/cmh.out.txt", header = TRUE)
head(cmh2)

af <- cbind(cmh2,af)

############################# D7-7.5S vs D7-7.0S #############################

cut_off <- 0.05/(4548)

A_selected_7_5 <- af[which(af$DAY7_D7_7_5_S_selection_pval < cut_off & af$DAY7_D7_7_0_S_selection_pval >= cut_off),]
A_selected_7_0 <- af[which(af$DAY7_D7_7_0_S_selection_pval < cut_off & af$DAY7_D7_7_5_S_selection_pval >= cut_off),]
A_selected_both <- af[which(af$DAY7_D7_7_0_S_selection_pval < cut_off & af$DAY7_D7_7_5_S_selection_pval < cut_off),]
A_neutral <- af[which(af$DAY7_D7_7_0_S_selection_pval > cut_off & af$DAY7_D7_7_5_S_selection_pval > cut_off),]

# pull out allele freqs
A_selected_7_5__D7_7_0S <- A_selected_7_5$D7_7_0_S
A_selected_7_5__D7_7_5S <- A_selected_7_5$D7_7_5_S
A_selected_7_5__D7_8_1S <- A_selected_7_5$D7_8_1_S # previoulsy, this pulled out D7_Control, which doesn't exist

A_selected_7_0__D7_7_0S <- A_selected_7_0$D7_7_0_S
A_selected_7_0__D7_7_5S <- A_selected_7_0$D7_7_5_S
A_selected_7_0__D7_8_1S <- A_selected_7_0$D7_8_1_S

A_selected_both__D7_7_0S <- A_selected_both$D7_7_0_S
A_selected_both__D7_7_5S <- A_selected_both$D7_7_5_S
A_selected_both__D7_8_1S <- A_selected_both$D7_8_1_S

A_selected_all <- unique(rbind(A_selected_7_5,A_selected_7_0,A_selected_both))
A_selected_all_D7_7_5S <- A_selected_all$D7_7_5_S
A_selected_all_D7_7_0S <- A_selected_all$D7_7_0_S
A_selected_all_D7_8_1S <- A_selected_all$D7_8_1_S


A_d7_7_5S <- (A_selected_all_D7_7_5S - A_selected_all_D7_8_1S)
A_d7_7_0S <- (A_selected_all_D7_7_0S - A_selected_all_D7_8_1S)

A_d7_7_5S_both <- (A_selected_both__D7_7_5S - A_selected_both__D7_8_1S)
A_d7_7_0S_both <- (A_selected_both__D7_7_0S - A_selected_both__D7_8_1S)

A_d7_7_5S_sig7_5S <- (A_selected_7_5__D7_7_5S - A_selected_7_5__D7_8_1S)
A_d7_7_0S_sig7_5S <- (A_selected_7_5__D7_7_0S - A_selected_7_5__D7_8_1S)

A_d7_7_5S_sig7_0S <- (A_selected_7_0__D7_7_5S - A_selected_7_0__D7_8_1S)
A_d7_7_0S_sig7_0S <- (A_selected_7_0__D7_7_0S - A_selected_7_0__D7_8_1S)

cor.test(A_d7_7_5S, A_d7_7_0S,
         method = "pearson",
         conf.level = 0.95)

cor.test(A_d7_7_5S_sig7_5S, A_d7_7_0S_sig7_5S,
         method = "pearson",
         conf.level = 0.95)

cor.test(A_d7_7_5S_sig7_0S , A_d7_7_0S_sig7_0S,
         method = "pearson",
         conf.level = 0.95)

cor.test(A_d7_7_5S_both, A_d7_7_0S_both,
         method = "pearson",
         conf.level = 0.95)

# corr genome wide:
A_d7_7_5S_all <- (A_neutral$D7_7_5_S - A_neutral$D7_8_1_S)
A_d7_7_0S_all <- (A_neutral$D7_7_0_S - A_neutral$D7_8_1_S)

cor.test(A_d7_7_5S_all, A_d7_7_0S_all)



############################# D7-7.5S vs D7-7.5V #############################

B_selected_7_5S <- af[which(af$DAY7_D7_7_5_S_selection_pval < cut_off & af$DAY7_D7_7_5_V_selection_pval >= cut_off),]
B_selected_7_5V <- af[which(af$DAY7_D7_7_5_V_selection_pval < cut_off & af$DAY7_D7_7_5_S_selection_pval >= cut_off),]
B_selected_both <- af[which(af$DAY7_D7_7_5_V_selection_pval < cut_off & af$DAY7_D7_7_5_S_selection_pval < cut_off),]
B_neutral <- af[which(af$DAY7_D7_7_5_V_selection_pval > cut_off & af$DAY7_D7_7_5_S_selection_pval > cut_off),]

# pull out allele freqs
B_selected_7_5S__D7_7_5V <- B_selected_7_5S$D7_7_5_V
B_selected_7_5S__D7_7_5S <- B_selected_7_5S$D7_7_5_S
B_selected_7_5S__D7_8_1S <- B_selected_7_5S$D7_8_1_S

B_selected_7_5V__D7_7_5V <- B_selected_7_5V$D7_7_5_V
B_selected_7_5V__D7_7_5S <- B_selected_7_5V$D7_7_5_S
B_selected_7_5V__D7_8_1S <- B_selected_7_5V$D7_8_1_S

B_selected_both__D7_7_5V <- B_selected_both$D7_7_5_V
B_selected_both__D7_7_5S <- B_selected_both$D7_7_5_S
B_selected_both__D7_8_1S <- B_selected_both$D7_8_1_S

B_selected_all <- unique(rbind(B_selected_7_5S,B_selected_7_5V,B_selected_both))
B_selected_all_D7_7_5S <- B_selected_all$D7_7_5_S
B_selected_all_D7_7_5V <- B_selected_all$D7_7_5_V
B_selected_all_D7_8_1S <- B_selected_all$D7_8_1_S


B_d7_7_5S <- (B_selected_all_D7_7_5S - B_selected_all_D7_8_1S)
B_d7_7_5V <- (B_selected_all_D7_7_5V - B_selected_all_D7_8_1S)

B_d7_7_5S_both <- (B_selected_both__D7_7_5S - B_selected_both__D7_8_1S)
B_d7_7_5V_both <- (B_selected_both__D7_7_5V - B_selected_both__D7_8_1S)

B_d7_7_5S_sig7_5S <- (B_selected_7_5S__D7_7_5S - B_selected_7_5S__D7_8_1S)
B_d7_7_5V_sig7_5S <- (B_selected_7_5S__D7_7_5V - B_selected_7_5S__D7_8_1S)

B_d7_7_5S_sig7_5V <- (B_selected_7_5V__D7_7_5S - B_selected_7_5V__D7_8_1S)
B_d7_7_5V_sig7_5V <- (B_selected_7_5V__D7_7_5V - B_selected_7_5V__D7_8_1S)



cor.test(B_d7_7_5S, B_d7_7_5V,
         method = "pearson",
         conf.level = 0.95)

cor.test(B_d7_7_5S_sig7_5S, B_d7_7_5V_sig7_5S,
         method = "pearson",
         conf.level = 0.95)

cor.test(B_d7_7_5S_sig7_5V , B_d7_7_5V_sig7_5V,
         method = "pearson",
         conf.level = 0.95)

cor.test(B_d7_7_5S_both, B_d7_7_5V_both,
         method = "pearson",
         conf.level = 0.95)

# corr genome wide:
B_d7_7_5S_all <- (B_neutral$D7_7_5_S - B_neutral$D7_8_1_S)
B_d7_7_5V_all <- (B_neutral$D7_7_5_V - B_neutral$D7_8_1_S)

cor.test(B_d7_7_5S_all, B_d7_7_5V_all)



############################# D7-7.0S vs D7-7.0V #############################

C_selected_7_0S <- af[which(af$DAY7_D7_7_0_S_selection_pval < cut_off & af$DAY7_D7_7_0_V_selection_pval >= cut_off),]
C_selected_7_0V <- af[which(af$DAY7_D7_7_0_V_selection_pval < cut_off & af$DAY7_D7_7_0_S_selection_pval >= cut_off),]
C_selected_both <- af[which(af$DAY7_D7_7_0_V_selection_pval < cut_off & af$DAY7_D7_7_0_S_selection_pval < cut_off),]
C_neutral <- af[which(af$DAY7_D7_7_0_V_selection_pval > cut_off & af$DAY7_D7_7_0_S_selection_pval > cut_off),]

# pull out allele freqs
C_selected_7_0S__D7_7_0V <- C_selected_7_0S$D7_7_0_V
C_selected_7_0S__D7_7_0S <- C_selected_7_0S$D7_7_0_S
C_selected_7_0S__D7_8_1S <- C_selected_7_0S$D7_8_1_S

C_selected_7_0V__D7_7_0V <- C_selected_7_0V$D7_7_0_V
C_selected_7_0V__D7_7_0S <- C_selected_7_0V$D7_7_0_S
C_selected_7_0V__D7_8_1S <- C_selected_7_0V$D7_8_1_S

C_selected_both__D7_7_0V <- C_selected_both$D7_7_0_V
C_selected_both__D7_7_0S <- C_selected_both$D7_7_0_S
C_selected_both__D7_8_1S <- C_selected_both$D7_8_1_S

C_selected_all <- unique(rbind(C_selected_7_0S,C_selected_7_0V,C_selected_both))
C_selected_all_D7_7_0S <- C_selected_all$D7_7_0_S
C_selected_all_D7_7_0V <- C_selected_all$D7_7_0_V
C_selected_all_D7_8_1S <- C_selected_all$D7_8_1_S


C_d7_7_0S <- (C_selected_all_D7_7_0S - C_selected_all_D7_8_1S)
C_d7_7_0V <- (C_selected_all_D7_7_0V - C_selected_all_D7_8_1S)

C_d7_7_0S_both <- (C_selected_both__D7_7_0S - C_selected_both__D7_8_1S)
C_d7_7_0V_both <- (C_selected_both__D7_7_0V - C_selected_both__D7_8_1S)

C_d7_7_0S_sig7_0S <- (C_selected_7_0S__D7_7_0S - C_selected_7_0S__D7_8_1S)
C_d7_7_0V_sig7_0S <- (C_selected_7_0S__D7_7_0V - C_selected_7_0S__D7_8_1S)

C_d7_7_0S_sig7_0V <- (C_selected_7_0V__D7_7_0S - C_selected_7_0V__D7_8_1S)
C_d7_7_0V_sig7_0V <- (C_selected_7_0V__D7_7_0V - C_selected_7_0V__D7_8_1S)



cor.test(C_d7_7_0S, C_d7_7_0V,
         method = "pearson",
         conf.level = 0.95)

cor.test(C_d7_7_0S_sig7_0S, C_d7_7_0V_sig7_0S,
         method = "pearson",
         conf.level = 0.95)

cor.test(C_d7_7_0S_sig7_0V , C_d7_7_0V_sig7_0V,
         method = "pearson",
         conf.level = 0.95)

cor.test(C_d7_7_0S_both, C_d7_7_0V_both,
         method = "pearson",
         conf.level = 0.95)

# corr genome wide:
C_d7_7_0S_all <- (C_neutral$D7_7_0_S - C_neutral$D7_8_1_S)
C_d7_7_0V_all <- (C_neutral$D7_7_0_V - C_neutral$D7_8_1_S)

cor.test(C_d7_7_0S_all, C_d7_7_0V_all)



############################# D7-7.5V vs D7-7.0V #############################

D_selected_7_5 <- af[which(af$DAY7_D7_7_5_V_selection_pval < cut_off & af$DAY7_D7_7_0_V_selection_pval >= cut_off),]
D_selected_7_0 <- af[which(af$DAY7_D7_7_0_V_selection_pval < cut_off & af$DAY7_D7_7_5_V_selection_pval >= cut_off),]
D_selected_both <- af[which(af$DAY7_D7_7_0_V_selection_pval < cut_off & af$DAY7_D7_7_5_V_selection_pval < cut_off),]
D_neutral <- af[which(af$DAY7_D7_7_0_V_selection_pval > cut_off & af$DAY7_D7_7_5_V_selection_pval > cut_off),]

# pull out allele freqs
D_selected_7_5__D7_7_0V <- D_selected_7_5$D7_7_0_V
D_selected_7_5__D7_7_5V <- D_selected_7_5$D7_7_5_V
D_selected_7_5__D7_8_1S <- D_selected_7_5$D7_8_1_S

D_selected_7_0__D7_7_0V <- D_selected_7_0$D7_7_0_V
D_selected_7_0__D7_7_5V <- D_selected_7_0$D7_7_5_V
D_selected_7_0__D7_8_1S <- D_selected_7_0$D7_8_1_S

D_selected_both__D7_7_0V <- D_selected_both$D7_7_0_V
D_selected_both__D7_7_5V <- D_selected_both$D7_7_5_V
D_selected_both__D7_8_1S <- D_selected_both$D7_8_1_S

D_selected_all <- unique(rbind(D_selected_7_5,D_selected_7_0,D_selected_both))
D_selected_all_D7_7_5V <- D_selected_all$D7_7_5_V
D_selected_all_D7_7_0V <- D_selected_all$D7_7_0_V
D_selected_all_D7_8_1S <- D_selected_all$D7_8_1_S


D_d7_7_5V <- (D_selected_all_D7_7_5V - D_selected_all_D7_8_1S)
D_d7_7_0V <- (D_selected_all_D7_7_0V - D_selected_all_D7_8_1S)

D_d7_7_5V_both <- (D_selected_both__D7_7_5V - D_selected_both__D7_8_1S)
D_d7_7_0V_both <- (D_selected_both__D7_7_0V - D_selected_both__D7_8_1S)

D_d7_7_5V_sig7_5V <- (D_selected_7_5__D7_7_5V - D_selected_7_5__D7_8_1S)
D_d7_7_0V_sig7_5V <- (D_selected_7_5__D7_7_0V - D_selected_7_5__D7_8_1S)

D_d7_7_5V_sig7_0V <- (D_selected_7_0__D7_7_5V - D_selected_7_0__D7_8_1S)
D_d7_7_0V_sig7_0V <- (D_selected_7_0__D7_7_0V - D_selected_7_0__D7_8_1S)

cor.test(D_d7_7_5V, D_d7_7_0V,
         method = "pearson",
         conf.level = 0.95)

cor.test(D_d7_7_5V_sig7_5V, D_d7_7_0V_sig7_5V,
         method = "pearson",
         conf.level = 0.95)

cor.test(D_d7_7_5V_sig7_0V , D_d7_7_0V_sig7_0V,
         method = "pearson",
         conf.level = 0.95)

cor.test(D_d7_7_5V_both, D_d7_7_0V_both,
         method = "pearson",
         conf.level = 0.95)


# corr genome wide:
D_d7_7_5V_all <- (D_neutral$D7_7_5_V - D_neutral$D7_8_1_S)
D_d7_7_0V_all <- (D_neutral$D7_7_0_V - D_neutral$D7_8_1_S)

cor.test(D_d7_7_5V_all, D_d7_7_0V_all)




############################################################################
### Scatter Plot  2x2 panel
############################################################################

# static dark, variable light, neither filled
# overlapping filled?
# match colors to boxplots.
# 

png("~/Documents/UVM/spoa/figures/AFChange_AllScatterPlots_2x2Panel.png", height=170, width=175, units="mm", res=300)
 par(mfrow = c(2,2),
          oma = c(0,0,1,0) + 0.1,
          mar = c(3,3,1,1) + 0.1)
# plot 1
plot(0,type='n', xlim=c(-0.05,.3), ylim=c(-0.05,.3),
     main="",
     ylab="",
     xlab="",
     cex.lab=1.1, cex.axis=1,
     xaxt="n",yaxt="n")
box(which="plot")
abline(0, 1, col="black", lty=2, lwd=2.2)
abline(h=0, lty=2, col="grey")
abline(v=0, lty=2, col="grey")
axis(1, mgp=c(1.8, .2, 0), cex.axis=0.8,tcl=-0.2) # second is tick mark labels
axis(2, mgp=c(1.8, .4, 0), cex.axis=0.8, tcl=-0.2)
title(ylab=expression(paste(Delta," allele frequency pH 7.0 variable")), line=1.5, cex.lab=1.1)
title(xlab=expression(paste(Delta," allele frequency pH 7.0 static")), line=1.5, cex.lab=1.1)

points(x=C_d7_7_0S_sig7_0S, y=C_d7_7_0V_sig7_0S, col=alpha("black", 1),
       bg = alpha("#be0000", 1), cex=1.1, pch=21)
points(x=C_d7_7_0S_sig7_0V, y=C_d7_7_0V_sig7_0V, col=alpha("black", 1),
       bg = alpha("#ff817b", 1),  cex=1.1, pch=22)
points(x=C_d7_7_0S_both, y=C_d7_7_0V_both, col=alpha("black", 1),
       bg = alpha("#EBCC2A", 1), cex=1.4, pch=23)

legend("bottomright", c("pH 7.0-Static",
                    "pH 7.0-Variable",
                    "Overlapping"),
       horiz = FALSE, inset = c(0, 0),
       pt.bg = c("#be0000", "#ff817b","#EBCC2A"),
       pt.cex=1.5, cex=0.9, pch=c(21,22,23),
       bg="white")

mtext(text=bquote(paste('(',italic('a'),')')),
     side=3, line=0,
    cex=1.5,
   at=par("usr")[1]-0.14*diff(par("usr")[1:2]), outer=FALSE)

#dev.off()

# plot 2

plot(0,type='n', xlim=c(-0.05,.3), ylim=c(-0.05,.3),
     main="",
     ylab="",
     xlab="",
     cex.lab=1.1, cex.axis=1,
     xaxt="n",yaxt="n")
box(which="plot")

abline(0, 1, col="black", lty=2, lwd=2.2)
abline(h=0, lty=2, col="grey")
abline(v=0, lty=2, col="grey")
axis(1, mgp=c(1.8, .2, 0), cex.axis=0.8,tcl=-0.2) # second is tick mark labels
axis(2, mgp=c(1.8, .4, 0), cex.axis=0.8, tcl=-0.2)
title(ylab=expression(paste(Delta," allele frequency pH 7.5 variable")), line=1.5, cex.lab=1.1)
title(xlab=expression(paste(Delta," allele frequency pH 7.5 static")), line=1.5, cex.lab=1.1)

points(x=B_d7_7_5S_sig7_5S, y=B_d7_7_5V_sig7_5S, col=alpha("black", 1),
       bg = alpha("#2222ff", 1), cex=1.1, pch=24)
points(x=B_d7_7_5S_sig7_5V, y=B_d7_7_5V_sig7_5V, col=alpha("black", 1),
       bg = alpha("lightskyblue", 1),  cex=1.1, pch=25)
points(x=B_d7_7_5S_both, y=B_d7_7_5V_both, col=alpha("black", 1),
       bg = alpha("#EBCC2A", 1), cex=1.4, pch=23)

legend("bottomright", c("pH 7.5-Static",
                    "pH 7.5-Variable",
                    "Overlapping"),
       horiz = FALSE, inset = c(0, 0),
       pt.bg = c("#2222ff", "lightskyblue","#EBCC2A"),
       pt.cex=1.5, cex=0.9, pch=c(24,25,23),
       bg="white")

mtext(text=bquote(paste('(',italic('b'),')')),
     side=3, line=0,
    cex=1.5,
   at=par("usr")[1]-0.14*diff(par("usr")[1:2]), outer=FALSE)


### lpot 3
plot(0,type='n', xlim=c(-0.05,.3), ylim=c(-0.05,.3),
     main="",
     ylab="",
     xlab="",
     cex.lab=1.1, cex.axis=1,
     xaxt="n",yaxt="n")
box(which="plot")
abline(0, 1, col="black", lty=2, lwd=2.2)
abline(h=0, lty=2, col="grey")
abline(v=0, lty=2, col="grey")
axis(1, mgp=c(1.8, .2, 0), cex.axis=0.8,tcl=-0.2) # second is tick mark labels
axis(2, mgp=c(1.8, .4, 0), cex.axis=0.8, tcl=-0.2)
title(ylab=expression(paste(Delta," allele frequency pH 7.0 static")), line=1.5, cex.lab=1.1)
title(xlab=expression(paste(Delta," allele frequency pH 7.5 static")), line=1.5, cex.lab=1.1)

points(x=A_d7_7_5S_sig7_5S, y=A_d7_7_0S_sig7_5S, col=alpha("black", 1),
       bg = alpha("#2222ff", 1), cex=1.1, pch=24)
points(x=A_d7_7_5S_sig7_0S, y=A_d7_7_0S_sig7_0S, col=alpha("black", 1),
       bg = alpha("#be0000", 1),  cex=1.1, pch=21)
points(x=A_d7_7_5S_both, y=A_d7_7_0S_both, col=alpha("black", 1),
       bg = alpha("#EBCC2A", 1), cex=1.4, pch=23)


legend("bottomright", c("pH 7.0-Static",
                    "pH 7.5-Static",
                    "Overlapping"),
       horiz = FALSE, inset = c(0, 0),
       pt.bg = c("#be0000", "#2222ff","#EBCC2A"),
       pt.cex=1.5, cex=0.9, pch=c(21,24,23),
       bg="white")

mtext(text=bquote(paste('(',italic('c'),')')),
     side=3, line=0,
    cex=1.5,
   at=par("usr")[1]-0.14*diff(par("usr")[1:2]), outer=FALSE)


# plot 4

plot(0,type='n', xlim=c(-0.05,.3), ylim=c(-0.05,.3),
     main="",
     ylab="",
     xlab="",
     cex.lab=1.1, cex.axis=1,
     xaxt="n",yaxt="n")
box(which="plot")
abline(0, 1, col="black", lty=2, lwd=2.2)
abline(h=0, lty=2, col="grey")
abline(v=0, lty=2, col="grey")
axis(1, mgp=c(1.8, .2, 0), cex.axis=0.8,tcl=-0.2) # second is tick mark labels
axis(2, mgp=c(1.8, .4, 0), cex.axis=0.8, tcl=-0.2)
title(ylab=expression(paste(Delta," allele frequency pH 7.0 variable")), line=1.5, cex.lab=1.1)
title(xlab=expression(paste(Delta," allele frequency pH 7.5 variable")), line=1.5, cex.lab=1.1)

points(x=D_d7_7_5V_sig7_5V, y=D_d7_7_0V_sig7_5V, col=alpha("black", 1),
       bg = alpha("lightskyblue", 1), cex=1.1, pch=25)
points(x=D_d7_7_5V_sig7_0V, y=D_d7_7_0V_sig7_0V, col=alpha("black", 1),
       bg = alpha("#ff817b", 1),  cex=1.1, pch=22)
points(x=D_d7_7_5V_both, y=D_d7_7_0V_both, col=alpha("black", 1),
       bg = alpha("#EBCC2A", 1), cex=1.4, pch=23)

legend("bottomright", c("pH 7.0-Variable",
                    "pH 7.5-Variable",
                    "Overlapping"),
       horiz = FALSE, inset = c(0, 0),
       pt.bg = c("#ff817b","lightskyblue","#EBCC2A"),
       pt.cex=1.5, cex=0.9, pch=c(22,25,23),
       bg="white")

mtext(text=bquote(paste('(',italic('d'),')')),
     side=3, line=0,
    cex=1.5,
   at=par("usr")[1]-0.14*diff(par("usr")[1:2]), outer=FALSE)


dev.off()
