### Library Includes ###
library(class)
library(ggplot2)
library(plyr)
library(gtools)
### Project ###
# 9394 - 1516
#HomeTeam,AwayTeam,FTR,FTHG,FTAG

##Deutschland
nation = "D"
rm(germanyData)
for (i in 93:115) {
  year1 = toString(i)
  year2 = toString(i+1)
  if (nchar(year1) > 2) {
    year1 = substr(year1,2,3)
  }
  if (nchar(year2) > 2) {
    year2 = substr(year2,2,3)
  }
  season = paste(year1,year2,sep="")
  fileName = paste("Data/",nation,season,".csv",sep="")
  data = read.csv(fileName,na.strings = c("","NA"))
  # remove empty rows
  data = data[apply(data, 1, function(y) !all(is.na(y))),]
  # remove empty columns
  data <- data[,colSums(is.na(data))<nrow(data)]
  # add season as column
  data$season = season
  # add season to existing data
  if (exists("germanyData")) germanyData = smartbind(germanyData, data)
  else germanyData = data
}
germanyData = subset(germanyData, select = c(Div,HomeTeam,AwayTeam,FTHG,FTAG,FTR,season,HTHG,HTAG,HTR,Attendance,Referee,HS,AS,HST,AST,HY,AY,HR,AR,HC,AC,HF,AF,HO,AO))

##England
nation = "E"
rm(englandData)
for (i in 93:115) {
  year1 = toString(i)
  year2 = toString(i+1)
  if (nchar(year1) > 2) {
    year1 = substr(year1,2,3)
  }
  if (nchar(year2) > 2) {
    year2 = substr(year2,2,3)
  }
  season = paste(year1,year2,sep="")
  fileName = paste("Data/",nation,season,".csv",sep="")
  data = read.csv(fileName,na.strings = c("","NA"))
  # remove empty rows
  data = data[apply(data, 1, function(y) !all(is.na(y))),]
  # remove empty columns
  data <- data[,colSums(is.na(data))<nrow(data)]
  # add season as column
  data$season = season
  # add season to existing data
  if (exists("englandData")) englandData = smartbind(englandData, data)
  else englandData = data
}
englandData = subset(englandData, select = c(Div,HomeTeam,AwayTeam,FTHG,FTAG,FTR,season,HTHG,HTAG,HTR,Attendance,Referee,HS,AS,HST,AST,HY,AY,HR,AR,HC,AC,HF,AF,HO,AO))

##Italy
nation = "I"
rm(italyData)
for (i in 93:115) {
  year1 = toString(i)
  year2 = toString(i+1)
  if (nchar(year1) > 2) {
    year1 = substr(year1,2,3)
  }
  if (nchar(year2) > 2) {
    year2 = substr(year2,2,3)
  }
  season = paste(year1,year2,sep="")
  fileName = paste("Data/",nation,season,".csv",sep="")
  data = read.csv(fileName,na.strings = c("","NA"))
  # remove empty rows
  data = data[apply(data, 1, function(y) !all(is.na(y))),]
  # remove empty columns
  data <- data[,colSums(is.na(data))<nrow(data)]
  # add season as column
  data$season = season
  # add season to existing data
  if (exists("italyData")) italyData = smartbind(italyData, data)
  else italyData = data
}
italyData = subset(italyData, select = c(Div,HomeTeam,AwayTeam,FTHG,FTAG,FTR,season,HTHG,HTAG,HTR,Referee,HS,AS,HST,AST,HY,AY,HR,AR,HC,AC,HF,AF))


##Portugal
nation = "P"
rm(portugalData)
for (i in 94:115) {
  year1 = toString(i)
  year2 = toString(i+1)
  if (nchar(year1) > 2) {
    year1 = substr(year1,2,3)
  }
  if (nchar(year2) > 2) {
    year2 = substr(year2,2,3)
  }
  season = paste(year1,year2,sep="")
  fileName = paste("Data/",nation,season,".csv",sep="")
  data = read.csv(fileName,na.strings = c("","NA"))
  # remove empty rows
  data = data[apply(data, 1, function(y) !all(is.na(y))),]
  # remove empty columns
  data <- data[,colSums(is.na(data))<nrow(data)]
  # add season as column
  data$season = season
  # add season to existing data
  if (exists("portugalData")) portugalData = smartbind(portugalData, data)
  else portugalData = data
}
portugalData = subset(portugalData, select = c(Div,HomeTeam,AwayTeam,FTHG,FTAG,FTR,season,HTHG,HTAG,HTR))

