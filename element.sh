#!/bin/bash

P="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $1 ]]
then
        # if $1 is a nbr get ATOM_NBR direct else undirect
        if [[ $1 =~ ^[0-9]+$ ]]
        then
                ATOM_NBR=$($P "SELECT atomic_number FROM elements WHERE atomic_number = $1")
        else
                ATOM_NBR=$($P "SELECT atomic_number FROM elements WHERE symbol = '$1' OR name = '$1'")
        fi

        # if element exist (not empty ATOM_NMR)
        if [[ ! -z $ATOM_NBR ]]
        then
                # get the vars (NAME, SYMBOL, TYPE, MASS, MELTP, BOILP) values (ATOM_NBR is gotten)
                VARS=$($P "SELECT name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number = $ATOM_NBR")

                # get each var, format to print & print result
                ATOM_NBR_FTD=$(echo $ATOM_NBR | sed 's/^ *//')
                echo $VARS | while read NAME BAR SYMBOL BAR TYPE BAR MASS BAR MELTP BAR BOILP
                do
                        echo "The element with atomic number $ATOM_NBR_FTD is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTP celsius and a boiling point of $BOILP celsius."
                done
        else
                echo I could not find that element in the database.
        fi
else
        echo Please provide an element as an argument.
fi