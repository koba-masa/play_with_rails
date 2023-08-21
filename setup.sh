#!/bin/sh

mode=$1

if [ "${mode}" == "" ]; then
  echo "ERROR: mode is not specified."
  exit
fi

cp -rp docker_files/${mode}/* .
if [ "${mode}" == "local" ]; then
  cp -rp docker_files/${mode}/.envrc .
fi
