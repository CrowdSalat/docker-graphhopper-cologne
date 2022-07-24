FROM israelhikingmap/graphhopper:5.1

WORKDIR /graphhopper

COPY config-example.yml bike-config-cologne.yml

ADD https://download.geofabrik.de/europe/germany/nordrhein-westfalen/koeln-regbez-latest.osm.pbf /data/koeln-regbez-latest.osm.pbf

EXPOSE 8989
ENV JAVA_OPTS="-Xms250m -Xmx500m"

ENTRYPOINT [ "./graphhopper.sh", "-c", "bike-config-cologne.yml", "--input", "/data/koeln-regbez-latest.osm.pbf"]