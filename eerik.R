### Eerik's code for R project ###

### First we wan't to get all the data that have any information about cards ###

englandGamesWithCards <- englandData[!(is.na(englandData$HY)) & !(is.na(englandData$AY)) & !(is.na(englandData$HR)) & !(is.na(englandData$AR)),]
franceGamesWithCards <- franceData[!(is.na(franceData$HY)) & !(is.na(franceData$AY)) & !(is.na(franceData$HR)) & !(is.na(franceData$AR)),]
germanyGamesWithCards <- germanyData[!(is.na(germanyData$HY)) & !(is.na(germanyData$AY)) & !(is.na(germanyData$HR)) & !(is.na(germanyData$AR)),]
italyGamesWithCards <- italyData[!(is.na(italyData$HY)) & !(is.na(italyData$AY)) & !(is.na(italyData$HR)) & !(is.na(italyData$AR)),]
netherlandsGamesWithCards <- netherlandsData[!(is.na(netherlandsData$HY)) & !(is.na(netherlandsData$AY)) & !(is.na(netherlandsData$HR)) & !(is.na(netherlandsData$AR)),]
portugalGamesWithCards <- portugalData[!(is.na(portugalData$HY)) & !(is.na(portugalData$AY)) & !(is.na(portugalData$HR)) & !(is.na(portugalData$AR)),]
spainGamesWithCards <- spainData[!(is.na(spainData$HY)) & !(is.na(spainData$AY)) & !(is.na(spainData$HR)) & !(is.na(spainData$AR)),]
turkeyGamesWithCards <- turkeyData[!(is.na(turkeyData$HY)) & !(is.na(turkeyData$AY)) & !(is.na(turkeyData$HR)) & !(is.na(turkeyData$AR)),]

### In Netherlands, Portugal & Turkey - we don't have information about cards! ###

### England's overall cards ###

englandOverallHomeYellow = sum(englandGamesWithCards$HY)
englandOverallHomeRed = sum(englandGamesWithCards$HR)
englandOverallAwayYellow <- sum(englandGamesWithCards$AY)
englandOverallAwayRed <- sum(englandGamesWithCards$AR)

englandOverallCards = englandOverallAwayRed + englandOverallAwayYellow + englandOverallHomeRed + englandOverallHomeYellow

### England's average cards per game ###

englandOverallCardsPerGame = englandOverallCards / nrow(englandGamesWithCards)
englandOverallYellowsPerGame = (englandOverallHomeYellow + englandOverallAwayYellow) / nrow(englandGamesWithCards)
englandOverallRedsPerGame = (englandOverallHomeRed + englandOverallAwayRed) / nrow(englandGamesWithCards)

### France's overall cards ###

franceOverallHomeYellow = sum(franceGamesWithCards$HY)
franceOverallHomeRed = sum(franceGamesWithCards$HR)
franceOverallAwayYellow <- sum(franceGamesWithCards$AY)
franceOverallAwayRed <- sum(franceGamesWithCards$AR)

franceOverallCards = franceOverallAwayRed + franceOverallAwayYellow + franceOverallHomeRed + franceOverallHomeYellow

### France's average cards per game ###

franceOverallCardsPerGame = franceOverallCards / nrow(franceGamesWithCards)
franceOverallYellowsPerGame = (franceOverallHomeYellow + franceOverallAwayYellow) / nrow(franceGamesWithCards)
franceOverallRedsPerGame = (franceOverallHomeRed + franceOverallAwayRed) / nrow(franceGamesWithCards)

### Germany's overall cards ###

germanyOverallHomeYellow = sum(germanyGamesWithCards$HY)
germanyOverallHomeRed = sum(germanyGamesWithCards$HR)
germanyOverallAwayYellow <- sum(germanyGamesWithCards$AY)
germanyOverallAwayRed <- sum(germanyGamesWithCards$AR)

germanyOverallCards = germanyOverallAwayRed + germanyOverallAwayYellow + germanyOverallHomeRed + germanyOverallHomeYellow

### Germany's average cards per game ###

germanyOverallCardsPerGame = germanyOverallCards / nrow(germanyGamesWithCards)
germanyOverallYellowsPerGame = (germanyOverallHomeYellow + germanyOverallAwayYellow) / nrow(germanyGamesWithCards)
germanyOverallRedsPerGame = (germanyOverallHomeRed + germanyOverallAwayRed) / nrow(germanyGamesWithCards)


### Italy's overall cards ###

italyOverallHomeYellow = sum(italyGamesWithCards$HY)
italyOverallHomeRed = sum(italyGamesWithCards$HR)
italyOverallAwayYellow <- sum(italyGamesWithCards$AY)
italyOverallAwayRed <- sum(italyGamesWithCards$AR)

italyOverallCards = italyOverallAwayRed + italyOverallAwayYellow + italyOverallHomeRed + italyOverallHomeYellow

### Italy's average cards per game ###

italyOverallCardsPerGame = italyOverallCards / nrow(italyGamesWithCards)
italyOverallYellowsPerGame = (italyOverallHomeYellow + italyOverallAwayYellow) / nrow(italyGamesWithCards)
italyOverallRedsPerGame = (italyOverallHomeRed + italyOverallAwayRed) / nrow(italyGamesWithCards)

### Spain's overall cards ###

spainOverallHomeYellow = sum(spainGamesWithCards$HY)
spainOverallHomeRed = sum(spainGamesWithCards$HR)
spainOverallAwayYellow <- sum(spainGamesWithCards$AY)
spainOverallAwayRed <- sum(spainGamesWithCards$AR)

