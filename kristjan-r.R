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
plot(homeFoulsEN,type = "o", main="Premier League",
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


## REFEREES
library(plyr)
aggregate(x ~ Year + Month, data = df, FUN = length)
homeYellow = aggregate(HY~Referee, data=englandData, sum)
awayYellow = aggregate(AY~Referee, data=englandData, sum)
homeRed = aggregate(HR~Referee, data=englandData, sum)
awayRed = aggregate(AR~Referee, data=englandData, sum)
refGames = count(englandData, "Referee")
homeYellow
awayYellow
englandData[englandData=="\xa0D Gallagher"]<-"D Gallagher"
mergedRed <- merge(homeRed,awayRed,by="Referee")
mergedRed <- merge(mergedRed, refGames, by="Referee")
merged <- merge(homeYellow,awayYellow,by="Referee")
merged <- merge(merged, refGames, by="Referee")
merged = aggregate(HY, AY ~ Referee, mean, data=merged)
## Mike Dean 643+28+8+7+1 HomeYellows, 691+29+16+9+2 AwayYellows - 367+18+7+6+1 Games

## Mike Dean 687 HomeYellows, 747 Away Yellows, 399 Games
## Phil Dowd 443 HomeYellows, 643 Away Yellows, 306 Games
## Howard Webb 427 HomeYellows, 555 AwayYellows, 297 Games
## Martin Atkinson 433 HomeYellows, 568 AwayYellows, 292 Games
## Mark Clattenburg 395 HomeYellows,486 AwayYellows, 271 Games
## Chris Foy 303 HomeYellows, 413 AwayYellow, 262 Games
## Andre Marriner 329 HomeYellws, 427 AwayYellow, 228 Games
## Mark Halsey 228 HomeYellws, 348 AwayYellow, 265 Games
## Alan Wiley 351 HomeYellws, 417 AwayYellow, 253 Games
## Steve Bennet 343 HomeYellows, 482 AwayYellow, 243 Games
## Lee Mason 277 HomeYellows, 351 AwayYellow, 204 Games
## Rob Styles 310 HomeYellows, 462 AwayYellow , 211 Games

## Referees with over 200 games
dean = c(687, 747, 30, 52, 399)
dowd = c(443, 643,24,43,306)
webb = c(427, 555,12,21, 297)
atkinson = c(433, 568,23,26, 292) 
clattenburg = c(395, 486,28,16, 271)
foy = c(303, 413,10,28,262)
marriner = c(329,427,15,30,228)
halsey = c(228, 348,14,17, 265)
wiley = c(351, 417,11,21,253)
bennet = c(343,482,15,37,243)
mason = c(277, 351,10,23,204)
styles = c(310, 462,22,33, 211)

referees = data.frame(dean, dowd, webb, atkinson, clattenburg, foy, marriner, halsey, wiley, bennet, mason, styles)
referees = data.frame(t(referees))
colnames(referees) <- c("Home Yellows","Away Yellows", "Home Reds", "Away Reds", "Games")

referees$HYperGame <- referees$`Home Yellows` / referees$Games
referees$AYperGame <- referees$`Away Yellows` / referees$Games
referees$AYHYRatio <- referees$AYperGame / referees$HYperGame
referees$HRperGame <- referees$`Home Reds` / referees$Games
referees$ARperGame <- referees$`Away Reds` / referees$Games
referees$ARHRRatio <- referees$ARperGame / referees$HRperGame
referees$totalCards <- referees$`Home Yellows` + referees$`Away Yellows` + referees$`Home Reds` + referees$`Away Reds`
referees$toralCardsPerGame <- referees$totalCards / referees$Games
referees$totalYellow <- referees$`Home Yellows` + referees$`Away Yellows`
referees$totalRed <- referees$`Home Reds` + referees$`Away Reds`
referees$redToYellow <- referees$totalRed / referees$totalYellow
## END OF REFEREES


## START OF CORNERS

englandData$HomeCornersToAwayCorners <- englandData$HC - englandData$AC

## END OF CORNERS

