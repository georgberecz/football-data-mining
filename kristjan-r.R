# Created by Kristjan for his tasks

# Find average of 
# HF = Home Team Fouls Committed & AF = Away Team Fouls Committed
library(ggplot2)
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

## Old graph
plot(homeFoulsDE,type = "o", main="Fouls by seasons in Bundesliga",
     xaxt = "n", frame = FALSE, col = "red", ylim=c(13, 22), ylab="Fouls", xlab = "Season")
lines(awayFoulsDE,col="green", type="o")
legend("topright", inset=.05,
       c("Away","Home"),fill=c("green", "red"), horiz=FALSE, bty = "n")
axis(side=1, at=homeFoulsDE[,1],labels=seasonsDE)
## End old

##GGPLOT
ggplot() + 
  geom_point(data = homeFoulsDE,aes(x=season, y=HF, group=1, colour="green")) +
  geom_line(data = homeFoulsDE,aes(x=season, y=HF, group=1, colour="green")) +
  geom_point(data = awayFoulsDE,aes(x=season, y=AF, group=1, colour="red")) +
  geom_line(data = awayFoulsDE,aes(x=season, y=AF, group=1, colour="red")) +
  ggtitle("Fouls by seasons in Bundesliga") +
  scale_colour_manual(name = "", values=c("green", "red", "yellow"), labels=c("Home", "Away")) +
  xlab("Season") +
  ylab("Fouls") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
  

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


#COMBINE TOGETHER OLD
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

## End of combining old

## Combine new

par(mfrow=c(2,3))
DE_plot <- ggplot() + 
  geom_point(data = homeFoulsDE,aes(x=season, y=HF, group=1, colour="green")) +
  geom_line(data = homeFoulsDE,aes(x=season, y=HF, group=1, colour="green")) +
  geom_point(data = awayFoulsDE,aes(x=season, y=AF, group=1, colour="red")) +
  geom_line(data = awayFoulsDE,aes(x=season, y=AF, group=1, colour="red")) +
  ggtitle("Bundesliga") +
  scale_colour_manual(name = "", values=c("green", "red", "yellow"), labels=c("Home", "Away")) +
  scale_y_continuous(limits = c(9, 22)) +
  xlab("Season") +
  ylab("Fouls") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
EN_plot <- ggplot() + 
  geom_point(data = homeFoulsEN,aes(x=season, y=HF, group=1, colour="green")) +
  geom_line(data = homeFoulsEN,aes(x=season, y=HF, group=1, colour="green")) +
  geom_point(data = awayFoulsEN,aes(x=season, y=AF, group=1, colour="red")) +
  geom_line(data = awayFoulsEN,aes(x=season, y=AF, group=1, colour="red")) +
  ggtitle("Premier League") +
  scale_colour_manual(name = "", values=c("green", "red", "yellow"), labels=c("Home", "Away")) +
  scale_y_continuous(limits = c(9, 22)) +
  xlab("Season") +
  ylab("Fouls") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
IT_plot <- ggplot() + 
  geom_point(data = homeFoulsIT,aes(x=season, y=HF, group=1, colour="green")) +
  geom_line(data = homeFoulsIT,aes(x=season, y=HF, group=1, colour="green")) +
  geom_point(data = awayFoulsIT,aes(x=season, y=AF, group=1, colour="red")) +
  geom_line(data = awayFoulsIT,aes(x=season, y=AF, group=1, colour="red")) +
  ggtitle("Serie A") +
  scale_colour_manual(name = "", values=c("green", "red", "yellow"), labels=c("Home", "Away")) +
  scale_y_continuous(limits = c(9, 22)) +
  xlab("Season") +
  ylab("Fouls") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
FR_plot <- ggplot() + 
  geom_point(data = homeFoulsFR,aes(x=season, y=HF, group=1, colour="green")) +
  geom_line(data = homeFoulsFR,aes(x=season, y=HF, group=1, colour="green")) +
  geom_point(data = awayFoulsFR,aes(x=season, y=AF, group=1, colour="red")) +
  geom_line(data = awayFoulsFR,aes(x=season, y=AF, group=1, colour="red")) +
  ggtitle("Ligue 1") +
  scale_colour_manual(name = "", values=c("green", "red"), labels=c("Home", "Away")) +
  scale_y_continuous(limits = c(9, 22)) +
  xlab("Season") +
  ylab("Fouls") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90))
ES_plot <- ggplot() + 
  geom_point(data = homeFoulsES,aes(x=season, y=HF, group=1, colour="green")) +
  geom_line(data = homeFoulsES,aes(x=season, y=HF, group=1, colour="green")) +
  geom_point(data = awayFoulsES,aes(x=season, y=AF, group=1, colour="red")) +
  geom_line(data = awayFoulsES,aes(x=season, y=AF, group=1, colour="red")) +
  ggtitle("La Liga") +
  scale_colour_manual(name = "", values=c("green", "red"), labels=c("Home", "Away")) +
  scale_y_continuous(limits = c(9, 22)) +
  xlab("Season") +
  ylab("Fouls") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90))