spainOverallCards = spainOverallAwayRed + spainOverallAwayYellow + spainOverallHomeRed + spainOverallHomeYellow

### Spain's average cards per game ###

spainOverallCardsPerGame = spainOverallCards / nrow(spainGamesWithCards)
spainOverallYellowsPerGame = (spainOverallHomeYellow + spainOverallAwayYellow) / nrow(spainGamesWithCards)
spainOverallRedsPerGame = (spainOverallHomeRed + spainOverallAwayRed) / nrow(spainGamesWithCards)

### Graphics of the 

to_plot <- data.frame(Yellows=c(spainOverallYellowsPerGame,italyOverallYellowsPerGame,germanyOverallYellowsPerGame,
                                franceOverallYellowsPerGame, englandOverallYellowsPerGame),
                      Reds=c(spainOverallRedsPerGame,italyOverallRedsPerGame,germanyOverallRedsPerGame,
                             franceOverallRedsPerGame, englandOverallRedsPerGame),
                      Countries=c("Spain","Italy","Germany","France","England"))

library(ggplot2)

ggplot(data = to_plot,aes(x=Countries, y=Cards)) + 
  geom_point(aes(x=Countries,y=Reds, colour="red"), shape=15, size=10, fill="red") + 
  geom_point(aes(x=Countries,y=Yellows, colour="yellow"), shape=15, size=10, fill="yellow") +
  ggtitle("Number of cards per game (on average) per country") +
   guides(fill = guide_legend(
     title.theme = element_text(size=15, face="italic", colour = "red", angle = 45))) +
  theme_bw() + 
  scale_colour_manual(name = "The colors of \nthe cards \n", values=c("Red", "Yellow"), labels=c("Red card", "Yellow card"))
#Type muuta p-ks









### Other stuff ###








countries <- array(suppressWarnings(c("England","France", "Germany","Italy", "Spain")))
yellows


plot(to_plot$Yellows ,type = "o", main="Cards per game (on average) per countries",
     xaxt = "n", frame = FALSE, col = "yellow", ylim=c(0, 3), ylab="Cards", xlab = "Country")
lines(to_plot$Reds,col="red", type="o")
legend("topright", inset=.05,
       c("Yellow cards","Red cards"),fill=c("yellow", "red"), horiz=FALSE, bty = "n")
axis(side=1, at=to_plot$Countries,labels=countries)



### Now let's find out the most aggressive team ###

## England ## 

homeYellow <- aggregate(HY~HomeTeam, data=englandGamesWithCards, FUN=sum)
homeRed <- aggregate(HR~HomeTeam, data=englandGamesWithCards, FUN=sum)
awayYellow <- aggregate(AY~AwayTeam, data=englandGamesWithCards, FUN=sum)
awayRed <- aggregate(AR~AwayTeam, data=englandGamesWithCards, FUN=sum)

englandHomeCards <- merge(homeYellow, homeRed)
englandAwayCards <- merge(awayYellow, awayRed)

englandHomeCards <- rename(englandHomeCards, c("HomeTeam"="Team", "HY"="Yellow", "HR"="Red"))
englandAwayCards <- rename(englandAwayCards, c("AwayTeam"="Team", "AY"="Yellow", "AR"="Red"))

englandOverallCardsByTeam <- merge(englandHomeCards, englandAwayCards, by=c("Team"))
allCards <- c("AllCards")
englandOverallCardsByTeam[,allCards] <- englandOverallCardsByTeam$Yellow.x + englandOverallCardsByTeam$Yellow.y + englandOverallCardsByTeam$Red.y + englandOverallCardsByTeam$Red.x

### Games played ###

homeClubGamesPlayed <- aggregate(AwayTeam ~ HomeTeam, data=englandGamesWithCards, FUN = length)
awayClubGamesPlayed <- aggregate(HomeTeam ~ AwayTeam, data=englandGamesWithCards, FUN = length)

homeClubGamesPlayed <- rename(homeClubGamesPlayed, c("HomeTeam"="Team", "AwayTeam"="Games"))
awayClubGamesPlayed <- rename(awayClubGamesPlayed, c("AwayTeam"="Team", "HomeTeam"="Games"))

allClubsGamesPlayed <- merge(homeClubGamesPlayed, awayClubGamesPlayed, by=c("Team"))

englandOverallCardsByTeam <- merge(englandOverallCardsByTeam, allClubsGamesPlayed, by=c("Team"))

yellowsPerGame <- c("YellowsPerGame")
redsPerGame <- c("RedsPerGame")

englandOverallCardsByTeam[,yellowsPerGame] <- (englandOverallCardsByTeam$Yellow.x + englandOverallCardsByTeam$Yellow.y)/(englandOverallCardsByTeam$Games.x+englandOverallCardsByTeam$Games.y) 
englandOverallCardsByTeam[,redsPerGame] <- (englandOverallCardsByTeam$Red.x + englandOverallCardsByTeam$Red.y)/(englandOverallCardsByTeam$Games.x+englandOverallCardsByTeam$Games.y) 

### Yellows and reds per game on average in England ###

englandMeanYellowsPerGame = mean(englandOverallCardsByTeam$YellowsPerGame)
englandMeanRedsPerGame = mean(englandOverallCardsByTeam$RedsPerGame)

englandOverallCardsByTeam




