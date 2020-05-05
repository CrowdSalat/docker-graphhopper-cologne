# graphhopper_image_cologne

Provides a docker image which starts a [graphhopper](https://github.com/graphhopper/graphhopper/tree/0.13) server which is configured for calculating bike routes in cologne.

## usage

```shell
# build 
docker build . -t crowdsalat/cologne-graphhopper:latest

# run 
docker run -d -p 8989:8989 --name graphhopper_cologne crowdsalat/cologne-graphhopper

# run with redeuced memory footprint (do not know why, but if you only run "JAVA_OPTS=-Xms100m -Xmx1g" the other parameters are ommited by the start shell script)
docker run -d -p 8989:8989 -e "JAVA_OPTS=-Xms100m -Xmx1g -Ddw.server.application_connectors[0].bind_host=0.0.0.0 -Ddw.server.application_connectors[0].port=8989" --name graphhopper_cologne crowdsalat/cologne-graphhopper 
```
## backround info

The map data are downloaded from [geofabric](https://download.geofabrik.de/europe/germany/nordrhein-westfalen/koeln-regbez.html). When you want to use the official [graphhopper image](https://hub.docker.com/r/graphhopper/graphhopper) with this map and configured for bikes you can run the following command:

```shell
# expects a docker volume named graphhopper which contains the pbf file and the yml

docker run -d --name graphhopper \\
-v graphhopper:/data \\
-p 8989:8989 \\
graphhopper/graphhopper:1.0-pre38 /data/koeln-regbez-latest.osm.pbf --config /data/config.yml

```