multiplot(DE_plot, EN_plot, FR_plot, IT_plot, ES_plot, cols=2)

## End new combining

multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}






## Conlusions
## England has lower foul rates and away team usually commits more fouls - not in La Liga.
## Bundesliga has the biggest cap between home and away. Number of fouls is decreasing overall


## REFEREES
library(plyr)
#aggregate(x ~ Year + Month, data = df, FUN = length)
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

#Helper function
calculateHDA <- function(all, aggregated) {
  rows = nrow(all)
  homePercentage = aggregated$Freq[aggregated$Var1=='H'] / rows
  drawPercentage = aggregated$Freq[aggregated$Var1=='D'] / rows
  awayPercentage = aggregated$Freq[aggregated$Var1=='A'] / rows
  result <- c(homePercentage,drawPercentage,awayPercentage)
  return(result)
}

# EN
englandData$HomeCornersToAwayCorners <- englandData$HC - englandData$AC
EN_over15 <- englandData[ which(englandData$HomeCornersToAwayCorners>=15), ]

#table(over15$FTR) # Get count into table
EN_dfover15 <- data.frame(table(EN_over15$FTR)) # Get count into dataframe

EN_over10 <- englandData[ which(englandData$HomeCornersToAwayCorners>=10
                             & englandData$HomeCornersToAwayCorners<15), ]
EN_dfover10 <- data.frame(table(EN_over10$FTR))

EN_over7 <- englandData[ which(englandData$HomeCornersToAwayCorners>=7
                             & englandData$HomeCornersToAwayCorners<10), ]
EN_dfover7 <- data.frame(table(EN_over7$FTR))

EN_over5 <- englandData[ which(englandData$HomeCornersToAwayCorners>=5
                            & englandData$HomeCornersToAwayCorners<7), ]
EN_dfover5 <- data.frame(table(EN_over5$FTR))

EN_over3 <- englandData[ which(englandData$HomeCornersToAwayCorners>=3
                            & englandData$HomeCornersToAwayCorners<5), ]
EN_dfover3 <- data.frame(table(EN_over3$FTR))

EN_over0 <- englandData[ which(englandData$HomeCornersToAwayCorners>=0
                            & englandData$HomeCornersToAwayCorners<3), ]
EN_dfover0 <- data.frame(table(EN_over0$FTR))

EN_minus3 <- englandData[ which(englandData$HomeCornersToAwayCorners>=-3
                            & englandData$HomeCornersToAwayCorners<0), ]
EN_dfminus3 <- data.frame(table(EN_minus3$FTR))

EN_minus5 <- englandData[ which(englandData$HomeCornersToAwayCorners>=-5
                             & englandData$HomeCornersToAwayCorners<(-3)), ]
EN_dfminus5 <- data.frame(table(EN_minus5$FTR))

EN_minus7 <- englandData[ which(englandData$HomeCornersToAwayCorners>=-7
                             & englandData$HomeCornersToAwayCorners<(-5)), ]
EN_dfminus7 <- data.frame(table(EN_minus7$FTR))

EN_minus10 <- englandData[ which(englandData$HomeCornersToAwayCorners>=-10
                             & englandData$HomeCornersToAwayCorners<(-7)), ]
EN_dfminus10 <- data.frame(table(EN_minus10$FTR))

EN_minus16 <- englandData[ which(englandData$HomeCornersToAwayCorners>=-17
                              & englandData$HomeCornersToAwayCorners<(-10)), ]
EN_dfminus16 <- data.frame(table(EN_minus16$FTR))

my.list <- list(over15,dfover15,over10,dfover10,over7,dfover7,over5,dfover5,over3,dfover3,over0,dfover0,
                minus3,dfminus3,minus5,dfminus5,minus7,dfminus7,minus10,dfminus10,minus16,dfminus16)