##Spain
nation = "SP"
rm(spainData)
for (i in 93:115) {
  year1 = toString(i)
  year2 = toString(i+1)
  if (nchar(year1) > 2) {
    year1 = substr(year1,2,3)
  }
  if (nchar(year2) > 2) {
    year2 = substr(year2,2,3)
  }
  season = paste(year1,year2,sep="")
  fileName = paste("Data/",nation,season,".csv",sep="")
  data = read.csv(fileName,na.strings = c("","NA"))
  # remove empty rows
  data = data[apply(data, 1, function(y) !all(is.na(y))),]
  # remove empty columns
  data <- data[,colSums(is.na(data))<nrow(data)]
  # add season as column
  data$season = season
  # add season to existing data
  if (exists("spainData")) spainData = smartbind(spainData, data)
  else spainData = data
}
spainData = subset(spainData, select = c(Div,HomeTeam,AwayTeam,FTHG,FTAG,FTR,season,HTHG,HTAG,HTR,HS,AS,HST,AST,HY,AY,HR,AR,HC,AC,HF,AF))

##Turkey
nation = "T"
rm(turkeyData)
for (i in 94:115) {
  year1 = toString(i)
  year2 = toString(i+1)
  if (nchar(year1) > 2) {
    year1 = substr(year1,2,3)
  }
  if (nchar(year2) > 2) {
    year2 = substr(year2,2,3)
  }
  season = paste(year1,year2,sep="")
  fileName = paste("Data/",nation,season,".csv",sep="")
  data = read.csv(fileName,na.strings = c("","NA"))
  # remove empty rows
  data = data[apply(data, 1, function(y) !all(is.na(y))),]
  # remove empty columns
  data <- data[,colSums(is.na(data))<nrow(data)]
  # add season as column
  data$season = season
  # add season to existing data
  if (exists("turkeyData")) turkeyData = smartbind(turkeyData, data)
  else turkeyData = data
}
turkeyData = subset(turkeyData, select = c(Div,HomeTeam,AwayTeam,FTHG,FTAG,FTR,season,HTHG,HTAG,HTR))

##France
nation = "F"
rm(franceData)
for (i in 93:115) {
  year1 = toString(i)
  year2 = toString(i+1)
  if (nchar(year1) > 2) {
    year1 = substr(year1,2,3)
  }
  if (nchar(year2) > 2) {
    year2 = substr(year2,2,3)
  }
  season = paste(year1,year2,sep="")
  fileName = paste("Data/",nation,season,".csv",sep="")
  data = read.csv(fileName,na.strings = c("","NA"))
  # remove empty rows
  data = data[apply(data, 1, function(y) !all(is.na(y))),]
  # remove empty columns
  data <- data[,colSums(is.na(data))<nrow(data)]
  # add season as column
  data$season = season
  # add season to existing data
  if (exists("franceData")) franceData = smartbind(franceData, data)
  else franceData = data
}
franceData = subset(franceData, select = c(Div,HomeTeam,AwayTeam,FTHG,FTAG,FTR,season,HTHG,HTAG,HTR,HS,AS,HST,AST,HY,AY,HR,AR,HC,AC,HF,AF))

##Netherlands
nation = "N"
rm(netherlandsData)
for (i in 93:115) {
  year1 = toString(i)
  year2 = toString(i+1)
  if (nchar(year1) > 2) {
    year1 = substr(year1,2,3)
  }
  if (nchar(year2) > 2) {
    year2 = substr(year2,2,3)
  }
  season = paste(year1,year2,sep="")
  fileName = paste("Data/",nation,season,".csv",sep="")
  data = read.csv(fileName,na.strings = c("","NA"))
  # remove empty rows
  data = data[apply(data, 1, function(y) !all(is.na(y))),]
  # remove empty columns
  data <- data[,colSums(is.na(data))<nrow(data)]
  # add season as column
  data$season = season
  # add season to existing data
  if (exists("netherlandsData")) netherlandsData = smartbind(netherlandsData, data)
  else netherlandsData = data
}
netherlandsData = subset(netherlandsData, select = c(Div,HomeTeam,AwayTeam,FTHG,FTAG,FTR,season,HTHG,HTAG,HTR))


