#!/usr/bin/env bash
#
# Invertir minúsculas a mayúsculas, y viceversa, de todas las palabras.
# 

set -e

echo "$(cat $1 | tr '[:upper:][:lower:]' '[:lower:][:upper:]')"