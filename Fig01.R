### Making pH time-series data plot

library(tidyr)
library(ggplot2)
library(reshape2)
library(ggplot2)

# First, need to make data into long format
dat <- read.csv("~/Documents/UVM/spoa/SpOA_June2018_pHTempData_updated.csv", header = TRUE)

#data_long <- gather(olddata_wide, pH, measurement, pH7.0V:pH7.5S, factor_key=TRUE)
data_long <- gather(dat, pH, measurement, pH7.0V:pH7.5S)
head(data_long)
tail(data_long)

#  #be0000 - dark red (7.0S)
#  #ff817b - pink (7.0V)
#  #2222ff - blue (7.5S)
#  lightskyblue - light blue (7.5V)
#  darkgreen - 8.1S
#  darkseagreen1 - 8.1V

# find where to label x axis

dbreaks <- c()
dbreaks[1] <- mean(dat$Num[which(dat$Day == "D1")])
dbreaks[2] <- mean(dat$Num[which(dat$Day == "D2")])
dbreaks[3] <- mean(dat$Num[which(dat$Day == "D3")])
dbreaks[4] <- mean(dat$Num[which(dat$Day == "D4")])
dbreaks[5] <- mean(dat$Num[which(dat$Day == "D5")])
dbreaks[6] <- mean(dat$Num[which(dat$Day == "D6")])
dbreaks[7] <- mean(dat$Num[which(dat$Day == "D7")])

dlabs <- as.character(seq(1:7))

pdf("~/Documents/UVM/spoa/figures/Fig1.pdf", height=3.5, width=8)

 par(mfrow = c(1,3),
          oma = c(0,0,1,0) + 0.1,
          mar = c(3,3,1,1) + 0.1)

plot(0,type='n', xlim=c(0,579), ylim=c(6.5,8.25),
     main="",
     ylab="",
     xlab="",
     cex.lab=1.1, cex.axis=1,
     xaxt="n",yaxt="n")
box(which="plot")

abline(h=8.1, lty=1, col="grey")
abline(h=7.5, lty=1, col="grey")
abline(h=7.0, lty=1, col="grey")
axis(2, mgp=c(1.8, .2, 0), cex.axis=1,tcl=-0.2, at=c(6.5, 7.0, 7.5, 8.1)) # second is tick mark labels
axis(1, mgp=c(1.8, .4, 0), cex.axis=1, tcl=-0.2, at= dbreaks, labels=dlabs)
title(ylab=c("pH"), line=1.5, cex.lab=1.1)
title(xlab=c("Day"), line=1.5, cex.lab=1.1)

lines(x=dat$Num, y=dat$pH8.1S, col=alpha("darkgreen", 1),
       bg = alpha("darkgreen", 1), cex=0.8, pch=16, lwd=3.5)
lines(x=dat$Num, y=dat$pH8.1V, col=alpha("darkseagreen1", 1),
       bg = alpha("darkseagreen1", 1), cex=0.8, pch=16, lwd=3)

lines(x=dat$Num, y=dat$pH7.5S, col=alpha("#2222ff", 1),
       bg = alpha("#2222ff", 1), cex=0.8, pch=16, lwd=3)
lines(x=dat$Num, y=dat$pH7.5V, col=alpha("lightskyblue", 1),
       bg = alpha("lightskyblue", 1), cex=0.8, pch=16, lwd=3)

lines(x=dat$Num, y=dat$pH7.0S, col=alpha("#be0000", 1),
       bg = alpha("#be0000", 1), cex=0.8, pch=16, lwd=3)
lines(x=dat$Num, y=dat$pH7.0V, col=alpha("#ff817b", 1),
       bg = alpha("#ff817b", 1), cex=0.8, pch=16, lwd=3)

mtext(text="A",
     side=3, line=0,
    cex=1.5,
   at=par("usr")[1]-0.14*diff(par("usr")[1:2]), outer=FALSE)


### SURVIVAL ###
survival <- read.csv("~/Documents/UVM/spoa/SpOA_MortalityData_June2018_Binomial.csv")
head(survival)

### MORPHOMETRICS: TOTAL BODY LENGTH - BODY + ARM ###
pluteus <- read.csv("~/Documents/UVM/spoa/SpOA_TotalLarvalBodyLength_ForR.csv")
#attach(pluteus)
head(pluteus)


# Survival
survival$Treatment<-factor(survival$Treatment, levels=c("8.1S", "8.1V", "7.5S", "7.5V", "7.0S", "7.0V"))
boxplot(survival$Alive ~ survival$Treatment, 
    col=c("darkgreen", "darkseagreen1","#2222ff","lightskyblue","#be0000","#ff817b"), 
         ylab="",
     xlab="",
     cex.lab=1.1, cex.axis=1,
     xaxt="n",yaxt="n",
     ylim=c(0, 65))
axis(2, mgp=c(1.8, .2, 0), cex.axis=1,tcl=-0.2) # second is tick mark labels
axis(1, mgp=c(1.8, .4, 0), cex.axis=1, tcl=-0.2, 
        at = seq(1,6,1),labels=c("8.1S", "8.1V", "7.5S", "7.5V", "7.0S", "7.0V"))
#title(ylab=c("pH"), line=1.5, cex.lab=1.1)
title(ylab=c("Percent survival at 7 days post-fertilization"), line=1.5, cex.lab=1.1)

mtext(text="B",
      side=3, line=0,
      cex=1.5,
      at=par("usr")[1]-0.14*diff(par("usr")[1:2]), outer=FALSE)

legend("topright", c("pH 8.1-S",
                    "pH 8.1-V",
                    "pH 7.5-S",
                    "pH 7.5-V",
                    "pH 7.0-S",
                    "pH 7.0-V"),
       horiz = FALSE, inset = c(0, 0),
       pt.bg = c("darkgreen", "darkseagreen1","#2222ff","lightskyblue","#be0000","#ff817b"),
       pt.cex=1.8, cex=0.9, pch=c(21),
       bg="white")


# Total Body Length
pluteus$pH<-factor(pluteus$pH, levels=c("8.1S", "8.1V", "7.5S", "7.5V", "7.0S", "7.0V"))
boxplot(pluteus$TotalBodyLength ~ pluteus$pH, 
  col=c("darkgreen", "darkseagreen1","#2222ff","lightskyblue","#be0000","#ff817b"), 
     xlab="",
     cex.lab=1.1, cex.axis=1,
     xaxt="n",yaxt="n",
     ylim=c(100, 395))

axis(2, mgp=c(1.8, .2, 0), cex.axis=1,tcl=-0.2) # second is tick mark labels
axis(1, mgp=c(1.8, .4, 0), cex.axis=1, tcl=-0.2,
      at = seq(1,6,1),labels=c("8.1S", "8.1V", "7.5S", "7.5V", "7.0S", "7.0V"))

title(ylab=c("Total body length (micrometers)"), line=1.5, cex.lab=1.1)
title(xlab=c(""), line=1.5, cex.lab=1.1)

mtext(text="C",
      side=3, line=0,
      cex=1.5,
      at=par("usr")[1]-0.14*diff(par("usr")[1:2]), outer=FALSE)

dev.off()



