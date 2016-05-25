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
- Italy from 93/94 (match stats from 05/06 on + referees)
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

## Structure
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

## Results