EN_resultDF <- data.frame()
runInEngland <- function() {
  EN_resultDF <- data.frame()
  EN_resultado = calculateHDA(EN_over15,EN_dfover15)
  EN_resultDF <- rbind(EN_resultDF, EN_resultado)
  EN_resultado = calculateHDA(EN_over10,EN_dfover10)
  EN_resultDF <- rbind(EN_resultDF, EN_resultado)
  EN_resultado = calculateHDA(EN_over7,EN_dfover7)
  EN_resultDF <- rbind(EN_resultDF, EN_resultado)
  EN_resultado = calculateHDA(EN_over5,EN_dfover5)
  EN_resultDF <- rbind(EN_resultDF, EN_resultado)
  EN_resultado = calculateHDA(EN_over3,EN_dfover3)
  EN_resultDF <- rbind(EN_resultDF, EN_resultado)
  EN_resultado = calculateHDA(EN_over0,EN_dfover0)
  EN_resultDF <- rbind(EN_resultDF, EN_resultado)
  EN_resultado = calculateHDA(EN_minus3,EN_dfminus3)
  EN_resultDF <- rbind(EN_resultDF, EN_resultado)
  EN_resultado = calculateHDA(EN_minus5,EN_dfminus5)
  EN_resultDF <- rbind(EN_resultDF, EN_resultado)
  EN_resultado = calculateHDA(EN_minus7,EN_dfminus7)
  EN_resultDF <- rbind(EN_resultDF, EN_resultado)
  EN_resultado = calculateHDA(EN_minus10,EN_dfminus10)
  EN_resultDF <- rbind(EN_resultDF, EN_resultado)
  EN_resultado = calculateHDA(EN_minus16,EN_dfminus16)
  EN_resultDF <- rbind(EN_resultDF, EN_resultado)
  colnames(EN_resultDF) <- c("Home %", "Draw %", "Away%")
  rownames(EN_resultDF) <- c("Home team +15", "+(10-14)", "+(7-9)", "+(5-8)", "+(3-5)", "+(0-3)", "-(0-3)", "-(4-5)", "-(6-7)", "-(8-10)", "-(11-16)")
  EN_resultDF$groups <- rownames(EN_resultDF)
  EN_resultDF$groups <- as.character(EN_resultDF$groups)
  EN_resultDF$groups <- factor(EN_resultDF$groups, levels=unique(EN_resultDF$groups))
  return(EN_resultDF)
}
EN_resultdf <- runInEngland()

colorder <- c("Home team +15", "+(10-14)", "+(7-9)", "+(5-8)", "+(3-5)", "+(0-3)", "-(0-3)", "-(4-5)", "-(6-7)", "-(8-10)", "-(11-16)")
## GRAPH
EN_corner <- ggplot(data = EN_resultdf,aes(x=`Home team's number of corners\n compared to away's`, y=`Winning probability`)) + 
  geom_point(aes(x=groups,y=`Home %`, colour="green"), shape=1, size=2) + 
  geom_point(aes(x=groups,y=`Away%`, colour="red"), shape=1, size=2) +
  geom_point(aes(x=groups,y=`Draw %`, colour="yellow"), shape=1, size=2) +
  #geom_line(aes(x=as.numeric(groups),y=`Home %`, colour = "green")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Home %`), method = "lm", se = FALSE, size = 0.3, colour = "green") +
  #geom_line(aes(x=as.numeric(groups),y=`Away%`, colour="red")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Away%`), method = "lm", se = FALSE, size = 0.3, colour = "red") +
  #geom_line(aes(x=as.numeric(groups),y=`Draw %`, colour="yellow")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Draw %`), method = "lm", se = FALSE, size = 0.3, colour = "yellow") +
  ggtitle("Probability of winning a game \ncompared to number of corners in England") +
  scale_colour_manual(name = "Game winner", values=c("Green", "Red", "yellow"), labels=c("Home", "Away", "Draw")) +
  scale_x_discrete(labels=c("+15", "+10 to +14", "+7 to +9", "+6 to +8", "+3 to +5",
                                            "0 to +3", "-1 to -3", "-4 to -5", "-6 to -7", "-8 to -10", "-11 to -16")) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
## END GRAPH
#End EN

# ES
spainData$HomeCornersToAwayCorners <- spainData$HC - spainData$AC
ES_over15 <- spainData[ which(spainData$HomeCornersToAwayCorners>=15), ]

ES_dfover15 <- data.frame(table(ES_over15$FTR)) # Get count into dataframe

ES_over10 <- spainData[ which(spainData$HomeCornersToAwayCorners>=10
                             & spainData$HomeCornersToAwayCorners<15), ]
ES_dfover10 <- data.frame(table(ES_over10$FTR))

ES_over7 <- spainData[ which(spainData$HomeCornersToAwayCorners>=7
                            & spainData$HomeCornersToAwayCorners<10), ]
ES_dfover7 <- data.frame(table(ES_over7$FTR))

ES_over5 <- spainData[ which(spainData$HomeCornersToAwayCorners>=5
                            & spainData$HomeCornersToAwayCorners<7), ]
ES_dfover5 <- data.frame(table(ES_over5$FTR))

ES_over3 <- spainData[ which(spainData$HomeCornersToAwayCorners>=3
                            & spainData$HomeCornersToAwayCorners<5), ]
ES_dfover3 <- data.frame(table(ES_over3$FTR))

ES_over0 <- spainData[ which(spainData$HomeCornersToAwayCorners>=0
                            & spainData$HomeCornersToAwayCorners<3), ]
ES_dfover0 <- data.frame(table(ES_over0$FTR))

ES_minus3 <- spainData[ which(spainData$HomeCornersToAwayCorners>=-3
                             & spainData$HomeCornersToAwayCorners<0), ]
ES_dfminus3 <- data.frame(table(ES_minus3$FTR))

ES_minus5 <- spainData[ which(spainData$HomeCornersToAwayCorners>=-5
                             & spainData$HomeCornersToAwayCorners<(-3)), ]
ES_dfminus5 <- data.frame(table(ES_minus5$FTR))