allLeaguesData = smartbind(englandData,franceData)
allLeaguesData = smartbind(allLeaguesData,germanyData)
allLeaguesData = smartbind(allLeaguesData,italyData)
allLeaguesData = smartbind(allLeaguesData,netherlandsData)
allLeaguesData = smartbind(allLeaguesData,portugalData)
allLeaguesData = smartbind(allLeaguesData,spainData)
allLeaguesData = smartbind(allLeaguesData,turkeyData)
allLeaguesData$goalsPerGame = allLeaguesData$FTHG + allLeaguesData$FTAG
allLeaguesData$season = factor(allLeaguesData$season)

# Average goals per season for all the countries across all seasons
seasonStatistics = aggregate(allLeaguesData[,27], list(div=allLeaguesData$Div,season=allLeaguesData$season), mean)
seasonStatistics$season = factor(seasonStatistics$season,levels(seasonStatistics$season)[c(17:23,1:16)])
ggplot(data=seasonStatistics, aes(x=season, y=x, group=div, colour=div)) +
  geom_line() +
  geom_point() +
  xlab("Season") + ylab("Average Goals per Game") +
  ggtitle("Comparison of average goals per Game in different Leagues")+
  scale_colour_discrete(name = "Leagues",
                         breaks=c("E0", "F1", "D1", "I1", "N1", "P1", "SP1", "T1"),
                         labels=c("Premier League", "Ligue 1", "Bundesliga", "Serie A", "Eredivisie", "Liga NOS", "Primera Divisi??n", "S??per Lig")) +
  theme_bw()


# Most/Least scored goals ever in one season
homeTeamSeasonStatistics = aggregate(allLeaguesData[,4], list(team=allLeaguesData$HomeTeam,season=allLeaguesData$season), mean)
awayTeamSeasonStatistics = aggregate(allLeaguesData[,5], list(team=allLeaguesData$AwayTeam,season=allLeaguesData$season), mean)
teamSeasonStatistics = merge(homeTeamSeasonStatistics,awayTeamSeasonStatistics,by=c("team","season"))
teamSeasonStatistics$goals = (teamSeasonStatistics$x.x + teamSeasonStatistics$x.y) / 2
teamSeasonStatistics = teamSeasonStatistics[order(teamSeasonStatistics$goals),]
head(teamSeasonStatistics)
tail(teamSeasonStatistics)

# Most scored goals ever in one game
tail(allLeaguesData[order(allLeaguesData$goalsPerGame),])


### old stuff for homework ###
data = read.csv("bundesliga_data14-15.csv")
home_goals = table(data$FTHG)
away_goals = table(data$FTAG)
game_goals = table(data$FTHG + data$FTAG)
plot(home_goals,xlab="Goals",main="Goals from Home Team per Game")
plot(away_goals,xlab="Goals",main="Goals from Away Team per Game")
plot(game_goals,xlab="Goals",main="Goals per Game")

yellow_cards_home = as.data.frame(data$HY)
yellow_cards_home = rename(yellow_cards_home,c("data$HY"="card_amount"))
yellow_cards_home$class = "ht"
yellow_cards_away = as.data.frame(data$AY)
yellow_cards_away = rename(yellow_cards_away,c("data$AY"="card_amount"))
yellow_cards_away$class = "at"
yellow_cards = rbind(yellow_cards_home,yellow_cards_away)
means <- aggregate(card_amount ~  class, yellow_cards, mean)

ggplot(yellow_cards, aes(y=card_amount,x=class,fill=class)) + geom_boxplot()+
  stat_summary(fun.y=mean, colour="darkred", geom="point", 
               shape=18, size=3,show.legend = FALSE) + 
  geom_text(data = means, aes(label = card_amount, y = card_amount + 0.15))





