#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read -r year round winner opponent winner_goals opponent_goals
do
if [[ $year != "year" ]]
then
winner_team_id="$($PSQL "Select team_id from teams where name = '$winner'")"
if [[ -z $winner_team_id ]]
then
winnerTeam="$($PSQL "INSERT INTO TEAMS(name) VALUES('$winner')")"
fi 
opponent_team_id="$($PSQL "Select team_id from teams where name = '$opponent'")"
if [[ -z $opponent_team_id ]]
then
opponentTeam="$($PSQL "INSERT INTO TEAMS(name) VALUES('$opponent')")"
fi
fi
done

cat games.csv | while IFS="," read -r year round winner opponent winner_goals opponent_goals
do
if [[ $year != "year" ]]
then
WinId="$($PSQL "Select team_id from teams where name = '$winner'")"
OpId="$($PSQL "Select team_id from teams where name = '$opponent'")"
dtIns="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $WinId, $OpId, $winner_goals, $opponent_goals)")"

fi
done
