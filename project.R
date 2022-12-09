rm(list=ls())
setwd("E:\\Study\\Parsha")
data<-read.csv("Water.csv", header = T)
data$Cr<-data$Cr*(-1)
data
library(ggplot2)
library(GGally)
ggscatmat(data,columns = c(2,3,4))+ geom_smooth(lwd=1, se=F)
cor(data[2:4])

premoon<-data.frame("pb"=c(.01,.0139,.1129), 
                  "cr"=c(.398,.401,.403),
                  "cd"=c(.0071,.0052,.0063))
postmon<-data.frame("pb"=c(.0188,.3159,.0683), 
                  "Cr"=c(.407,.405,.322),
                  "cd"=c(.0035,.0061,.0085))
p<-data.frame("pb"=c(.01,.0139,.1129,.0188,.3159,.0683), 
              "cr"=c(.398,.401,.403,.407,.405,.322),
              "cd"=c(.0071,.0052,.0063,.0035,.0061,.0085))

cor(p,method = c("pearson"))
cor.test(p$pb, p$cr)
cor.test(p$pb, p$cd)
cor.test(p$cd, p$cr)

postmon$pb<-postmon$pb^2
postmon$Cr<-postmon$Cr^2
postmon$cd<-postmon$cd^2
postmon$pb<-log(postmon$pb)
postmon$Cr<-log(postmon$Cr)
postmon$cd<-log(postmon$cd)
cor(premon[1:3])
cor(postmon[1:3])

d<-data.frame("Fish"=c("Nama chanda","Lepidocephalus guntea","Colisa fasciatus",
                       "Channa punctatus","Mastacembelus armatus"),
              "Pb"=c(0.098,0.1525,0.0287,0.1278,0.0881),
              "Cr"=c(0.365,0.358,0.403,0.378,0.362),
              "Cd"=c(0.002,0.0021,0.0049,0.0057,0.0042))
cor(d[2:4])

ni<-c(7.58,5.47,6.07,6.02,7.92,6.41,9.74,8.83,6.87)
pb<-c(39.42,63.28,54.19,61.52,47.25,45.17,42.18,38.25,59.21)
cf<-c(6.21,8.20,7.23,7.02,5.29,6.19,5.74,6.27,6.27)
cr<-c(467.19,451.08,501.11,378.87,432.79,415.03,387.35,447.58,491.13)
cu<-c(188.08,181.21,152.64,166.65,129.36,183.87,164.12,98.37,127.98)
f<-data.frame(pb,cf,ni,cu,cr)
cor(f)
