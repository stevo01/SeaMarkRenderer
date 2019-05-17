#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "usage: <run|build>"
    echo "commands:"
    echo "    run:     just start container (for debugging purposes)"
    echo "    update : start update procedure"
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

if [ "$1" = "update" ]; then
  cd workspace
  update.sh
  chmod a+w -R *
fi

exit 1
