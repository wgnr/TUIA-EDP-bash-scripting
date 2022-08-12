#!/usr/bin/env bash
#
# Invertir minúsculas a mayúsculas, y viceversa, de todas las palabras.
# 

set -e

RESULT=$(
  tr '[:upper:][:lower:]' '[:lower:][:upper:]' < $1
)

echo "$RESULT"