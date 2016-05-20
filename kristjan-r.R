# Created by Kristjan for his tasks

# Find average of 
# HF = Home Team Fouls Committed & AF = Away Team Fouls Committed

## TOTALS

# Germany - Foul data available from 00-01 season (02-03 missing)
DEaverageFoulsHome = mean(germanyData$HF, na.rm = TRUE)
DEaverageFoulsAway = mean(germanyData$AF, na.rm = TRUE)

# England - Fouls available from 00-01 season
ENaverageFoulsHome = mean(englandData$HF, na.rm = TRUE)
ENaverageFoulsAway = mean(englandData$AF, na.rm = TRUE)
# English referees more lenient? Tho, 3 to 7 seasons of more data

# Italy - Fouls available from 05-06 with some blanks
ITaverageFoulsHome = mean(italyData$HF, na.rm = TRUE)
ITaverageFoulsAway = mean(italyData$AF, na.rm = TRUE)

# Spain - Fouls available from 05-06
ESaverageFoulsHome = mean(spainData$HF, na.rm = TRUE)
ESaverageFoulsAway = mean(spainData$AF, na.rm = TRUE)

# France - Fouls available from 07-08
FRaverageFoulsHome = mean(franceData$HF, na.rm = TRUE)
FRaverageFoulsAway = mean(franceData$AF, na.rm = TRUE)

## END OF TOTALS

## Start of yearly

# DE
homeFoulsDE = aggregate(HF~season, data=germanyData, mean)
awayFoulsDE = aggregate(AF~season, data=germanyData, mean)
seasonsDE <- array(suppressWarnings(c("00-01", "01-02","03-04", "04-05", "05-06","06-07","07-08","08-09","09-10","10-11","11-12","12-13","13-14","14-15","15-16")))

plot(homeFoulsDE,type = "o", main="Fouls by seasons in Bundesliga",
     xaxt = "n", frame = FALSE, col = "red", ylim=c(13, 22), ylab="Fouls", xlab = "Season")
lines(awayFoulsDE,col="green", type="o")
legend("topright", inset=.05,
       c("Away","Home"),fill=c("green", "red"), horiz=FALSE, bty = "n")
axis(side=1, at=homeFoulsDE[,1],labels=seasonsDE)
# End DE

# EN
homeFoulsEN = aggregate(HF~season, data=englandData, mean)
awayFoulsEN = aggregate(AF~season, data=englandData, mean)
seasonsEN <- array(suppressWarnings(c("00-01","01-02", "02-03","03-04", "04-05", "05-06","06-07","07-08","08-09","09-10","10-11","11-12","12-13","13-14","14-15","15-16")))

plot(homeFoulsEN,type = "o", main="Fouls by seasons in the Premiership",
     xaxt = "n", frame = FALSE, col = "red", ylim=c(9, 15), ylab="Fouls", xlab = "Season")
lines(awayFoulsEN,col="green", type="o")
legend("topright", inset=.05,
       c("Away","Home"),fill=c("green", "red"), horiz=FALSE, bty = "n")
axis(side=1, at=homeFoulsEN[,1],labels=seasonsEN)
# End EN

# IT
homeFoulsIT = aggregate(HF~season, data=italyData, mean)
awayFoulsIT = aggregate(AF~season, data=italyData, mean)
seasonsIT <- array(suppressWarnings(c("05-06","06-07","07-08","08-09","09-10","10-11","11-12","12-13","13-14","14-15","15-16")))

plot(homeFoulsIT,type = "o", main="Fouls by seasons in Serie A",
     xaxt = "n", frame = FALSE, col = "red", ylim=c(13, 20), ylab="Fouls", xlab = "Season")
lines(awayFoulsIT,col="green", type="o")
legend("topright", inset=.05,
       c("Away","Home"),fill=c("green", "red"), horiz=FALSE, bty = "n")
axis(side=1, at=homeFoulsIT[,1],labels=seasonsIT)
# End IT

