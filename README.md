# user guide renderer

status: this project is under development and not usable at the moment
        (just for test purposes)

# build docker container
```
./docker-service.sh build
```

## get seamarks extract from overpass api
You can use local installation of overpass-api or online service of
overpass api to get an extract of the seamarks.

### overpass-api query
the query for overpass api

```
[timeout:3600];(rel['seamark:type'];>;way['seamark:type'];>;node['seamark:type'];);out meta;
```

### get osm extract from local overpass-api instance
```
echo "[timeout:3600];(rel['seamark:type'];>;way['seamark:type'];>;node['seamark:type'];);out meta;" | ./Overpass/osm3s_query > /volumes/osm/xapi.osm
```

### get osm extract from overpass-api server
the following sample shows how to send query to online service:
```
wget -O osm/xapi-planet.osm --timeout=600 --post-file=./query/overpass-api-planet.ql   "http://overpass-api.de/api/interpreter"
```

### start jsearch application

you need to
- copy the osm extract file to file volumes/osm/xapi.osm
- copy the backup file of latest render process to file volumes/osm/world.osm

and start the renderer with following command:
```
docker-service update
```

after that you can find the generated tiles in directory volumes/tiles/z/x/y.png

# Files and folders
- volumes/logging/log.txt <br>
  log files from renderer

- volume/tiles/* <br>
  generated tiles

- volume/osm/xapi.osm <br>
  latest seamarks extract from overpass api

- volume/osm/world.osm <br>
  backup from latest processed seamarks extract from overpass api

- Docker/dockerfile <br>
  includes dockerfile for creation of docker image

- docker-service.sh <br>
  shell script to build/start/stop docker image

![img](https://github.com/stevo01/SeaMarkRenderer/blob/master/workflow.png)

# bookmarks
+ http://overpass-api.de/command_line.html
+ http://overpass-turbo.eu/
+ https://svn.openstreetmap.org/applications/editors/josm/plugins/seachart/jrender/
+ https://svn.openstreetmap.org/applications/editors/josm/plugins/
+ https://github.com/OpenNauticalChart/renderer.git
+ https://github.com/openstreetmap/josm-plugins.git
