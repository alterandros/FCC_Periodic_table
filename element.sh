#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

ARG1=$1

if [[ $ARG1 ]]
then
  #check if number
  if [[ $ARG1 =~ ^[0-9]+$ ]]
  then
    #check if number is in database
    ATOMIC_DATA=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ARG1;")
    if [[ -z $ATOMIC_DATA ]]
    then
      echo "I could not find that element in the database."
    else
      echo $ATOMIC_DATA | while  IFS="|" read ATOMIC SYMBOL NAME MASS MELTING BOILING TYPE
      do
        ATOMIC_FIX=$(echo $ATOMIC | sed 's/^ *| *$//g')
        SYMBOL_FIX=$(echo $SYMBOL | sed 's/^ *| *$//g')
        NAME_FIX=$(echo $NAME | sed 's/^ *| *$//g')
        MASS_FIX=$(echo $MASS | sed 's/^ *| *$//g')
        MELTING_FIX=$(echo $MELTING | sed 's/^ *| *$//g')
        BOILING_FIX=$(echo $BOILING | sed 's/^ *| *$//g')
        TYPE_FIX=$(echo $TYPE | sed 's/^ *| *$//g')
        echo "The element with atomic number $ATOMIC_FIX is $NAME_FIX ($SYMBOL_FIX). It's a $TYPE_FIX, with a mass of $MASS_FIX amu. $NAME_FIX has a melting point of $MELTING_FIX celsius and a boiling point of $BOILING_FIX celsius."
      done
    fi
  else
    #check if that str is a valid symbol in database
    STRING_LENGHT=$(echo -n "$ARG1" | wc -m)
    if [[ $STRING_LENGHT < 3 ]]
    then
      #check if number is in database
      SYMBOL_DATA=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$ARG1';")
      if [[ -z $SYMBOL_DATA ]]
      then
        echo "I could not find that element in the database."
      else
        echo $SYMBOL_DATA | while  IFS="|" read ATOMIC SYMBOL NAME MASS MELTING BOILING TYPE
      do
        ATOMIC_FIX=$(echo $ATOMIC | sed 's/^ *| *$//g')
        SYMBOL_FIX=$(echo $SYMBOL | sed 's/^ *| *$//g')
        NAME_FIX=$(echo $NAME | sed 's/^ *| *$//g')
        MASS_FIX=$(echo $MASS | sed 's/^ *| *$//g')
        MELTING_FIX=$(echo $MELTING | sed 's/^ *| *$//g')
        BOILING_FIX=$(echo $BOILING | sed 's/^ *| *$//g')
        TYPE_FIX=$(echo $TYPE | sed 's/^ *| *$//g')
        echo "The element with atomic number $ATOMIC_FIX is $NAME_FIX ($SYMBOL_FIX). It's a $TYPE_FIX, with a mass of $MASS_FIX amu. $NAME_FIX has a melting point of $MELTING_FIX celsius and a boiling point of $BOILING_FIX celsius."
      done
      fi
    else
      #check if name is a valid name in database
      NAME_DATA=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$ARG1';")
      if [[ -z $NAME_DATA ]]
      then
        echo "I could not find that element in the database."
      else
        echo $NAME_DATA | while  IFS="|" read ATOMIC SYMBOL NAME MASS MELTING BOILING TYPE
      do
        ATOMIC_FIX=$(echo $ATOMIC | sed 's/^ *| *$//g')
        SYMBOL_FIX=$(echo $SYMBOL | sed 's/^ *| *$//g')
        NAME_FIX=$(echo $NAME | sed 's/^ *| *$//g')
        MASS_FIX=$(echo $MASS | sed 's/^ *| *$//g')
        MELTING_FIX=$(echo $MELTING | sed 's/^ *| *$//g')
        BOILING_FIX=$(echo $BOILING | sed 's/^ *| *$//g')
        TYPE_FIX=$(echo $TYPE | sed 's/^ *| *$//g')
        echo "The element with atomic number $ATOMIC_FIX is $NAME_FIX ($SYMBOL_FIX). It's a $TYPE_FIX, with a mass of $MASS_FIX amu. $NAME_FIX has a melting point of $MELTING_FIX celsius and a boiling point of $BOILING_FIX celsius."
      done
      fi
    fi
  fi
else
  echo Please provide an element as an argument.
fi
