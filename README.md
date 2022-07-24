# graphhopper docker image cologne

Provides a docker image which starts a [graphhopper](https://github.com/graphhopper/graphhopper/tree/0.13) server which is configured for calculating bike routes in cologne. You can find the build image on [Dockerhub](https://hub.docker.com/repository/docker/crowdsalat/graphhopper-cologne-bike). An overview of the API of Graphhopper can be found [here](https://github.com/graphhopper/graphhopper/blob/5.1/docs/web/api-doc.md).

- The base image can be found on [Dockerhub](https://hub.docker.com/r/israelhikingmap/graphhopper)
- Dockerfile of base image on [Github](https://github.com/IsraelHikingMap/graphhopper-docker-image-push) 
- The map data is downloaded from [Geofabrik](https://download.geofabrik.de/europe/germany/nordrhein-westfalen/koeln-regbez.html)
- The config is downloaded from [official github repository](https://raw.githubusercontent.com/graphhopper/graphhopper/5.1/config-example.yml) and edited for usage with bike
- The container takes between 850mb and 1gb of memory and takes around 35 seconds to startup. 

## usage

You can run the image with `docker run -d -p 8989:8989 --name graphhopper-cologne-bike -v :gh-volume/data crowdsalat/graphhopper-cologne-bike`

To create a new version of the image you just need to tag a git version. When you create a git tag the new image is build on docker hub. One with the docker tag latest and on with the docker tag which corresponds to the the git tag. For local build run: `docker build . -t crowdsalat/graphhopper-cologne-bike`
