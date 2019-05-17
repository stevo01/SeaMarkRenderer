#!/bin/bash

# start and stops the osm tile server

set -x

IMAGE_NAME="seamark_renderer"

VOLUMES_OPTS_RUN=" -v $(pwd)/volumes/tmp:/workspace/tmp \
                   -v $(pwd)/volumes/tiles:/workspace/tiles \
                   -v $(pwd)/volumes/osm:/workspace/osm \
                   -v $(pwd)/volumes/logging:/workspace/logging \
                   -v $(pwd)/volumes/query:/workspace/query"

START_CMD="docker run --rm --detach --name $IMAGE_NAME $USER_OPTS $PORTS_OPTS $VOLUMES_OPTS_RUN $IMAGE_NAME run"
START_CMD_UPDATE="docker run --rm --name $IMAGE_NAME $USER_OPTS $PORTS_OPTS $VOLUMES_OPTS_RUN $IMAGE_NAME update"

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
  update)
		$START_CMD_UPDATE
  ;;
  *)
	echo "Usage: docker.service.sh {build|start|stop|restart|connect|update}" >&2
	exit 1
	;;
esac

exit 0