ES_minus7 <- spainData[ which(spainData$HomeCornersToAwayCorners>=-7
                             & spainData$HomeCornersToAwayCorners<(-5)), ]
ES_dfminus7 <- data.frame(table(ES_minus7$FTR))

ES_minus10 <- spainData[ which(spainData$HomeCornersToAwayCorners>=-10
                              & spainData$HomeCornersToAwayCorners<(-7)), ]
ES_dfminus10 <- data.frame(table(ES_minus10$FTR))

ES_minus16 <- spainData[ which(spainData$HomeCornersToAwayCorners>=-17
                              & spainData$HomeCornersToAwayCorners<(-10)), ]
ES_dfminus16 <- data.frame(table(ES_minus16$FTR))

#Not used
my.list.es <- list(ES_over15,ES_dfover15,ES_over10,ES_dfover10,ES_over7,ES_dfover7,ES_over5,ES_dfover5,
                   ES_over3,ES_dfover3,ES_over0,ES_dfover0,
                   ES_minus3,ES_dfminus3,ES_minus5,ES_dfminus5,ES_minus7,ES_dfminus7,
                   ES_minus10,ES_dfminus10,ES_minus16,ES_dfminus16)

#evaluate one by one
runInSpain <- function() {
  ES_resultDF <- data.frame()
  ES_resultado = calculateHDA(ES_over15,ES_dfover15)
  ES_resultDF <- rbind(ES_resultDF, ES_resultado)
  ES_resultado = calculateHDA(ES_over10,ES_dfover10)
  ES_resultDF <- rbind(ES_resultDF, ES_resultado)
  ES_resultado = calculateHDA(ES_over7,ES_dfover7)
  ES_resultDF <- rbind(ES_resultDF, ES_resultado)
  ES_resultado = calculateHDA(ES_over5,ES_dfover5)
  ES_resultDF <- rbind(ES_resultDF, ES_resultado)
  ES_resultado = calculateHDA(ES_over3,ES_dfover3)
  ES_resultDF <- rbind(ES_resultDF, ES_resultado)
  ES_resultado = calculateHDA(ES_over0,ES_dfover0)
  ES_resultDF <- rbind(ES_resultDF, ES_resultado)
  ES_resultado = calculateHDA(ES_minus3,ES_dfminus3)
  ES_resultDF <- rbind(ES_resultDF, ES_resultado)
  ES_resultado = calculateHDA(ES_minus5,ES_dfminus5)
  ES_resultDF <- rbind(ES_resultDF, ES_resultado)
  ES_resultado = calculateHDA(ES_minus7,ES_dfminus7)
  ES_resultDF <- rbind(ES_resultDF, ES_resultado)
  ES_resultado = calculateHDA(ES_minus10,ES_dfminus10)
  ES_resultDF <- rbind(ES_resultDF, ES_resultado)
  ES_resultado = calculateHDA(ES_minus16,ES_dfminus16)
  ES_resultDF <- rbind(ES_resultDF, ES_resultado)
  colnames(ES_resultDF) <- c("Home %", "Draw %", "Away%")
  rownames(ES_resultDF) <- c("Home team +15", "+(10-14)", "+(7-9)", "+(5-8)", "+(3-5)", "+(0-3)", "-(0-3)", "-(4-5)", "-(6-7)", "-(8-10)", "-(11-16)")
  ES_resultDF$groups <- rownames(ES_resultDF)
  ES_resultDF$groups <- as.character(ES_resultDF$groups)
  ES_resultDF$groups <- factor(ES_resultDF$groups, levels=unique(ES_resultDF$groups))
  return(ES_resultDF)
}
ES_resultDF <- runInSpain()


## GRAPH
ES_corners <- ggplot(data = ES_resultDF,aes(x=`Home team's number of corners\n compared to away's`, y=`Winning probability`)) + 
  geom_point(aes(x=groups,y=`Home %`, colour="green"), shape=1, size=2) + 
  geom_point(aes(x=groups,y=`Away%`, colour="red"), shape=1, size=2) +
  geom_point(aes(x=groups,y=`Draw %`, colour="yellow"), shape=1, size=2) +
  #geom_line(aes(x=as.numeric(groups),y=`Home %`, colour = "green")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Home %`), method = "lm", se = FALSE, size = 0.3, colour = "green") +
  #geom_line(aes(x=as.numeric(groups),y=`Away%`, colour="red")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Away%`), method = "lm", se = FALSE, size = 0.3, colour = "red") +
  #geom_line(aes(x=as.numeric(groups),y=`Draw %`, colour="yellow")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Draw %`), method = "lm", se = FALSE, size = 0.3, colour = "yellow") +
  ggtitle("Probability of winning a game \ncompared to number of corners in Spain") +
  scale_colour_manual(name = "Game winner", values=c("Green", "Red", "yellow"), labels=c("Home", "Away", "Draw")) +
  scale_x_discrete(labels=c("+15", "+10 to +14", "+7 to +9", "+6 to +8", "+3 to +5",
                                            "0 to +3", "-1 to -3", "-4 to -5", "-6 to -7", "-8 to -10", "-11 to -16")) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
