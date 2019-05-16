# user guide renderer

# Files and folders
- volumes/log/log.txt <br>
 log files from renderer

- volume/tiles/* <br>
  generated tiles

- volume/osm/xapi.osm <br>
  latest seamarks extract from overpass api

- volume/osm/xapi.osm <br>
    latest seamarks extract from overpass api

- volume/osm/world.osm <br>
    backup from latest processed seamarks extract from overpass api

- Docker/dockerfile <br>
    includes dockerfile for creation of docker image

- docker-service.sh <br>
    shell script to build/start/stop docker image/container

# build docker container
docker-service.sh build

## get seamarks extract from overpass api
You can use local installation of overpass-api or online service of
overpass api to get an extract of the seamarks.

### overpass-api query
the query for overpass api

```
[timeout:3600];(rel['seamark:type'];>;way['seamark:type'];>;node['seamark:type'];);out meta;
```

### get data from local overpass-api instance
```
  echo "[timeout:3600];(rel['seamark:type'];>;way['seamark:type'];>;node['seamark:type'];);out meta;" | ./Overpass/osm3s_query > /volumes/osm/xapi.osm
  ```

### get data from overpass-api server
the following sample shows how to send query to online service:
```
   wget -O /volumes/osm/xapi.osm --post-file=./Docker/query.osm "http://overpass-api.de/api/interpreter"
```
(--timeout=3600)

### start jsearch application
```
docker-service jsearch
```

### start jrender application
```
docker-service jrender
```

# bookmarks
+ http://overpass-api.de/command_line.html
+ https://svn.openstreetmap.org/applications/editors/josm/plugins/seachart/jrender/
