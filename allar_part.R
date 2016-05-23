## What's the probability to win away/home if you lead at the half time (general), percentage -
# if you're winning -> that you lost also, (Home team vs Away team)

#At first home leading at half time winning percentage aka probabilty.
library("ggplot2")
#So a subset of games where home team was leading and won for each league.
nrow(englandData)
#Lets extract data, where also Halftime results are avilable
englad_useful_games<-englandData[!(is.na(englandData$HTR)) & !(is.na(englandData$FTR)),]
france_useful_games<-franceData[!(is.na(franceData$HTR)) & !(is.na(franceData$FTR)),]
germany_useful_games<-germanyData[!(is.na(germanyData$HTR)) & !(is.na(germanyData$FTR)),]
italy_useful_games<-italyData[!(is.na(italyData$HTR)) & !(is.na(italyData$FTR)),]
netherlands_useful_games<-netherlandsData[!(is.na(netherlandsData$HTR)) & !(is.na(netherlandsData$FTR)),]
portugal_useful_games<-portugalData[!(is.na(portugalData$HTR)) & !(is.na(portugalData$FTR)),]
spain_useful_games<-spainData[!(is.na(spainData$HTR)) & !(is.na(spainData$FTR)),]
turkey_useful_games<-turkeyData[!(is.na(turkeyData$HTR)) & !(is.na(turkeyData$FTR)),]
#
englad_total_games<-nrow(englad_useful_games)
france_total_games<-nrow(france_useful_games)
germany_total_games<-nrow(germany_useful_games)
italy_total_games<-nrow(italy_useful_games)
netherlands_total_games<-nrow(netherlands_useful_games)
portugal_total_games<-nrow(portugal_useful_games)
spain_total_games<-nrow(spain_useful_games)
turkey_total_games<-nrow(turkey_useful_games)
#Now home time halftime leading and winning the game for home teams
england_home_wins<-nrow(englad_useful_games[englad_useful_games$HTR=='H' & englad_useful_games$FTR=='H',])
france_home_wins<-nrow(france_useful_games[france_useful_games$HTR=='H' & france_useful_games$FTR=='H',])
germany_home_wins<-nrow(germany_useful_games[germany_useful_games$HTR=='H' & germany_useful_games$FTR=='H',])
italy_home_wins<-nrow(italy_useful_games[italy_useful_games$HTR=='H' & italy_useful_games$FTR=='H',])
netherlands_home_wins<-nrow(netherlands_useful_games[netherlands_useful_games$HTR=='H' & netherlands_useful_games$FTR=='H',])
portugal_home_wins<-nrow(portugal_useful_games[portugal_useful_games$HTR=='H' & portugal_useful_games$FTR=='H',])
spain_home_wins<-nrow(spain_useful_games[spain_useful_games$HTR=='H' & spain_useful_games$FTR=='H',])
turkey_home_wins<-nrow(turkey_useful_games[turkey_useful_games$HTR=='H' & turkey_useful_games$FTR=='H',])
#Now lets see the % for home team leading halftime and winning the game
englad_home_win_per <- england_home_wins / englad_total_games
france_home_win_per <- france_home_wins / france_total_games
germany_home_win_per <- germany_home_wins / germany_total_games
italy_home_win_per <- italy_home_wins / italy_total_games
nether_home_win_per <- netherlands_home_wins / netherlands_total_games
portugal_home_win_per <- portugal_home_wins / portugal_total_games
spain_home_win_per <- spain_home_wins /spain_total_games
turkey_home_win_per <- turkey_home_wins/turkey_total_games
#Add a plot here
to_plot <- data.frame(Home_Win=c(englad_home_win_per,france_home_win_per,germany_home_win_per,
                                 italy_home_win_per, nether_home_win_per, portugal_home_win_per,
                                 spain_home_win_per, turkey_home_win_per),
                      Countries=c("England","France","Germany","Italy","Netherlands",
                                  "Portugal", "Spain", "Turkey"))
ggplot(data = to_plot, mapping = aes(x=Countries, y=Home_Win)) +geom_point() 
#
##### Now for away team leading at half-time marker
#Away teamhalftime leading and winning the game
england_away_wins<-nrow(englad_useful_games[englad_useful_games$HTR=='A' & englad_useful_games$FTR=='A',])
france_away_wins<-nrow(france_useful_games[france_useful_games$HTR=='A' & france_useful_games$FTR=='A',])
germany_away_wins<-nrow(germany_useful_games[germany_useful_games$HTR=='A' & germany_useful_games$FTR=='A',])
italy_away_wins<-nrow(italy_useful_games[italy_useful_games$HTR=='A' & italy_useful_games$FTR=='A',])
netherlands_away_wins<-nrow(netherlands_useful_games[netherlands_useful_games$HTR=='A' & netherlands_useful_games$FTR=='A',])
portugal_away_wins<-nrow(portugal_useful_games[portugal_useful_games$HTR=='A' & portugal_useful_games$FTR=='A',])
spain_away_wins<-nrow(spain_useful_games[spain_useful_games$HTR=='A' & spain_useful_games$FTR=='A',])
turkey_away_wins<-nrow(turkey_useful_games[turkey_useful_games$HTR=='A' & turkey_useful_games$FTR=='A',])
#Now lets see the % for home team leading halftime and winning the game
englad_away_win_per <- england_away_wins / englad_total_games
france_away_win_per <- france_away_wins / france_total_games
germany_away_win_per <- germany_away_wins / germany_total_games
italy_away_win_per <- italy_away_wins / italy_total_games
nether_away_win_per <- netherlands_away_wins / netherlands_total_games
portugal_away_win_per <- portugal_away_wins / portugal_total_games
spain_away_win_per <- spain_away_wins /spain_total_games
turkey_away_win_per <- turkey_away_wins/turkey_total_games
#Add a plot here
to_plot2 <- data.frame(Away_Win=c(englad_away_win_per,france_away_win_per,germany_away_win_per,
                                 italy_away_win_per, nether_away_win_per, portugal_away_win_per,
                                 spain_away_win_per, turkey_away_win_per),
                      Countries=c("England","France","Germany","Italy","Netherlands",
                                  "Portugal", "Spain", "Turkey"))
