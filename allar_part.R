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
#Now lets see the % for away team leading halftime and winning the game
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

#Home team loosing after leading halftimef
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
####Home draws after leading HT
england_home_draw<-nrow(englad_useful_games[englad_useful_games$HTR=='H' & englad_useful_games$FTR=='D',])
france_home_draw<-nrow(france_useful_games[france_useful_games$HTR=='H' & france_useful_games$FTR=='D',])
germany_home_draw<-nrow(germany_useful_games[germany_useful_games$HTR=='H' & germany_useful_games$FTR=='D',])
italy_home_draw<-nrow(italy_useful_games[italy_useful_games$HTR=='H' & italy_useful_games$FTR=='D',])
netherlands_home_draw<-nrow(netherlands_useful_games[netherlands_useful_games$HTR=='H' & netherlands_useful_games$FTR=='D',])
portugal_home_draw<-nrow(portugal_useful_games[portugal_useful_games$HTR=='H' & portugal_useful_games$FTR=='D',])
spain_home_draw<-nrow(spain_useful_games[spain_useful_games$HTR=='H' & spain_useful_games$FTR=='D',])
turkey_home_draw<-nrow(turkey_useful_games[turkey_useful_games$HTR=='H' & turkey_useful_games$FTR=='D',])
#Now lets see the % for home team leading halftime and drawing the game
englad_home_draw_per <- england_home_draw / englad_total_games
france_home_draw_per <- france_home_draw / france_total_games
germany_home_draw_per <- germany_home_draw / germany_total_games
italy_home_draw_per <- italy_home_draw / italy_total_games
nether_home_draw_per <- netherlands_home_draw / netherlands_total_games
portugal_home_draw_per <- portugal_home_draw / portugal_total_games
spain_home_draw_per <- spain_home_draw / spain_total_games
turkey_home_draw_per <- turkey_home_draw / turkey_total_games
#Add a plot here
to_plot5 <- data.frame(Home_draw_Afert_HT=c(englad_home_draw_per,france_home_draw_per,germany_home_draw_per,
                                              italy_home_draw_per, nether_home_draw_per, portugal_home_draw_per,
                                              spain_home_draw_per, turkey_home_draw_per),
                       Countries=c("England","France","Germany","Italy","Netherlands",
                                   "Portugal", "Spain", "Turkey"))
ggplot(data = to_plot5, mapping = aes(x=Countries, y=Home_draw_Afert_HT)) +geom_point() 


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

###Away leading and drawing the game###
england_away_draw<-nrow(englad_useful_games[englad_useful_games$HTR=='A' & englad_useful_games$FTR=='D',])
france_away_draw<-nrow(france_useful_games[france_useful_games$HTR=='A' & france_useful_games$FTR=='D',])
germany_away_draw<-nrow(germany_useful_games[germany_useful_games$HTR=='A' & germany_useful_games$FTR=='D',])
italy_away_draw<-nrow(italy_useful_games[italy_useful_games$HTR=='A' & italy_useful_games$FTR=='D',])
netherlands_away_draw<-nrow(netherlands_useful_games[netherlands_useful_games$HTR=='A' & netherlands_useful_games$FTR=='D',])
portugal_away_draw<-nrow(portugal_useful_games[portugal_useful_games$HTR=='A' & portugal_useful_games$FTR=='D',])
spain_away_draw<-nrow(spain_useful_games[spain_useful_games$HTR=='A' & spain_useful_games$FTR=='D',])
turkey_away_draw<-nrow(turkey_useful_games[turkey_useful_games$HTR=='A' & turkey_useful_games$FTR=='D',])
#Now lets see the % for away team leading halftime and drawing the game
englad_away_draw_per <- england_away_draw / englad_total_games
france_away_draw_per <- france_away_draw / france_total_games
germany_away_draw_per <- germany_away_draw / germany_total_games
italy_away_draw_per <- italy_away_draw / italy_total_games
nether_away_draw_per <- netherlands_away_draw / netherlands_total_games
portugal_away_draw_per <- portugal_away_draw / portugal_total_games
spain_away_draw_per <- spain_away_draw / spain_total_games
turkey_away_draw_per <- turkey_away_draw / turkey_total_games
#Add a plot here
to_plot6 <- data.frame(Away_draw_Afert_HT=c(englad_away_draw_per,france_away_draw_per,germany_away_draw_per,
                                              italy_away_draw_per, nether_away_draw_per, portugal_away_draw_per,
                                              spain_away_draw_per, turkey_away_draw_per),
                       Countries=c("England","France","Germany","Italy","Netherlands",
                                   "Portugal", "Spain", "Turkey"))