## END GRAPH

# End ES

# IT
italyData$HomeCornersToAwayCorners <- italyData$HC - italyData$AC
IT_over15 <- italyData[ which(italyData$HomeCornersToAwayCorners>=15), ]

IT_dfover15 <- data.frame(table(IT_over15$FTR)) # Get count into dataframe

IT_over10 <- italyData[ which(italyData$HomeCornersToAwayCorners>=10
                              & italyData$HomeCornersToAwayCorners<15), ]
IT_dfover10 <- data.frame(table(IT_over10$FTR))

IT_over7 <- italyData[ which(italyData$HomeCornersToAwayCorners>=7
                             & italyData$HomeCornersToAwayCorners<10), ]
IT_dfover7 <- data.frame(table(IT_over7$FTR))

IT_over5 <- italyData[ which(italyData$HomeCornersToAwayCorners>=5
                             & italyData$HomeCornersToAwayCorners<7), ]
IT_dfover5 <- data.frame(table(IT_over5$FTR))

IT_over3 <- italyData[ which(italyData$HomeCornersToAwayCorners>=3
                             & italyData$HomeCornersToAwayCorners<5), ]
IT_dfover3 <- data.frame(table(IT_over3$FTR))

IT_over0 <- italyData[ which(italyData$HomeCornersToAwayCorners>=0
                             & italyData$HomeCornersToAwayCorners<3), ]
IT_dfover0 <- data.frame(table(IT_over0$FTR))

IT_minus3 <- italyData[ which(italyData$HomeCornersToAwayCorners>=-3
                              & italyData$HomeCornersToAwayCorners<0), ]
IT_dfminus3 <- data.frame(table(IT_minus3$FTR))

IT_minus5 <- italyData[ which(italyData$HomeCornersToAwayCorners>=-5
                              & italyData$HomeCornersToAwayCorners<(-3)), ]
IT_dfminus5 <- data.frame(table(IT_minus5$FTR))

IT_minus7 <- italyData[ which(italyData$HomeCornersToAwayCorners>=-7
                              & italyData$HomeCornersToAwayCorners<(-5)), ]
IT_dfminus7 <- data.frame(table(IT_minus7$FTR))

IT_minus10 <- italyData[ which(italyData$HomeCornersToAwayCorners>=-10
                               & italyData$HomeCornersToAwayCorners<(-7)), ]
IT_dfminus10 <- data.frame(table(IT_minus10$FTR))

IT_minus16 <- italyData[ which(italyData$HomeCornersToAwayCorners>=-17
                               & italyData$HomeCornersToAwayCorners<(-10)), ]
IT_dfminus16 <- data.frame(table(IT_minus16$FTR))

#evaluate one by one
runInItaly <- function() {
  IT_resultDF <- data.frame()
  IT_resultado = calculateHDA(IT_over15,IT_dfover15)
  IT_resultDF <- rbind(IT_resultDF, IT_resultado)
  IT_resultado = calculateHDA(IT_over10,IT_dfover10)
  IT_resultDF <- rbind(IT_resultDF, IT_resultado)
  IT_resultado = calculateHDA(IT_over7,IT_dfover7)
  IT_resultDF <- rbind(IT_resultDF, IT_resultado)
  IT_resultado = calculateHDA(IT_over5,IT_dfover5)
  IT_resultDF <- rbind(IT_resultDF, IT_resultado)
  IT_resultado = calculateHDA(IT_over3,IT_dfover3)
  IT_resultDF <- rbind(IT_resultDF, IT_resultado)
  IT_resultado = calculateHDA(IT_over0,IT_dfover0)
  IT_resultDF <- rbind(IT_resultDF, IT_resultado)
  IT_resultado = calculateHDA(IT_minus3,IT_dfminus3)
  IT_resultDF <- rbind(IT_resultDF, IT_resultado)
  IT_resultado = calculateHDA(IT_minus5,IT_dfminus5)
  IT_resultDF <- rbind(IT_resultDF, IT_resultado)
  IT_resultado = calculateHDA(IT_minus7,IT_dfminus7)
  IT_resultDF <- rbind(IT_resultDF, IT_resultado)
  IT_resultado = calculateHDA(IT_minus10,IT_dfminus10)
  IT_resultDF <- rbind(IT_resultDF, IT_resultado)
  IT_resultado = calculateHDA(IT_minus16,IT_dfminus16)
  IT_resultDF <- rbind(IT_resultDF, IT_resultado)
  colnames(IT_resultDF) <- c("Home %", "Draw %", "Away%")
  rownames(IT_resultDF) <- c("Home team +15", "+(10-14)", "+(7-9)", "+(5-8)", "+(3-5)", "+(0-3)", "-(0-3)", "-(4-5)", "-(6-7)", "-(8-10)", "-(11-16)")
  IT_resultDF$groups <- rownames(IT_resultDF)
  IT_resultDF$groups <- as.character(IT_resultDF$groups)
  IT_resultDF$groups <- factor(IT_resultDF$groups, levels=unique(IT_resultDF$groups))
  return(IT_resultDF)
}
IT_resultDF <- runInItaly()


