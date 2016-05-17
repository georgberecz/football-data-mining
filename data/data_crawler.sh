#!/bin/bash
nation="T"
for i in `seq 93 115`;
do 
	j=$(($i+1))
	lengthi=${#i}
	lengthj=${#j}
	if [ $lengthi -gt 2 ]; then
		i=${i:1:2}
	fi
	if [ $lengthj -gt 2 ]; then
		j=${j:1:2}
	fi
	
	season=$i$j
	link="http://www.football-data.co.uk/mmz4281/$season/${nation}1.csv"
	echo "$link"
	file="$nation$season.csv"
	`curl $link -o $file` 	
done


