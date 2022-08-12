#!/usr/bin/env bash
#
# Selección de oración y/o párrafo en base a un número de entrada. Es decir, se
# puede establecer como entrada “O” o “P” para indicar oración o párrafo y luego 
# un número (un párrafo se distingue de otro con un punto y aparte, las oraciones 
# vía un punto seguido).
#

set -e 

SENTENCE_REGEX="\b.+?\."
PARAGRAPH_REGEX=$SENTENCE_REGEX"$"

read -p "Ingrese oracion o parrafo p [o,P]: " OPTION
read -p "Ingrese el numero: " RESULT_NUMBER

REGEX=$PARAGRAPH_REGEX
[ "$OPTION" == "o" -o "$OPTION" == "O" ] && REGEX=$SENTENCE_REGEX

SEARCH_LINE="$RESULT_NUMBER""p"

echo $(egrep -o $REGEX $1 | sed -n "$SEARCH_LINE")
