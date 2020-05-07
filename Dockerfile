FROM openjdk:14-alpine

ENV ws /graphhopper

RUN mkdir ${ws}

WORKDIR ${ws}

COPY config-example.yml .

ADD https://graphhopper.com/public/releases/graphhopper-web-0.13.0.jar ./graphhopper.jar
ADD https://download.geofabrik.de/europe/germany/nordrhein-westfalen/koeln-regbez-latest.osm.pbf ./koeln-regbez-latest.osm.pbf

EXPOSE 8989

ENTRYPOINT [ "java", "-Xms250m", "-Xmx1g", "-jar", "graphhopper.jar", "server", "config-example.yml"]
