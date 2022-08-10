#!/usr/bin/env bash

set -e

SCRIPT_PATH="./scripts"
DEFAULT_TEXT=./lorem_ipsum.txt

function showScriptHelp(){
  basename $1
  END_HELP=$(cut -c 1 $1 | 
  uniq -c | 
  awk 'NR==1 {print $1}')

  awk -v END_HELP_LINE=$END_HELP 'NR>1 && NR<=END_HELP_LINE {print $0}' $1 |
  tr -d '#'
}

function showMenu(){
  NUM_REGEX="^[0-9]+$"
  OPTIONS=$(ls $SCRIPT_PATH)
  OPTIONS_Q=$(echo "$OPTIONS$" | wc -w | awk '{print $NF}')

  echo "Scripts disponibles:"
  PS3="Seleccione el script a ejecutar (0 Salir) [1-$OPTIONS_Q]> "
  select OPTION in $OPTIONS;do
    # Input control
    ! [[ $REPLY =~ $NUM_REGEX ]] && echo "Opcion no valida" && continue
    [ $REPLY -eq 0 ] && echo "Saliendo ..." && break
    [ $REPLY -gt $OPTIONS_Q ] && echo "Opcion no valida" && continue

    read -p "Ingrese el archivo a procesar ["$DEFAULT_TEXT"]: " TEXT_PATH

    TEXT_PATH=${TEXT_PATH:-$DEFAULT_TEXT}

    [ ! -f $TEXT_PATH ] && \
      echo "Archivo no encontrado, usando el default $DEFAULT_TEXT" && \
      TEXT_PATH=$DEFAULT_TEXT

    COMANDO_PATH="./scripts/$OPTION"

    showScriptHelp $COMANDO_PATH

    $COMANDO_PATH $TEXT_PATH

    echo
  done

  echo
  echo "Chauchis"
}

clear
showMenu
