#!/bin/bash

# start and stops the osm tile server

set -x

IMAGE_NAME="seamark_renderer"

VOLUMES_OPTS_RUN=" -v $(pwd)/volumes/tmp:/workspace/tmp \
                   -v $(pwd)/volumes/tiles:/workspace/tiles \
                   -v $(pwd)/volumes/log:/workspace/log \
                   -v $(pwd)/volumes/osm:/workspace/osm "

START_CMD="docker run --rm --detach --name $IMAGE_NAME $USER_OPTS $PORTS_OPTS $VOLUMES_OPTS_RUN $IMAGE_NAME run"
START_CMD_JSEARCH="docker run --rm --name $IMAGE_NAME $USER_OPTS $PORTS_OPTS $VOLUMES_OPTS_RUN $IMAGE_NAME jsearch"
START_CMD_JRENDER="docker run --rm --name $IMAGE_NAME $USER_OPTS $PORTS_OPTS $VOLUMES_OPTS_RUN $IMAGE_NAME jrender"

STOP_CMD="docker container kill $IMAGE_NAME"

case "$1" in
	start)
		$START_CMD
	;;
  stop)
		$STOP_CMD
	;;
  restart|force-reload)
		$STOP_CMD
	sleep 1
		$START_CMD
	;;
  build)
		docker build -t $IMAGE_NAME ./Docker
	;;
  connect)
		docker exec -i -t $IMAGE_NAME /bin/bash
	;;
  jsearch)
		$START_CMD_JSEARCH
  ;;
  jrender)
		$START_CMD_JRENDER
  ;;
  *)
	echo "Usage: docker.service.sh {build|start|stop|restart|connect|jsearch|jrender}" >&2
	exit 1
	;;
esac

exit 0
