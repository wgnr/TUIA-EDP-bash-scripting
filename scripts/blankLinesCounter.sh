#!/usr/bin/env bash
#
# Contador de líneas en blanco.
#

set -e

BLANK_LINES=$(grep -c -E '^$' $1)

echo "El archivo tiene $BLANK_LINES lineas en blanco."