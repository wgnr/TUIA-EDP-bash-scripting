#!/usr/bin/env bash
# 
# Reemplazo de subcadenas, que considere diferencias entre minúsculas y mayúsculas, 
#  pero ignore acentos.
# Recibe dos cadenas, y cada aparición de cadena1 debe reemplazarse por la cadena2.
# Ejemplo:
# cadena1: tre cadena2: TRE
# las palabras: enTrepiso, entretenido, intrépido
# pasan a: enTrepiso, enTREtenido, inTREpido
# 

set -e

read -p "Ingrese cadena1: " STR1
read -p "Ingrese cadena2: " STR2

RESULT=$(
  sed "s/$STR1/$STR2/i" $1
)

echo "$RESULT"