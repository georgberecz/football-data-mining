# 23 Years of Football
This project is about football data for data mining purposes.
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
One would assume that having more corners means that this team is attacking a lot more and maybe increases the winning probability as well. But it turns out that having more or less corners than your opponent has little effect on the result - unless you have more than 10 corners less, which is very interesting. There is no one logical explanation as why this is. 