ggplot(data = to_plot6, mapping = aes(x=Countries, y=Away_draw_Afert_HT)) +geom_point() 


##Draw and away win ####
###Away draw and winning the game###
england_away_draw_win<-nrow(englad_useful_games[englad_useful_games$HTR=='D' & englad_useful_games$FTR=='A',])
france_away_draw_win<-nrow(france_useful_games[france_useful_games$HTR=='D' & france_useful_games$FTR=='A',])
germany_away_draw_win<-nrow(germany_useful_games[germany_useful_games$HTR=='D' & germany_useful_games$FTR=='A',])
italy_away_draw_win<-nrow(italy_useful_games[italy_useful_games$HTR=='D' & italy_useful_games$FTR=='A',])
netherlands_away_draw_win<-nrow(netherlands_useful_games[netherlands_useful_games$HTR=='D' & netherlands_useful_games$FTR=='A',])
portugal_away_draw_win<-nrow(portugal_useful_games[portugal_useful_games$HTR=='D' & portugal_useful_games$FTR=='A',])
spain_away_draw_win<-nrow(spain_useful_games[spain_useful_games$HTR=='D' & spain_useful_games$FTR=='A',])
turkey_away_draw_win<-nrow(turkey_useful_games[turkey_useful_games$HTR=='D' & turkey_useful_games$FTR=='A',])
#Now lets see the % for away team drawibg halftime and winning the game
englad_away_draw_win_per <- england_away_draw_win / englad_total_games
france_away_draw_win_per <- france_away_draw_win / france_total_games
germany_away_draw_win_per <- germany_away_draw_win / germany_total_games
italy_away_draw_win_per <- italy_away_draw_win / italy_total_games
nether_away_draw_win_per <- netherlands_away_draw_win / netherlands_total_games
portugal_away_draw_win_per <- portugal_away_draw_win / portugal_total_games
spain_away_draw_win_per <- spain_away_draw_win / spain_total_games
turkey_away_draw_win_per <- turkey_away_draw_win / turkey_total_games
#Add a plot here
to_plot7 <- data.frame(Away_draw_win_Afert_HT=c(englad_away_draw_win_per,france_away_draw_win_per,germany_away_draw_win_per,
                                            italy_away_draw_win_per, nether_away_draw_win_per, portugal_away_draw_win_per,
                                            spain_away_draw_win_per, turkey_away_draw_win_per),
                       Countries=c("England","France","Germany","Italy","Netherlands",
                                   "Portugal", "Spain", "Turkey"))
ggplot(data = to_plot7, mapping = aes(x=Countries, y=Away_draw_win_Afert_HT)) +geom_point() 

##Draw and home win
england_home_draw_win<-nrow(englad_useful_games[englad_useful_games$HTR=='D' & englad_useful_games$FTR=='H',])
france_home_draw_win<-nrow(france_useful_games[france_useful_games$HTR=='D' & france_useful_games$FTR=='H',])
germany_home_draw_win<-nrow(germany_useful_games[germany_useful_games$HTR=='D' & germany_useful_games$FTR=='H',])
italy_home_draw_win<-nrow(italy_useful_games[italy_useful_games$HTR=='D' & italy_useful_games$FTR=='H',])
netherlands_home_draw_win<-nrow(netherlands_useful_games[netherlands_useful_games$HTR=='D' & netherlands_useful_games$FTR=='H',])
portugal_home_draw_win<-nrow(portugal_useful_games[portugal_useful_games$HTR=='D' & portugal_useful_games$FTR=='H',])
spain_home_draw_win<-nrow(spain_useful_games[spain_useful_games$HTR=='D' & spain_useful_games$FTR=='H',])
turkey_home_draw_win<-nrow(turkey_useful_games[turkey_useful_games$HTR=='D' & turkey_useful_games$FTR=='H',])
#Now lets see the % for home team drawibg halftime and winning the game
englad_home_draw_win_per <- england_home_draw_win / englad_total_games
france_home_draw_win_per <- france_home_draw_win / france_total_games
germany_home_draw_win_per <- germany_home_draw_win / germany_total_games
italy_home_draw_win_per <- italy_home_draw_win / italy_total_games
nether_home_draw_win_per <- netherlands_home_draw_win / netherlands_total_games
portugal_home_draw_win_per <- portugal_home_draw_win / portugal_total_games
spain_home_draw_win_per <- spain_home_draw_win / spain_total_games
turkey_home_draw_win_per <- turkey_home_draw_win / turkey_total_games
#Add a plot here
to_plot8 <- data.frame(Home_draw_win_Afert_HT=c(englad_home_draw_win_per,france_home_draw_win_per,germany_home_draw_win_per,
                                                italy_home_draw_win_per, nether_home_draw_win_per, portugal_home_draw_win_per,
                                                spain_home_draw_win_per, turkey_home_draw_win_per),
                       Countries=c("England","France","Germany","Italy","Netherlands",
                                   "Portugal", "Spain", "Turkey"))
