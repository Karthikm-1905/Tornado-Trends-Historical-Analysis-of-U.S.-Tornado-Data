setwd("C:/Users/Karthik/Desktop/AIT 580/Assignment 4")
tordata <-read.csv("1950-2019_actual_tornadoes-checkpoint.csv",header = TRUE)
View(tordata)

display_records <- head(tordata,10)
display_records


#boxplot Lenght of the Tornado

tordatalen<-subset(tordata,subset = len >=50)
summary(tordatalen$len)
summary(tordata$wid)
boxplot(tordatalen$len,main="boxplt of tornado length",xlab="tordatalen$len",ylab="length in miles")

#boxplot Width of the Tornado

tordatawid<- subset(tordata,subset = wid>=100)
summary(tordatawid$wid)
boxplot(tordatawid$wid,main="boxplot of tornado width",xlab="datawid$wid",ylab="width in yards")

#mean number of injuries and fatalities for each tornado magnitude

install.packages("expss")
library(expss)
cro_mean(tordata$inj, tordata$mag)
cro_mean(tordata$fat, tordata$mag)

#loss for each tornado magnitude
tornado_loss <- plot(x=tordata$mag, y=tordata$loss, main="loss for each magnitude",col="blue")
tornado_loss

#Which 3 states have the highest injuries and fatalities?

Highest_injuries<-cro_sum(tordata$inj, tordata$st)
Highest_injuries

#output:TX-9353, AL-8569, OK-5994

#Fatalities

Highest_fatalities<- cro_sum(tordata$fat, tordata$st)
Highest_fatalities

#output: AL-653, TX- 586, MS-463

# Is there a trend in the number of tornados from 1950 through 2019?
hist(tordata$yr, col="red",main="tornadoes timeline",xlab = "years")