## GRAPH
IT_corners <- ggplot(data = IT_resultDF,aes(x=`Home team's number of corners\n compared to away's`, y=`Winning probability`)) + 
  geom_point(aes(x=groups,y=`Home %`, colour="green"), shape=1, size=2) + 
  geom_point(aes(x=groups,y=`Away%`, colour="red"), shape=1, size=2) +
  geom_point(aes(x=groups,y=`Draw %`, colour="yellow"), shape=1, size=2) +
  #geom_line(aes(x=as.numeric(groups),y=`Home %`, colour = "green")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Home %`), method = "lm", se = FALSE, size = 0.3, colour = "green") +
  #geom_line(aes(x=as.numeric(groups),y=`Away%`, colour="red")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Away%`), method = "lm", se = FALSE, size = 0.3, colour = "red") +
  #geom_line(aes(x=as.numeric(groups),y=`Draw %`, colour="yellow")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Draw %`), method = "lm", se = FALSE, size = 0.3, colour = "yellow") +
  ggtitle("Probability of winning a game \ncompared to number of corners in Italy") +
  scale_colour_manual(name = "Game winner", values=c("Green", "Red", "yellow"), labels=c("Home", "Away", "Draw")) +
  scale_x_discrete(labels=c("+15", "+10 to +14", "+7 to +9", "+6 to +8", "+3 to +5",
                            "0 to +3", "-1 to -3", "-4 to -5", "-6 to -7", "-8 to -10", "-11 to -16")) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
## END GRAPH

# End IT

# FR
franceData$HomeCornersToAwayCorners <- franceData$HC - franceData$AC
FR_over15 <- franceData[ which(franceData$HomeCornersToAwayCorners>=15), ]

FR_dfover15 <- data.frame(table(FR_over15$FTR)) # Get count into dataframe

FR_over10 <- franceData[ which(franceData$HomeCornersToAwayCorners>=10
                              & franceData$HomeCornersToAwayCorners<15), ]
FR_dfover10 <- data.frame(table(FR_over10$FTR))

FR_over7 <- franceData[ which(franceData$HomeCornersToAwayCorners>=7
                             & franceData$HomeCornersToAwayCorners<10), ]
FR_dfover7 <- data.frame(table(FR_over7$FTR))

FR_over5 <- franceData[ which(franceData$HomeCornersToAwayCorners>=5
                             & franceData$HomeCornersToAwayCorners<7), ]
FR_dfover5 <- data.frame(table(FR_over5$FTR))

FR_over3 <- franceData[ which(franceData$HomeCornersToAwayCorners>=3
                             & franceData$HomeCornersToAwayCorners<5), ]
FR_dfover3 <- data.frame(table(FR_over3$FTR))

FR_over0 <- franceData[ which(franceData$HomeCornersToAwayCorners>=0
                             & franceData$HomeCornersToAwayCorners<3), ]
FR_dfover0 <- data.frame(table(FR_over0$FTR))

FR_minus3 <- franceData[ which(franceData$HomeCornersToAwayCorners>=-3
                              & franceData$HomeCornersToAwayCorners<0), ]
FR_dfminus3 <- data.frame(table(FR_minus3$FTR))

FR_minus5 <- franceData[ which(franceData$HomeCornersToAwayCorners>=-5
                              & franceData$HomeCornersToAwayCorners<(-3)), ]
FR_dfminus5 <- data.frame(table(FR_minus5$FTR))

FR_minus7 <- franceData[ which(franceData$HomeCornersToAwayCorners>=-7
                              & franceData$HomeCornersToAwayCorners<(-5)), ]
FR_dfminus7 <- data.frame(table(FR_minus7$FTR))

FR_minus10 <- franceData[ which(franceData$HomeCornersToAwayCorners>=-10
                               & franceData$HomeCornersToAwayCorners<(-7)), ]
FR_dfminus10 <- data.frame(table(FR_minus10$FTR))

FR_minus16 <- franceData[ which(franceData$HomeCornersToAwayCorners>=-17
                               & franceData$HomeCornersToAwayCorners<(-10)), ]
FR_dfminus16 <- data.frame(table(FR_minus16$FTR))

