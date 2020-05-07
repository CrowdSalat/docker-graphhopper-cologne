# graphhopper docker image cologne

Provides a docker image which starts a [graphhopper](https://github.com/graphhopper/graphhopper/tree/0.13) server which is configured for calculating bike routes in cologne.

- The image uses the version [0.13 of graphhopper](https://graphhopper.com/public/releases/graphhopper-web-0.13.0.jar)
- The map data is downloaded from [Geofabrik](https://download.geofabrik.de/europe/germany/nordrhein-westfalen/koeln-regbez.html)
- The config is downloaded from [official github repository](https://raw.githubusercontent.com/graphhopper/graphhopper/0.13/config-example.yml) and edited for usage with bike
- The container takes between 850mb and 1gb of memory and takes around 86 seconds to startup. 

**The official [docker image from graphhopper](https://hub.docker.com/r/graphhopper/graphhopper/) with tag 1.0-pre38 only takes around 22 seconds to startup.**

## usage

```shell
# build 
docker build . -t crowdsalat/graphhopper-cologne:latest

# run 
docker run -d -p 8989:8989 --name graphhopper-cologne crowdsalat/graphhopper-cologne
```