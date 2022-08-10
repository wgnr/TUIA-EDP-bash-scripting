#!/usr/bin/env bash
#
# Invertir minúsculas a mayúsculas, y viceversa, de todas las palabras.
# 

set -e

RESULT=$(
  cat $1 | 
  tr '[:upper:][:lower:]' '[:lower:][:upper:]'
)

echo "$RESULT"