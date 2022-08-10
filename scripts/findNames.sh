#!/usr/bin/env bash
#
# Identificación de nombres propios (se identifican sólo si están en este formato
# Nnnnnnnnn), aunque la palabra no sea un nombre propio realmente.
# Ejemplos: Mateo, Estonoesunnombre, Ana.
#

set -e

NAMES=$(grep -E "\b([[:upper:]][[:alpha:]]*)\b" -o $1)

echo -e "Listado de nombres propios:\n$NAMES"