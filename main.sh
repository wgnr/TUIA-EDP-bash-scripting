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
  OPTIONS=$(ls $SCRIPT_PATH)
  OPTIONS_Q=$(echo "$OPTIONS$" | wc -w | awk '{print $NF}')

  echo "Scripts disponibles:"
  PS3="Seleccione el script a ejecutar (0 Salir) [1-$OPTIONS_Q]> "
  select OPTION in $OPTIONS;do
    # Input control
    [ "$REPLY" == "0" ] && echo "Saliendo ..." && break
    [ ${#OPTION} -eq 0 ] && echo "Opcion no valida" && continue

    # Read file path
    read -p "Ingrese el archivo a procesar ["$DEFAULT_TEXT"]: " TEXT_PATH

    TEXT_PATH=${TEXT_PATH:-$DEFAULT_TEXT}

    [ ! -f $TEXT_PATH ] && \
      echo "Archivo no encontrado, usando el default $DEFAULT_TEXT" && \
      TEXT_PATH=$DEFAULT_TEXT

    COMANDO_PATH="$SCRIPT_PATH/$OPTION"

    showScriptHelp $COMANDO_PATH

    $COMANDO_PATH $TEXT_PATH

    echo
  done

  echo
  echo "Chauchis"
}

clear
showMenu
