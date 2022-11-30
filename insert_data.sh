#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cnt=0
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPO WINN_GS OPPO_GS
do
        if [[ $YEAR != 'year' ]]
        then
                # get teams_id (W - f/WINNER)
                TEAMS_IDW=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
                TEAMS_IDO=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPO'")

                # if not found f/WINNER
                if [[ -z $TEAMS_IDW ]]
                then
                        # insert WINNWER name - aut. create respectivly team_id
                        INS_WIN_RSLT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
                        if [[ $INS_WIN_RSLT == "INSERT 0 1" ]]
                        then
                                (( cnt++ ))
                                echo Inserted into teams: $WINNER, from WINNER  -  $cnt
                        fi
                fi

                # if not found teams_id (f/OPPO) -> add OPPO row
                if [[ -z $TEAMS_IDO ]]
                then
                        # insert OPPO name - aut. create respectivly team_id
                        INS_OPPO_RSLT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPO')")
                        if [[ $INS_OPPO_RSLT == "INSERT 0 1" ]]
                        then
                                (( cnt++ ))
                                echo Inserted into teams: $OPPO, from OPPO  -  $cnt
                        fi
                fi

        fi
done

# Cont. filling other table here - once i'm sure teams table is full
# Teams table has team_id 

cn2=0
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPO WINN_GS OPPO_GS
do
        if [[ $YEAR != 'year' ]]
        then
                # get winner_id and opponent_id from teams table.
                WINN_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
                OPPO_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPO'")

                # get game_id (w/ run the script and the table is full)
                GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR AND round='$ROUND' AND winner_id=$WINN_ID AND opponent_id=$OPPO_ID AND winner_goals=$WINN_GS AND opponent_goals=$OPPO_GS")

                # if not found 
                if [[ -z $GAME_ID ]]
                then
                        # insert row in games tables (game_id generates auto)
                        INS_GAME_RSLT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINN_ID, $OPPO_ID, $WINN_GS, $OPPO_GS)")
                        if [[ $INS_GAME_RSLT == "INSERT 0 1" ]]
                        then
                                (( cn2++ ))
                                 echo -e "Inserted into games: $YEAR $ROUND $WINNER($WINN_ID) $OPPO($OPPO_ID)  -  $cn2"
                        fi
                fi

        fi
done