ggplot(data = to_plot8, mapping = aes(x=Countries, y=Home_draw_win_Afert_HT)) +geom_point()

### Draw and draw of the game ####
england_draw_draw<-nrow(englad_useful_games[englad_useful_games$HTR=='D' & englad_useful_games$FTR=='D',])
france_draw_draw<-nrow(france_useful_games[france_useful_games$HTR=='D' & france_useful_games$FTR=='D',])
germany_draw_draw<-nrow(germany_useful_games[germany_useful_games$HTR=='D' & germany_useful_games$FTR=='D',])
italy_draw_draw<-nrow(italy_useful_games[italy_useful_games$HTR=='D' & italy_useful_games$FTR=='D',])
netherlands_draw_draw<-nrow(netherlands_useful_games[netherlands_useful_games$HTR=='D' & netherlands_useful_games$FTR=='D',])
portugal_draw_draw<-nrow(portugal_useful_games[portugal_useful_games$HTR=='D' & portugal_useful_games$FTR=='D',])
spain_draw_draw<-nrow(spain_useful_games[spain_useful_games$HTR=='D' & spain_useful_games$FTR=='D',])
turkey_draw_draw<-nrow(turkey_useful_games[turkey_useful_games$HTR=='D' & turkey_useful_games$FTR=='D',])
#Now lets see the % for draw draw
englad_draw_draw_per <- england_draw_draw / englad_total_games
france_draw_draw_per <- france_draw_draw / france_total_games
germany_draw_draw_per <- germany_draw_draw / germany_total_games
italy_draw_draw_per <- italy_draw_draw / italy_total_games
nether_draw_draw_per <- netherlands_draw_draw / netherlands_total_games
portugal_draw_draw_per <- portugal_draw_draw / portugal_total_games
spain_draw_draw_per <- spain_draw_draw / spain_total_games
turkey_draw_draw_per <- turkey_draw_draw / turkey_total_games
#Add a plot here
to_plot9 <- data.frame(Draw_draw_Afert_HT=c(englad_draw_draw_per,france_draw_draw_per,germany_draw_draw_per,
                                                italy_draw_draw_per, nether_draw_draw_per, portugal_draw_draw_per,
                                                spain_draw_draw_per, turkey_draw_draw_per),
                       Countries=c("England","France","Germany","Italy","Netherlands",
                                   "Portugal", "Spain", "Turkey"))
ggplot(data = to_plot9, mapping = aes(x=Countries, y=Draw_draw_Afert_HT)) +geom_point()
#####
#Aggeregate together and get the numbers.
library(gtools)
test<-smartbind(englad_useful_games,france_useful_games,germany_useful_games,italy_useful_games,
                netherlands_useful_games,portugal_useful_games, spain_useful_games, turkey_useful_games)

nrow(test)==nrow(englad_useful_games)+nrow(france_useful_games)+nrow(germany_useful_games)+nrow(italy_useful_games)+nrow(netherlands_useful_games)+nrow(portugal_useful_games)+nrow(spain_useful_games)+nrow(turkey_useful_games)

