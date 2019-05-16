#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "usage: <run|build>"
    echo "commands:"
    echo "    run:     just start container (for debugging purposes)"
    echo "    jsearch: start jsearch application"
    echo "    render:  start render application"
    echo ""
    exit 1
fi

if [ "$1" = "run" ]; then

  while :
    do
      sleep 1
    done
  exit 0

fi

if [ "$1" = "jsearch" ]; then
  cd workspace
  jserach.sh
fi


if [ "$1" = "render" ]; then
  cd workspace
  render.sh
fi

exit 1
