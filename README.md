# 23 Years of Football
This project is about football data for data mining purposes. In our project we used descriptive data mining approach. In futher works, we could extend our findings to create a nice model to beat bookies.

### Who are we?
- Allar Soo
- Georg Berecz
- Eerik Muuli
- Kristjan Jürisoo

## Description of data
The data used in this project is about football result and statistics dating back to year 1993 with the newest data being as late as May 2016. In this project data from the top flights of England, Germany, Italy, Spain, France, the Netherlands, Portugal and Turkey is used for analysis. Not the full scope of the data available was used for the project. Data used for this project is as follows:
- England from 93/94 (match stats from 00/01 on + referees)
- Germany from 93/94 (match stats from 00/01 on - but not 02/03)
- Italy from 93/94 (match stats from 05/06 on + referees 05/06 to 06/07)
  - no attendance, no HO, no AO
- Spain from 93/94 (match stats from 05/06)
  - no attendance, no referees, no HO, no AO
-France from 93/94 (match stats from 05/06) 
  - no attendance, no referees, no HO, no AO
- Netherlands from 94/95 (no match stats)
  - no match stats at all
- Portugal from 94/95 (no match stats)
  - no match stats at all
- Turkey from 94/95 (no match stats)
  - no match stats at all
In total 61 072 observations across 8 football leagues from 8 countries is used.

