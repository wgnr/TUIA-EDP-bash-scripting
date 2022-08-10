#!/usr/bin/env bash
#
# Indicador estadístico de longitud de oraciones (la más corta, la más larga y el
# promedio de longitud).
# 

set -e

LINE_LENGTH_STATS=$(
  awk '{print length($0),NR}' $1 |
  sort -rn |
  sed '/^0/d' |
  awk '
          {longitud+=$1}
    NR==1 {print \
          "La linea",$2,"es la mas larga con",$1,"caracteres"}; 
    END   {print \
          "La linea",$2,"es la mas corta (no vacia) con",$1,"caracteres"\
          "\nEn promedio cada linea tiene una longitud de",longitud/NR,"caractes (incluye lineas en blanco)"}'
)

echo "$LINE_LENGTH_STATS"