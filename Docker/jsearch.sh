#!/bin/bash

  # input files:
  #   next.osm  - includes seamark extract from planet.osm3s_query
  #               generated with overpass api osm3s_query
  #   world.osm - includes backup of latest processed seamark extract
  #
  # output data:
  #   world.osm - includes backup of latest processed seamark extract
  #               () just a copy of next.osm
  #   tmp/*.osm - osm files for jrenderer processing
  #

  set -x

  cd /workspace

  # create diff
  # note: this seems to be a kind of optimization if the process is not running
  #       the first time
  diff world.osm next.osm | grep id= | grep -v "<tag" > diffs

  # call the application
  echo "$(date) jsearch.jar: start " >> logging/log.txt
  java -jar jsearch.jar ./
  echo "$(date) jsearch.jar: process is done" >> logging/log.txt