all_leagues_home_HTR_win_win <- nrow(test[test$HTR=='H' & test$FTR=='H',])
all_leagues_home_HTR_win_loose <- nrow(test[test$HTR=='H' & test$FTR=='A',])
all_leagues_home_HTR_win_draw <- nrow(test[test$HTR=='H' & test$FTR=='D',])
all_leagues_home_HTR_lose_win <- nrow(test[test$HTR=='A' & test$FTR=='H',])
all_leagues_home_HTR_lose_lose <- nrow(test[test$HTR=='A' & test$FTR=='A',])
all_leagues_home_HTR_lose_draw <- nrow(test[test$HTR=='A' & test$FTR=='D',])
all_leagues_home_HTR_draw_draw <- nrow(test[test$HTR=='D' & test$FTR=='D',])
all_leagues_draw_away_win <- nrow(test[test$HTR=='D' & test$FTR=='A',])
all_leagues_draw_home_win <- nrow(test[test$HTR=='D' & test$FTR=='H',])
###The % now
all_leagues_home_win_win <- all_leagues_home_HTR_win_win / nrow(test)
all_leagues_home_win_lose <- all_leagues_home_HTR_win_loose / nrow(test)
all_leagues_home_win_draw <- all_leagues_home_HTR_win_draw / nrow(test)
all_leagues_home_lose_win <- all_leagues_home_HTR_lose_win / nrow(test)
all_leagues_home_lose_lose <- all_leagues_home_HTR_lose_lose / nrow(test)
all_leagues_home_lose_draw <- all_leagues_home_HTR_lose_draw / nrow(test)
all_leagues_draw_draw <- all_leagues_home_HTR_draw_draw / nrow(test)
all_leagues_draw_away <- all_leagues_draw_away_win / nrow(test)
all_leagues_draw_home <- all_leagues_draw_home_win / nrow(test)
##Some pie plot here with ggplot
bar_to_plot <- data.frame(Game_outcome_prob=c(all_leagues_home_win_win,all_leagues_home_win_lose,
                                              all_leagues_home_win_draw, all_leagues_home_lose_win,
                                              all_leagues_home_lose_lose, all_leagues_home_lose_draw,
                                              all_leagues_draw_draw,all_leagues_draw_away,
                                              all_leagues_draw_home),
                          Names_of_prob=c("Home win ","Home lose","Home draw","Away win",
                                          "Away lost", "Away draw", "Draw","Away win from draw",
                                          "Home win from draw"))

game_outcome_barp <- ggplot(bar_to_plot, mapping = aes(x="", y=Game_outcome_prob, fill=Names_of_prob))+
  geom_bar(width = 1,stat = "identity")
game_outcome_piep <- game_outcome_barp + coord_polar("y", start = 0)
game_outcome_piep
###
##Now two plots for seeing the outcome from leading at halftime:
#For home team
home_bar_to_plot <- data.frame(Game_outcome_prob=c(all_leagues_home_win_win,all_leagues_home_win_lose,
                                                   all_leagues_home_win_draw),
                               Outcome=c("Home win ","Home lose","Home draw"))

home_outcome_barp <- ggplot(home_bar_to_plot, mapping = aes(x="", y=Game_outcome_prob, fill=Outcome))+
  geom_bar(width = 1,stat = "identity")

home_outcome_piep <- home_outcome_barp + coord_polar("y", start = 0) +ylab("Outcome from hometeam leading at halftime")
home_outcome_piep + blank_theme + theme(axis.text.x=element_blank()) 
###
blank_theme <- theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid=element_blank(),
    axis.ticks = element_blank(),
    plot.title=element_text(size=14, face="bold")
  )
###
library(scales)
home_outcome_piep + scale_fill_brewer("Probability") + blank_theme + theme(
  axis.text.x=element_blank()) +geom_text(aes(y = Game_outcome_prob/3 + c(0, cumsum(Game_outcome_prob)[-length(Game_outcome_prob)]),
                                              label=round(Game_outcome_prob,digits = 4))
) + ggtitle("Probabilty of game outcome from home team leading at halftime")

#For away team

away_bar_to_plot <- data.frame(Game_outcome_prob=c(all_leagues_home_lose_lose,all_leagues_home_lose_win,
                                                   all_leagues_home_lose_draw),
                               Outcome=c("Away win ","Away lose","Away draw"))

away_outcome_barp <- ggplot(away_bar_to_plot, mapping = aes(x="", y=Game_outcome_prob, fill=Outcome))+
  geom_bar(width = 1,stat = "identity")

away_outcome_piep <- away_outcome_barp + coord_polar("y", start = 0)
away_outcome_piep + blank_theme + theme(axis.text.x=element_blank())
##Do the card part
#The probabilty of winning when scoring a red card


#The probabilty of winning when scoring a yellow card


#The probabilty of winning when scoring a card


#The probabilty of losing when scoring a red card


#The probabilty of losin when scoring a yellow card


#The probabilty of losin when scoring a card



