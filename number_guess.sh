#!/bin/bash

echo -e "\n   # ~~~  Number Guessing Game  ~~~ #\n"

P="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

INP_NBR(){
        read I_NBR
        # if NBR_INP is not a an INT (is alpha or float)
        while [[ ! $I_NBR =~ ^[0-9]+$ ]]
        do
                echo That is not an integer, guess again:
                read I_NBR
        done
}

NBR=$(( RANDOM % 1000 + 1))

echo Enter your username:
read NAME

# check if user exists using user_id
USER_ID=$($P "SELECT user_id FROM users WHERE name = '$NAME'")
if [[ -z $USER_ID ]]
then
        # user do not exists then insert to DB
        INSRT_NM_RSLT=$($P "INSERT INTO users(name) VALUES('$NAME')")
        USER_ID=$($P "SELECT user_id FROM users WHERE name = '$NAME'")

        # print welcome mesg!
        echo Welcome, $NAME! It looks like this is your first time here.
else
        # get total games_played (GMS_PLYD) and best_game (BST_GM) for actual user (USER_ID)
        GMS_PLYD=$($P "SELECT COUNT(game_id) FROM games WHERE user_id = $USER_ID")
        BST_GM=$($P "SELECT MIN(guesses_nbr) FROM games WHERE user_id = $USER_ID")

        # print welcome mesg!
        echo Welcome back, $NAME! You have played $GMS_PLYD games, and your best game took $BST_GM guesses.
fi

# the game now
echo Guess the secret number between 1 and 1000:
INP_NBR
cnt=1

# while do not guess the secret number
while [[ $NBR -ne $I_NBR ]]
do
        if [[ $NBR -lt $I_NBR ]]
        then
                echo "It's lower than that, guess again:"
        else
                echo "It's higher than that, guess again:"
        fi
        INP_NBR
        (( cnt++ ))
done

# number guessed: write history in DB & print final msg
INST_GMS_RSLT=$($P "INSERT INTO games(guesses_nbr, user_id) VALUES($cnt, $USER_ID)")
echo "You guessed it in $cnt tries. The secret number was $NBR. Nice job!"