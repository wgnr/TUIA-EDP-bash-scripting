#!/usr/bin/env bash
# 
# Indicador estadístico de uso de palabras, deben ser de al menos 4(cuatro) letras.
# (mostrar un Top Ten de estas palabras ordenadas desde la que tiene más apariciones 
# a la que tiene menos). Es decir, filtrar las palabras que tengan al menos 4 letras 
# y de éstas, elegir las 10 más usadas.
# 

set -e

MIN_WORD_LENGTH=4
SHOW_RESULTS=10
WORDS_STATS=$(
  tr -s '[:space:][:punct:]' '\n' < $1 |
  sort | 
  uniq -c |
  sort -r -n |
  awk -v WL=$MIN_WORD_LENGTH 'length($2)>=WL {print $2,$1}' |
  head -n $SHOW_RESULTS
)

echo -e "Palabra Ocurrencias\n$WORDS_STATS"