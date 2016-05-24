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
# EN
englandData$HomeCornersToAwayCorners <- englandData$HC - englandData$AC
over15 <- englandData[ which(englandData$HomeCornersToAwayCorners>=15), ]

table(over15$FTR) # Get count into table
dfover15 <- data.frame(table(over15$FTR)) # Get count into dataframe

over10 <- englandData[ which(englandData$HomeCornersToAwayCorners>=10
                             & englandData$HomeCornersToAwayCorners<15), ]
dfover10 <- data.frame(table(over10$FTR))

over7 <- englandData[ which(englandData$HomeCornersToAwayCorners>=7
                             & englandData$HomeCornersToAwayCorners<10), ]
dfover7 <- data.frame(table(over7$FTR))

over5 <- englandData[ which(englandData$HomeCornersToAwayCorners>=5
                            & englandData$HomeCornersToAwayCorners<7), ]
dfover5 <- data.frame(table(over5$FTR))

over3 <- englandData[ which(englandData$HomeCornersToAwayCorners>=3
                            & englandData$HomeCornersToAwayCorners<5), ]
dfover3 <- data.frame(table(over3$FTR))

over0 <- englandData[ which(englandData$HomeCornersToAwayCorners>=0
                            & englandData$HomeCornersToAwayCorners<3), ]
dfover0 <- data.frame(table(over0$FTR))

minus3 <- englandData[ which(englandData$HomeCornersToAwayCorners>=-3
                            & englandData$HomeCornersToAwayCorners<0), ]
dfminus3 <- data.frame(table(minus3$FTR))

minus5 <- englandData[ which(englandData$HomeCornersToAwayCorners>=-5
                             & englandData$HomeCornersToAwayCorners<(-3)), ]
dfminus5 <- data.frame(table(minus5$FTR))

minus7 <- englandData[ which(englandData$HomeCornersToAwayCorners>=-7
                             & englandData$HomeCornersToAwayCorners<(-5)), ]
dfminus7 <- data.frame(table(minus7$FTR))

minus10 <- englandData[ which(englandData$HomeCornersToAwayCorners>=-10
                             & englandData$HomeCornersToAwayCorners<(-7)), ]
dfminus10 <- data.frame(table(minus10$FTR))

minus16 <- englandData[ which(englandData$HomeCornersToAwayCorners>=-17
                              & englandData$HomeCornersToAwayCorners<(-10)), ]
dfminus16 <- data.frame(table(minus16$FTR))

calculateHDA <- function(all, aggregated) {
  rows = nrow(all)
  homePercentage = aggregated$Freq[aggregated$Var1=='H'] / rows
  drawPercentage = aggregated$Freq[aggregated$Var1=='D'] / rows
  awayPercentage = aggregated$Freq[aggregated$Var1=='A'] / rows
  result <- c(homePercentage,drawPercentage,awayPercentage)
  return(result)
}
my.list <- list(over15,dfover15,over10,dfover10,over7,dfover7,over5,dfover5,over3,dfover3,over0,dfover0,
                minus3,dfminus3,minus5,dfminus5,minus7,dfminus7,minus10,dfminus10,minus16,dfminus16)
resultado = calculateHDA(over15,dfover15)
resultDF <- data.frame()
colnames(resultDF) <- c("Home %", "Draw %", "Away%")
rownames(resultDF) <- c("Home team +15", "+(10-14)", "+(7-9)", "+(5-8)", "+(3-5)", "+(0-3)", "-(0-3)", "-(4-5)", "-(6-7)", "-(8-10)", "-(11-16)")
resultDF <- rbind(resultDF, resultado)
resultDF
resultDF$groups <- rownames(resultDF)
resultDF$groups <- as.character(resultDF$groups)
resultDF$groups <- factor(resultDF$groups, levels=unique(resultDF$groups))
library(ggplot2)
colorder <- c("Home team +15", "+(10-14)", "+(7-9)", "+(5-8)", "+(3-5)", "+(0-3)", "-(0-3)", "-(4-5)", "-(6-7)", "-(8-10)", "-(11-16)")
## GRAPH
ggplot(data = resultDF,aes(x=`Home team's number of corners\n compared to away's`, y=`Winning probability`)) + 
  geom_point(aes(x=groups,y=`Home %`, colour="green"), shape=1, size=2) + 
  geom_point(aes(x=groups,y=`Away%`, colour="red"), shape=1, size=2) +
  geom_point(aes(x=groups,y=`Draw %`, colour="yellow"), shape=1, size=2) +
  geom_line(aes(x=as.numeric(groups),y=`Home %`, colour = "green")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Home %`), method = "lm", se = FALSE, size = 0.3, colour = "green") +
  geom_line(aes(x=as.numeric(groups),y=`Away%`, colour="red")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Away%`), method = "lm", se = FALSE, size = 0.3, colour = "red") +
  geom_line(aes(x=as.numeric(groups),y=`Draw %`, colour="yellow")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Draw %`), method = "lm", se = FALSE, size = 0.3, colour = "yellow") +
  ggtitle("Probability of winning a game \ncompared to number of corners in England") +
  scale_colour_manual(name = "Game winner", values=c("Green", "Red", "yellow"), labels=c("Home", "Away", "Draw")) +
  scale_x_discrete(limits=colorder,labels=c("+15", "+10 to +14", "+7 to +9", "+6 to +8", "+3 to +5",
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
ggplot(data = ES_resultDF,aes(x=`Home team's number of corners\n compared to away's`, y=`Winning probability`)) + 
  geom_point(aes(x=groups,y=`Home %`, colour="green"), shape=1, size=2) + 
  geom_point(aes(x=groups,y=`Away%`, colour="red"), shape=1, size=2) +
  geom_point(aes(x=groups,y=`Draw %`, colour="yellow"), shape=1, size=2) +
  geom_line(aes(x=as.numeric(groups),y=`Home %`, colour = "green")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Home %`), method = "lm", se = FALSE, size = 0.3, colour = "green") +
  geom_line(aes(x=as.numeric(groups),y=`Away%`, colour="red")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Away%`), method = "lm", se = FALSE, size = 0.3, colour = "red") +
  geom_line(aes(x=as.numeric(groups),y=`Draw %`, colour="yellow")) +
  geom_smooth(aes(x=as.numeric(groups),y=`Draw %`), method = "lm", se = FALSE, size = 0.3, colour = "yellow") +
  ggtitle("Probability of winning a game \ncompared to number of corners in Spain") +
  scale_colour_manual(name = "Game winner", values=c("Green", "Red", "yellow"), labels=c("Home", "Away", "Draw")) +
  scale_x_discrete(limits=colorder,labels=c("+15", "+10 to +14", "+7 to +9", "+6 to +8", "+3 to +5",
                                            "0 to +3", "-1 to -3", "-4 to -5", "-6 to -7", "-8 to -10", "-11 to -16")) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
## END GRAPH



# End ES

## END OF CORNERS