Detailed description of the data can be accessed [here](http://www.football-data.co.uk/notes.txt). 
The whole data is downloadable from this [link](http://www.football-data.co.uk/data.php).

## Goals
We chose this data because it is about the game we all love. The goals of this project were to find some interesting patterns or rules that one football fan might not see himself and maybe prove or bust some myths that we had. For example, do your chances of winning a game increase when you lead at half time or whether having loads of corner kicks more than your opponent increases your chances of winning a football match. In addition, we wanted to know which referees are more card-happy than others and which leagues follow more fair-play principles. English league has always been considered by football fans as a league where referees tend to let game play whereas Italian league has always been considered as the most tactical and defensive league. We aim to find out if these are misconceptions or not.

We decieded to set following sub-goals for our analysis:
  - Average goals per game for all the seasons and for all the countries
  - Average cards per game per country (in order to see fairplay)
  - In which country are the most fair/aggressive teams
  - Who is scoring more cards: home or away?
  - What's the probability to win away/home if you lead at the half time (Home team vs Away team) 
  - Least goals in order to win the league, most goals conceded with winning the league
  - Most goals conceded ever, most goals scored ever (one team per game, one team per season)
  - What is the probabilty that you lose if you get red card (is that higher than the prob. that you lose if you don’t get a red card?)
  - The overall accuracy (how many shots (+ on target) you need in order to score a goal OVERALL in all countries and all teams and all seasons)
  - If one team has more corners than the other, does it on average mean that the team will win?
  - Most cards per referee
  - What are interesting association rules


## Results
The analysis was done using R. The code is spread across .r files in the root folder of the project.
#### 1. Teams aggressiveness across the countries based on the yellow and red cards given.

First of all, in order to analyze teams agressiveness data needed to be sorted. The games and countries that didn't have any data about cards given were removed. 

The following countries didn't have any information about cards given in their league games:
 - Netherlands
 - Portugal
 - Turkey

The following countries had data about the cards for at least one season:
 - England
 - France
 - Germany
 - Italy
 - Spain

Let's take a look into the results by country (NB: These are average results):

##### England
 - Home team yellow cards per game: 1.36
 - Away team yellow cards per game: 1.77
 - Home team red cards per game: 0.07
 - Away team red cards per game: 0.1
 - The most agressive team in England: Coventry - 2 yellows cards per game on average.
 - The most calm team in England: Ipswitch - 0.94 yellow cards per game on average.

##### France
 - Home team yellow cards per game: 1.52
 - Away team yellow cards per game: 1.89
 - Home team red cards per game: 0.09
 - Away team red cards per game: 0.14
 - The most agressive team in France: Ajaccio GFCO - 2.34 yellows cards per game on average.
 - The most calm team in France: Lorient - 1.34 yellow cards per game on average.
 
##### Germany
 - Home team yellow cards per game: 1.73
 - Away team yellow cards per game: 2.1
 - Home team red cards per game: 0.07
 - Away team red cards per game: 0.11
 - The most agressive team in Germany: Duisburg - 2.68 yellows cards per game on average.
 - The most calm team in Germany: Unterhaching - 1.38 yellow cards per game on average.

##### Italy
 - Home team yellow cards per game: 2.12
 - Away team yellow cards per game: 2.38
 - Home team red cards per game: 0.13
 - Away team red cards per game: 0.18
 - The most agressive team in Italy: Frosinone - 2.84 yellows cards per game on average.
 - The most calm team in Italy: Bari - 1.7 yellow cards per game on average.

##### Spain
 - Home team yellow cards per game: 2.44
 - Away team yellow cards per game: 2.74
 - Home team red cards per game: 0.15
 - Away team red cards per game: 0.2
 - The most agressive team in Spain: Vallecano - 3.02 yellows cards per game on average.
 - The most calm team in Spain: Barcelona - 1.84 yellow cards per game on average.
 - It is also worth mentioning that there is a team in Spain called Xerex, who receives 0.37 red cards per game!

Now, to take everything together with one plot we can see the average red and yellow cards received by countries:
![alt tag](https://github.com/georgberecz/football-data-mining/blob/master/Number_Of_Cards_Per_Game.png)

We can clearly see from the above image that England is the least aggressive country by cards given. But if we think of it from another corner then perhaps the referees are not so strict and let the game be more aggressive? Probably of the 2 combined. Also it is quite clear that Spain has the highest average on cards given per game, both red and yellow cards. That shows that the referees are more strict, probably more acting/diving by players (because they know that referees will often book opponent even after a dive) and also it is a common knowledge that the players in the southern parts of Europe usually are more temparamental and hot blooded.

#### 2. Referees
First of all, only England has substantial referee data available for referees - since 00/01. For further analysis referees with more than 200 games were picked - there were 12 of such referes - and new features created for the data. Statistical analysis was performed on these referees. Rob Styles is the referee that gave away the most cards per game (3,9). He refereed up until year 2009. The least card-happy referee was Mark Halsey, who ended his career in 2013, with 2,3 cards per game. Since the beginning of data from 00/01 season Mike Dean has given away the most cards in total - 1516. Other referees to give away more than 1000 cards were Phil Dowd (1153), Martin Atkinson (1050) and Howard Webb (1001). Mark Clattenburg is the only referee to give less red cards to away team than home team (28 vs 16) whereas 9 out of 11 other referees give at least 1.5 times more red cards to away games. Similar pattern applies for yellow cards. Away teams are awarded more yellow cards by all 12 observed referees (varying from 1.08 to 1.52 times). So we can tell that away team is rewarded more cards per game. This can be down to the fact that home team is supported by home crowd and the referees are more reluctant to give away cards or that the away team is more under pressure to perform away from home and make more mistakes. On average for every red card there are 14 to 29 yellow cards depending on the refere.
#### 3. Fouls over the years
The Premier League has the reputation of having a tough and hard-tackling league. To find out if this was true, fouls per game for 5 countries - Germany, Italy, France, England, Spain - were plotted. ![alt tag](https://github.com/georgberecz/football-data-mining/blob/master/fouls.png)
The plot here somewhat proves the point. Over the years English top flight has had the lowest amount of fouls per game. Though, the gap between other leagues has become smaller over the years. This fact proves the point that English referees are more lenient than on the continent. What else is interesting is the fact that for every country other than Spain away teams have more fouls per game than home team. Other interesting trend is that fouls per games have dropped over the last 15 years which can be down to the fact that TV companies have more and more coverage of football and tackling and refereeing gets more scrutiny from the public.
#### 4. Is there relation between corners and the game outcome?
Once again the countries with available match data were used to do the analysis. The data was clustered into groups by the difference of corners the home team had compared to the away team. The biggest difference between corners was 20. The overall trends can be seen on the following plot. 
![alt tag](https://github.com/georgberecz/football-data-mining/blob/master/Corner%20Plots/corners.png)
One would assume that having more corners means that this team is attacking a lot more and maybe increases the winning probability as well. But it turns out that having more or less corners than your opponent has little effect on the result - unless you have more than 10 corners less, which is very interesting. There is no one logical explanation as why this is. We can also see from the plot that the home team's winning ratio is the highest of the three possible outcomes of a football game, which is in line with the talk that home team has an advantage over the away team.
#### 5. Does leading at halftime gives a team leavarage to win a game?
Before answering this question, we needed to clean our data. We extracted only the games where halftime results were available. Now after doing our analysis on the game outcomes we indeed concluded that winning halftime realy ups teams changes to win. It is higher for home team than for away team. Surely here a physologiacl factor comes into play and also so called "home walls".  Our claim bases on assoccation rules mining (see the next chapter) and on following chraps:
![alt tag](https://github.com/georgberecz/football-data-mining/blob/master/homewinsafterht.png)

![alt tag](https://github.com/georgberecz/football-data-mining/blob/master/awaywinsafterht.png)

This two graph show that in all leagues home is more likley to win after HT.

Following two grapsh show that home is also less likely to lose form half-time lead:

![alt tag](https://github.com/georgberecz/football-data-mining/blob/master/homelostafterHT.png)
![alt tag](https://github.com/georgberecz/football-data-mining/blob/master/awayLoosesafterHTwin.png)

### 6. Does a red card affect the game outcome?
Our answer to this question is yes. Altough red card itself is quite rare phenomeon, it still has impact on games. What we found was that not scoring a read card means 15.5 times higher chance to win a game when scoring a one. it bases on fact that per of games won with red card for winning team is 6.4% and the per of games won without red card for winning team is 93.6%

When could also say that losing a game is 5.2 times less likley when scoring a red card per of games lost with red card for losing team 16.3% whereas per of games lost without red card for losing team is 83.7%. But we don't trust this claims since as mentioned before, red card is quite unique event. Thus in futher work we would have to come out with a qualifier to get more accurate result.

We can say that drawing a red card decreases the changes for a draw 4 times if one achives a red card and 40 times if both teams draw
red card. This bases on that per of games drawn with red card 19.6%, per of games drawn without red card is 80.4% and per of games drawn with red card for both is 2.3.

These claims hold on England, Spain, France, Germany and Italy leagues since those were onlyones where card data was available.

##Association rules mining

Do find more interesting facts from our data, we decieded to use Arules package. Before doing any association mining we needed to discretizie our data. Overall we discovered about 1000 rules of which in our optionion noteworthy are following:

          *LHS*       *RHS*   *Support* *Confidence*  *Lift* *Description*
  - FTHG=0} => {HTHG=0} 0.2228082 1.0000000  2.003497 Meaning that when full time result is null for home team then with 100% probabilty they didn't score at halftime too and it has happened in 22% of cases.
  - {FTR=H,HTHG=0} => {HTR=D}  0.1153362 0.8470021  1.995905 Meaning that when full time result was home team and halftime score 0 then with 84% prob the game was at draw at halftime.
  - {FTHG=3} => {FTR=H}  0.1142664 0.8975380  1.906696 Meaning that if home team scores 3 goals they are going to win 89% prob and 11% of games have ended with home win or with a draw.
  - {FTHG=2,HTAG=0} => {FTR=H}  0.1306706 0.8632362  1.833826 Meaning that when away team doesn't score at halftime and home scores at least two, home is going to win with prob 0.86
  - {FTR=A,HTR=A}=> {HTHG=0} 0.1281743 0.8687190  1.740476 Meaning tha with 86% probabilty home team didn't score when awayteam wins at full- and half-time.
  - {HTR=A}=> {HTHG=0} 0.1887986 0.8618060  1.726626 Meaning that in 86% of the times when away team leads at half time, the home team has not scored.
  - {HTAG=0,HTR=H} => {FTR=H}  0.2495167 0.8062345  1.712734 Home is going to win with 80% prob if away doesn't score at halftime.
  - {FTAG=0} => {HTAG=0} 0.3451078 1.0000000  1.613391 Meaning that 34.5% of games ended without away team scoring.
  - {HTHG=1,HTR=H} => {HTAG=0} 0.2166332 1.0000000  1.613391 In 22% of the matches home team leads 1-0 at home at halftime.
  - {FTR=H,HTR=H} => {HTAG=0} 0.2495167 0.8715662  1.406177 Meaning that when home wins from halftime lead, then with 87% prob away team didn't score at halftime.
  - {HTR=H} => {HTAG=0} 0.3094840 0.8679792  1.400389 When home team wins halftime, then with 87% prob away team didn't score at halftime.
  - {FTHG=0,FTAG=0,HTHG=0} => {FTR=D} 0.08235890 1.0000000  3.812178 Meaning that 8% of games will end with draw after nil-nil score at halftime
  - {FTHG=4} => {FTR=H} 0.05268492 0.9743145  2.069797 Meaning that 5% of games has ended with home team scoring 4 goals and winning the game and also when home has scored 4 goals the probabilty of winning a game for home team is 0.97 (out of games, that home has scored 4 goals, 97% of them had been won)
  - {HTAG=0,HTR=H} => {FTR=H} 0.24951670 0.8062345  1.712734 When away doesn't score at halftime and you home team leads then with 80% prob home team wins the game.
  - {HTHG=2,HTR=H} => {FTR=H} 0.09332007 0.8683199  1.844626 When home team has scored two goals at halftime and won, the probability of winning is 87%.
  - {HTR=A} => {HTHG=0} 0.1887986 0.8618060  1.726626 Meaning that when halftime is won by away team then with prob 0.86 home team hasn't scored and it has happened 19% of games.
  - {HR=0} => {AR=0}   0.79571699 0.8787533  1.0106599 If home hasn't received a red card then from 88% of cases away also hasn't scored a red card.
  - {AR=1} => {HR=0}   0.10255084 0.8481825  0.9366937 Meaning that in 84% of the times when away team was awareded a red card, the home team didn't.
  
If you want see more rules then please see files all_possible_rules_for_major_leagues.txt, card_rules_away.txt, card_rules_home.txt, leagues_game_outcome_lhs.txt, leagues_rhs_game_outcome.txt, leagues_rules_from_10_columns.txt and major_leagues_game_outcome_rhs.txt

##Futher works
As mentioned before we focused on descriptive part. Now futher parts would be to set our focus on predictions. For example we could create an application that helps predict the possible game outcome from current standings and teams playing. Our we could also add probilty of drawing a card from current standing. So it would be an app for beating the bookies.

##Related works
Well, at first, it is clear that bookmakers have done that sort data mining and analysis before and doing actively at the moment. But their findings and models are not publically available, otherwise they would lose their revenue. 

Altough there are many sites for football statistics and predictions, for example :
  - http://www.fourfourtwo.com/features/analysis
  - https://www.whoscored.com/Matches/1006295/MatchReport
  - http://www.soccerstats.com/
  - http://www.european-football-statistics.co.uk/league.htm
  - http://fcstats.com/longest-streaks,3.php
  - http://www.squawka.com/home/
  - https://www.statbunker.com/
  - https://www.google.ee/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=football%20predictions
  - https://betegy.com/
  - http://www.forebet.com/en/football-tips-and-predictions-for-today
  
we still belive that we add novelity to this domain by looking at cards, halftime results and making some predictions based on these.