runInFrance <- function() {
  FR_resultDF <- data.frame()
  FR_resultado = calculateHDA(FR_over15,FR_dfover15)
  FR_resultDF <- rbind(FR_resultDF, FR_resultado)
  FR_resultado = calculateHDA(FR_over10,FR_dfover10)
  FR_resultDF <- rbind(FR_resultDF, FR_resultado)
  FR_resultado = calculateHDA(FR_over7,FR_dfover7)
  FR_resultDF <- rbind(FR_resultDF, FR_resultado)
  FR_resultado = calculateHDA(FR_over5,FR_dfover5)
  FR_resultDF <- rbind(FR_resultDF, FR_resultado)
  FR_resultado = calculateHDA(FR_over3,FR_dfover3)
  FR_resultDF <- rbind(FR_resultDF, FR_resultado)
  FR_resultado = calculateHDA(FR_over0,FR_dfover0)
  FR_resultDF <- rbind(FR_resultDF, FR_resultado)
  FR_resultado = calculateHDA(FR_minus3,FR_dfminus3)
  FR_resultDF <- rbind(FR_resultDF, FR_resultado)
  FR_resultado = calculateHDA(FR_minus5,FR_dfminus5)
  FR_resultDF <- rbind(FR_resultDF, FR_resultado)
  FR_resultado = calculateHDA(FR_minus7,FR_dfminus7)
  FR_resultDF <- rbind(FR_resultDF, FR_resultado)
  FR_resultado = calculateHDA(FR_minus10,FR_dfminus10)
  FR_resultDF <- rbind(FR_resultDF, FR_resultado)
  FR_resultado = calculateHDA(FR_minus16,FR_dfminus16)
  FR_resultDF <- rbind(FR_resultDF, FR_resultado)
  colnames(FR_resultDF) <- c("Home %", "Draw %", "Away%")
  rownames(FR_resultDF) <- c("Home team +15", "+(10-14)", "+(7-9)", "+(5-8)", "+(3-5)", "+(0-3)", "-(0-3)", "-(4-5)", "-(6-7)", "-(8-10)", "-(11-16)")
  FR_resultDF$groups <- rownames(FR_resultDF)
  FR_resultDF$groups <- as.character(FR_resultDF$groups)
  FR_resultDF$groups <- factor(FR_resultDF$groups, levels=unique(FR_resultDF$groups))
  return(FR_resultDF)
}
FR_resultDF <- runInFrance()


## GRAPH
FR_corners <- ggplot(data = FR_resultDF,aes(x=`Home team's number of corners\n compared to away's`, y=`Winning probability`)) + 
  geom_point(aes(x=groups,y=`Home %`, colour="green"), shape=1, size=2) + 
  geom_point(aes(x=groups,y=`Away%`, colour="red"), shape=1, size=2) +
  geom_point(aes(x=groups,y=`Draw %`, colour="yellow"), shape=1, size=2) +
  #geom_line(aes(x=as.numeric(groups),y=`Home %`, colour = "green")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Home %`), method = "lm", se = FALSE, size = 0.3, colour = "green") +
  #geom_line(aes(x=as.numeric(groups),y=`Away%`, colour="red")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Away%`), method = "lm", se = FALSE, size = 0.3, colour = "red") +
  #geom_line(aes(x=as.numeric(groups),y=`Draw %`, colour="yellow")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Draw %`), method = "lm", se = FALSE, size = 0.3, colour = "yellow") +
  ggtitle("Probability of winning a game \ncompared to number of corners in France") +
  scale_colour_manual(name = "Game winner", values=c("Green", "Red", "yellow"), labels=c("Home", "Away", "Draw")) +
  scale_x_discrete(labels=c("+15", "+10 to +14", "+7 to +9", "+6 to +8", "+3 to +5",
                            "0 to +3", "-1 to -3", "-4 to -5", "-6 to -7", "-8 to -10", "-11 to -16")) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
## END GRAPH

# End FR


# DE
germanyData$HomeCornersToAwayCorners <- germanyData$HC - germanyData$AC
DE_over15 <- germanyData[ which(germanyData$HomeCornersToAwayCorners>=15), ]

DE_dfover15 <- data.frame(table(DE_over15$FTR)) # Get count into dataframe

DE_over10 <- germanyData[ which(germanyData$HomeCornersToAwayCorners>=10
                               & germanyData$HomeCornersToAwayCorners<15), ]
DE_dfover10 <- data.frame(table(DE_over10$FTR))

DE_over7 <- germanyData[ which(germanyData$HomeCornersToAwayCorners>=7
                              & germanyData$HomeCornersToAwayCorners<10), ]
DE_dfover7 <- data.frame(table(DE_over7$FTR))

DE_over5 <- germanyData[ which(germanyData$HomeCornersToAwayCorners>=5
                              & germanyData$HomeCornersToAwayCorners<7), ]
DE_dfover5 <- data.frame(table(DE_over5$FTR))

DE_over3 <- germanyData[ which(germanyData$HomeCornersToAwayCorners>=3
                              & germanyData$HomeCornersToAwayCorners<5), ]
DE_dfover3 <- data.frame(table(DE_over3$FTR))

DE_over0 <- germanyData[ which(germanyData$HomeCornersToAwayCorners>=0
                              & germanyData$HomeCornersToAwayCorners<3), ]
DE_dfover0 <- data.frame(table(DE_over0$FTR))

DE_minus3 <- germanyData[ which(germanyData$HomeCornersToAwayCorners>=-3
                               & germanyData$HomeCornersToAwayCorners<0), ]
DE_dfminus3 <- data.frame(table(DE_minus3$FTR))