ggplot(data = to_plot2, mapping = aes(x=Countries, y=Away_Win)) +geom_point()

#Home team loosing after leading halftime
#Now home time halftime leading and loosing the game
england_home_looses<-nrow(englad_useful_games[englad_useful_games$HTR=='H' & englad_useful_games$FTR=='A',])
france_home_looses<-nrow(france_useful_games[france_useful_games$HTR=='H' & france_useful_games$FTR=='A',])
germany_home_looses<-nrow(germany_useful_games[germany_useful_games$HTR=='H' & germany_useful_games$FTR=='A',])
italy_home_looses<-nrow(italy_useful_games[italy_useful_games$HTR=='H' & italy_useful_games$FTR=='A',])
netherlands_home_looses<-nrow(netherlands_useful_games[netherlands_useful_games$HTR=='H' & netherlands_useful_games$FTR=='A',])
portugal_home_looses<-nrow(portugal_useful_games[portugal_useful_games$HTR=='H' & portugal_useful_games$FTR=='A',])
spain_home_looses<-nrow(spain_useful_games[spain_useful_games$HTR=='H' & spain_useful_games$FTR=='A',])
turkey_home_looses<-nrow(turkey_useful_games[turkey_useful_games$HTR=='H' & turkey_useful_games$FTR=='A',])
#Now lets see the % for home team leading halftime and winning the game
englad_home_looses_per <- england_home_looses / englad_total_games
france_home_looses_per <- france_home_looses / france_total_games
germany_home_looses_per <- germany_home_looses / germany_total_games
italy_home_looses_per <- italy_home_looses / italy_total_games
nether_home_looses_per <- netherlands_home_looses / netherlands_total_games
portugal_home_looses_per <- portugal_home_looses / portugal_total_games
spain_home_looses_per <- spain_home_looses / spain_total_games
turkey_home_looses_per <- turkey_home_looses / turkey_total_games
#Add a plot here
to_plot3 <- data.frame(Home_Looses_Afert_HT=c(englad_home_looses_per,france_home_looses_per,germany_home_looses_per,
                                 italy_home_looses_per, nether_home_looses_per, portugal_home_looses_per,
                                 spain_home_looses_per, turkey_home_looses_per),
                      Countries=c("England","France","Germany","Italy","Netherlands",
                                  "Portugal", "Spain", "Turkey"))
ggplot(data = to_plot3, mapping = aes(x=Countries, y=Home_Looses_Afert_HT)) +geom_point() 

###Away looses after HT lead
england_away_looses<-nrow(englad_useful_games[englad_useful_games$HTR=='A' & englad_useful_games$FTR=='H',])
france_away_looses<-nrow(france_useful_games[france_useful_games$HTR=='A' & france_useful_games$FTR=='H',])
germany_away_looses<-nrow(germany_useful_games[germany_useful_games$HTR=='A' & germany_useful_games$FTR=='H',])
italy_away_looses<-nrow(italy_useful_games[italy_useful_games$HTR=='A' & italy_useful_games$FTR=='H',])
netherlands_away_looses<-nrow(netherlands_useful_games[netherlands_useful_games$HTR=='A' & netherlands_useful_games$FTR=='H',])
portugal_away_looses<-nrow(portugal_useful_games[portugal_useful_games$HTR=='A' & portugal_useful_games$FTR=='H',])
spain_away_looses<-nrow(spain_useful_games[spain_useful_games$HTR=='A' & spain_useful_games$FTR=='H',])
turkey_away_looses<-nrow(turkey_useful_games[turkey_useful_games$HTR=='A' & turkey_useful_games$FTR=='H',])
#Now lets see the % for home team leading halftime and winning the game
englad_away_looses_per <- england_away_looses / englad_total_games
france_away_looses_per <- france_away_looses / france_total_games
germany_away_looses_per <- germany_away_looses / germany_total_games
italy_away_looses_per <- italy_away_looses / italy_total_games
nether_away_looses_per <- netherlands_away_looses / netherlands_total_games
portugal_away_looses_per <- portugal_away_looses / portugal_total_games
spain_away_looses_per <- spain_away_looses / spain_total_games
turkey_away_looses_per <- turkey_away_looses / turkey_total_games
#Add a plot here
to_plot4 <- data.frame(Away_Looses_Afert_HT=c(englad_away_looses_per,france_away_looses_per,germany_away_looses_per,
                                              italy_away_looses_per, nether_away_looses_per, portugal_away_looses_per,
                                              spain_away_looses_per, turkey_away_looses_per),
                       Countries=c("England","France","Germany","Italy","Netherlands",
                                   "Portugal", "Spain", "Turkey"))
ggplot(data = to_plot4, mapping = aes(x=Countries, y=Away_Looses_Afert_HT)) +geom_point() 

#TODO Check with arules
#library("arules")
#
#carRules <- apriori(englad_useful_games, parameter = list(
#  supp=0.1, conf=0.7),
#  appearance = list(
#    rhs=c("HTR=A", "FTR=A"),default="lhs")
#)