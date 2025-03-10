 #! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games;")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "Select SUM(winner_goals + opponent_goals) from games;")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "Select AVG(winner_goals) from games;")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "Select Round(AVG(winner_goals),2) from games;")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "Select (AVG(winner_goals + opponent_goals)) from games;")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "Select Max(winner_goals) from games;")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "Select Count(*) from games where winner_goals > 2;")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "Select teams.name from games inner join teams on games.winner_id = teams.team_id where year = 2018 and round = 'Final';")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT name FROM teams inner JOIN games ON teams.team_id = games.winner_id OR teams.team_id = games.opponent_id WHERE year='2014' AND round='Eighth-Final' Order by name;")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "Select Distinct(name) from games left join teams on games.winner_id = teams.team_id order by name;")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "Select Year, name from games inner join teams on games.winner_id = teams.team_id where round = 'Final' order by year;")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "Select name from teams where name like 'Co%';")"