DE_minus5 <- germanyData[ which(germanyData$HomeCornersToAwayCorners>=-5
                               & germanyData$HomeCornersToAwayCorners<(-3)), ]
DE_dfminus5 <- data.frame(table(DE_minus5$FTR))

DE_minus7 <- germanyData[ which(germanyData$HomeCornersToAwayCorners>=-7
                               & germanyData$HomeCornersToAwayCorners<(-5)), ]
DE_dfminus7 <- data.frame(table(DE_minus7$FTR))

DE_minus10 <- germanyData[ which(germanyData$HomeCornersToAwayCorners>=-10
                                & germanyData$HomeCornersToAwayCorners<(-7)), ]
DE_dfminus10 <- data.frame(table(DE_minus10$FTR))

DE_minus16 <- germanyData[ which(germanyData$HomeCornersToAwayCorners>=-17
                                & germanyData$HomeCornersToAwayCorners<(-10)), ]
DE_dfminus16 <- data.frame(table(DE_minus16$FTR))

runInGermany <- function() {
  DE_resultDF <- data.frame()
  DE_resultado = calculateHDA(DE_over15,DE_dfover15)
  DE_resultDF <- rbind(DE_resultDF, DE_resultado)
  DE_resultado = calculateHDA(DE_over10,DE_dfover10)
  DE_resultDF <- rbind(DE_resultDF, DE_resultado)
  DE_resultado = calculateHDA(DE_over7,DE_dfover7)
  DE_resultDF <- rbind(DE_resultDF, DE_resultado)
  DE_resultado = calculateHDA(DE_over5,DE_dfover5)
  DE_resultDF <- rbind(DE_resultDF, DE_resultado)
  DE_resultado = calculateHDA(DE_over3,DE_dfover3)
  DE_resultDF <- rbind(DE_resultDF, DE_resultado)
  DE_resultado = calculateHDA(DE_over0,DE_dfover0)
  DE_resultDF <- rbind(DE_resultDF, DE_resultado)
  DE_resultado = calculateHDA(DE_minus3,DE_dfminus3)
  DE_resultDF <- rbind(DE_resultDF, DE_resultado)
  DE_resultado = calculateHDA(DE_minus5,DE_dfminus5)
  DE_resultDF <- rbind(DE_resultDF, DE_resultado)
  DE_resultado = calculateHDA(DE_minus7,DE_dfminus7)
  DE_resultDF <- rbind(DE_resultDF, DE_resultado)
  DE_resultado = calculateHDA(DE_minus10,DE_dfminus10)
  DE_resultDF <- rbind(DE_resultDF, DE_resultado)
  DE_resultado = calculateHDA(DE_minus16,DE_dfminus16)
  DE_resultDF <- rbind(DE_resultDF, DE_resultado)
  colnames(DE_resultDF) <- c("Home %", "Draw %", "Away%")
  rownames(DE_resultDF) <- c("Home team +15", "+(10-14)", "+(7-9)", "+(5-8)", "+(3-5)", "+(0-3)", "-(0-3)", "-(4-5)", "-(6-7)", "-(8-10)", "-(11-16)")
  DE_resultDF$groups <- rownames(DE_resultDF)
  DE_resultDF$groups <- as.character(DE_resultDF$groups)
  DE_resultDF$groups <- factor(DE_resultDF$groups, levels=unique(DE_resultDF$groups))
  return(DE_resultDF)
}
DE_resultDF <- runInGermany()


## GRAPH
DE_corners <- ggplot(data = DE_resultDF,aes(x=`Home team's number of corners\n compared to away's`, y=`Winning probability`)) + 
  geom_point(aes(x=groups,y=`Home %`, colour="green"), shape=1, size=2) + 
  geom_point(aes(x=groups,y=`Away%`, colour="red"), shape=1, size=2) +
  geom_point(aes(x=groups,y=`Draw %`, colour="yellow"), shape=1, size=2) +
  #geom_line(aes(x=as.numeric(groups),y=`Home %`, colour = "green")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Home %`), method = "lm", se = FALSE, size = 0.3, colour = "green") +
  #geom_line(aes(x=as.numeric(groups),y=`Away%`, colour="red")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Away%`), method = "lm", se = FALSE, size = 0.3, colour = "red") +
  #geom_line(aes(x=as.numeric(groups),y=`Draw %`, colour="yellow")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Draw %`), method = "lm", se = FALSE, size = 0.3, colour = "yellow") +
  ggtitle("Probability of winning a game \ncompared to number of corners in Germany") +
  scale_colour_manual(name = "Game winner", values=c("Green", "Red", "yellow"), labels=c("Home", "Away", "Draw")) +
  scale_x_discrete(labels=c("+15", "+10 to +14", "+7 to +9", "+6 to +8", "+3 to +5",
                            "0 to +3", "-1 to -3", "-4 to -5", "-6 to -7", "-8 to -10", "-11 to -16")) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
## END GRAPH

# End DE



## END OF CORNERS

