#!/usr/bin/env bash
#
# Indicador estadístico de longitud de palabras (la más corta, la más larga y el 
# promedio de longitud).
#

set -e

LENGTH=0
UNIQUE_WORDS=$(
  tr -s '[:space:][:punct:]' '\n' < $1 |
  sort |
  uniq
)

for WORD in $UNIQUE_WORDS;do
  WORD_LEN=${#WORD}

  [ ${#PAlABRA_CORTA} -ge $WORD_LEN -o -z "$PAlABRA_CORTA" ] && PAlABRA_CORTA=$WORD
  [ ${#PAlABRA_LARGA} -le $WORD_LEN ] && PAlABRA_LARGA=$WORD

  ((LENGTH+=$WORD_LEN))
done

echo "Promedio palabras distintivas:\
$(echo "scale=2; $LENGTH / $(echo $UNIQUE_WORDS | wc -w)" | bc)"
echo "La palabra $PAlABRA_CORTA es la mas corta con ${#PAlABRA_CORTA} caracteres."
echo "La palabra $PAlABRA_LARGA es la mas larga con ${#PAlABRA_LARGA} caracteres."