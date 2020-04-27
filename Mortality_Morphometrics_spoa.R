### SpOA Morphometrics and Mortality Code
### April D. Garrett

#########################################################################################


### BINOMIAL DATA ANALYSIS : ALIVE vs DEAD

survival <- read.csv("~/Desktop/UVM/DISSERTATION/Chp1_SpOA/Data/SpOA_MortalityData_June2018_Binomial.csv", header = TRUE, sep=",")
head(survival)

MyDF <- survival
MyDF

pHlogit <- glm(cbind(Alive,Dead)~Treatment, data=MyDF, family=binomial)
summary(pHlogit)

install.packages("multcomp")
library(multcomp)
summary(glht(pHlogit, mcp(Treatment="Tukey")))


#Simultaneous Tests for General Linear Hypotheses

#Multiple Comparisons of Means: Tukey Contrasts


#Fit: glm(formula = cbind(Alive, Dead) ~ Treatment, family = binomial, data = MyDF)

#Linear Hypotheses:
#  Estimate Std. Error z value Pr(>|z|)    
#  7.0V - 7.0S == 0  0.66843    0.10577   6.320  < 0.001 ***
#  7.5S - 7.0S == 0  0.22156    0.12082   1.834  0.43822    
#  7.5V - 7.0S == 0  1.17204    0.09883  11.859  < 0.001 ***
#  8.1S - 7.0S == 0  1.35867    0.10251  13.254  < 0.001 ***
#  8.1V - 7.0S == 0  1.30960    0.09685  13.522  < 0.001 ***
#  7.5S - 7.0V == 0 -0.44687    0.11341  -3.940  0.00115 ** 
#  7.5V - 7.0V == 0  0.50361    0.08961   5.620  < 0.001 ***
#  8.1S - 7.0V == 0  0.69024    0.09366   7.370  < 0.001 ***
#  8.1V - 7.0V == 0  0.64117    0.08742   7.334  < 0.001 ***
#  7.5V - 7.5S == 0  0.95048    0.10697   8.885  < 0.001 ***
#  8.1S - 7.5S == 0  1.13711    0.11038  10.302  < 0.001 ***
#  8.1V - 7.5S == 0  1.08803    0.10514  10.348  < 0.001 ***
#  8.1S - 7.5V == 0  0.18663    0.08575   2.176  0.24417    
#  8.1V - 7.5V == 0  0.13755    0.07889   1.744  0.49698    
#  8.1V - 8.1S == 0 -0.04908    0.08346  -0.588  0.99163    
---
  #  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
  #(Adjusted p values reported -- single-step method)
  

#tiff("~/Desktop/Chp1_SpOA/R_Work/LarvalSurvival_res600_binomial.tiff", height=200, width=150, units="mm", res=600)
#survival$Treatment<-factor(survival$Treatment, levels=c("8.1S", "8.1V", "7.5S", "7.5V", "7.0S", "7.0V"))
#boxplot(survival$Alive ~ survival$Treatment, col=c("darkgreen", "darkseagreen1","#2222ff","lightskyblue","#be0000","#ff817b"), xlab="pH", ylab="Percent survival at 7 days post-fertilization", par(font.axis=2), par(font.lab=2))

#dev.off()


### MORPHOMETRICS: BODY + ARM (Total Body Length) ###
pluteus <- read.csv("~/Desktop/UVM/DISSERTATION/Chp1_SpOA/Data/SpOA_REALTotalLarvalBodyLength_ForR.csv")
#attach(pluteus)
head(pluteus)
tail(pluteus)

### RUNNING LINEAR MODEL ###

m2 <- glm(TotalBodyLength~pH, data=pluteus, family=("gaussian"))
summary(m2)

boxplot(pluteus$TotalBodyLength ~ pluteus$pH)

#tiff("~/Desktop/Chp1_SpOA/R_Work/Totallarvalbodylength_res600.tiff", height=200, width=150, units="mm", res=600)
#pluteus$pH<-factor(pluteus$pH, levels=c("8.1S", "8.1V", "7.5S", "7.5V", "7.0S", "7.0V"))
#boxplot(pluteus$TotalBodyLength ~ pluteus$pH, col=c("mediumblue", "royalblue1","darkgreen","green3","red2","lightcoral"), xlab="pH", ylab="Total Body Length (micrometers)", par(font.axis=2), par(font.lab=2))

#dev.off()