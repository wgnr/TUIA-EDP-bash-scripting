# syntax=docker/dockerfile-upstream:master-labs
FROM bash

LABEL maintainer Juan Wagner - UNR - FCEIA - TUIA - EDP

ENV HOME=/app

ENV SCRIPT_PATH=$HOME/scripts

WORKDIR $HOME

ADD --keep-git-dir=false https://github.com/wgnr/TUIA-EDP-bash-scripting.git $HOME

RUN chmod +x $SCRIPT_PATH/* $HOME/main.sh

CMD [ "bash", "/app/main.sh" ]