# ES
homeFoulsES = aggregate(HF~season, data=spainData, mean)
awayFoulsES = aggregate(AF~season, data=spainData, mean)
seasonsES <- array(suppressWarnings(c("05-06","06-07","07-08","08-09","09-10","10-11","11-12","12-13","13-14","14-15","15-16")))

plot(homeFoulsES,type = "o", main="Fouls by seasons in La Liga",
     xaxt = "n", frame = FALSE, col = "red", ylim=c(13, 20), ylab="Fouls", xlab = "Season")
lines(awayFoulsES,col="green", type="o")
legend("topright", inset=.05,
       c("Away","Home"),fill=c("green", "red"), horiz=FALSE, bty = "n")
axis(side=1, at=homeFoulsES[,1],labels=seasonsES)
# End ES

# FR
homeFoulsFR = aggregate(HF~season, data=franceData, mean)
awayFoulsFR = aggregate(AF~season, data=franceData, mean)
seasonsFR <- array(suppressWarnings(c("07-08","08-09","09-10","10-11","11-12","12-13","13-14","14-15","15-16")))

plot(homeFoulsFR,type = "o", main="Fouls by seasons in Ligue 1",
     xaxt = "n", frame = FALSE, col = "red", ylim=c(13, 20), ylab="Fouls", xlab = "Season")
lines(awayFoulsFR,col="green", type="o")
legend("topright", inset=.05,
       c("Away","Home"),fill=c("green", "red"), horiz=FALSE, bty = "n")
axis(side=1, at=homeFoulsFR[,1],labels=seasonsFR)
# End FR


#COMBINE TOGETHER
par(mfrow=c(2,3))
plot(homeFoulsFR,type = "o", main="Ligue 1",
     xaxt = "n", frame = FALSE, col = "red", ylim=c(9, 22), ylab="Fouls", xlab = "Season")
lines(awayFoulsFR,col="green", type="o")
legend("topright", inset=.05,
       c("Away","Home"),fill=c("green", "red"), horiz=FALSE, bty = "n")
axis(side=1, at=homeFoulsFR[,1],labels=seasonsFR)
plot(homeFoulsES,type = "o", main="La Liga",
     xaxt = "n", frame = FALSE, col = "red", ylim=c(9, 22), ylab="Fouls", xlab = "Season")
lines(awayFoulsES,col="green", type="o")
legend("topright", inset=.05,
       c("Away","Home"),fill=c("green", "red"), horiz=FALSE, bty = "n")
axis(side=1, at=homeFoulsES[,1],labels=seasonsES)
plot(homeFoulsIT,type = "o", main="Serie A",
     xaxt = "n", frame = FALSE, col = "red", ylim=c(9, 22), ylab="Fouls", xlab = "Season")
lines(awayFoulsIT,col="green", type="o")
legend("topright", inset=.05,
       c("Away","Home"),fill=c("green", "red"), horiz=FALSE, bty = "n")
axis(side=1, at=homeFoulsIT[,1],labels=seasonsIT)
plot(homeFoulsEN,type = "o", main="Premiership",
     xaxt = "n", frame = FALSE, col = "red", ylim=c(9, 22), ylab="Fouls", xlab = "Season")
lines(awayFoulsEN,col="green", type="o")
legend("topright", inset=.05,
       c("Away","Home"),fill=c("green", "red"), horiz=FALSE, bty = "n")
axis(side=1, at=homeFoulsEN[,1],labels=seasonsEN)
plot(homeFoulsDE,type = "o", main="Bundesliga",
     xaxt = "n", frame = FALSE, col = "red", ylim=c(9, 22), ylab="Fouls", xlab = "Season")
lines(awayFoulsDE,col="green", type="o")
legend("topright", inset=.05,
       c("Away","Home"),fill=c("green", "red"), horiz=FALSE, bty = "n")
axis(side=1, at=homeFoulsDE[,1],labels=seasonsDE)

## End of combining

## Conlusions
## England has lower foul rates and away team usually commits more fouls - not in La Liga.
## Bundesliga has the biggest cap between home and away. Number of fouls is decreasing overall