FROM israelhikingmap/graphhopper:5.1

WORKDIR /graphhopper

COPY config-example.yml bike-config-cologne.yml

ADD https://download.geofabrik.de/europe/germany/nordrhein-westfalen/koeln-regbez-latest.osm.pbf /data/koeln-regbez-latest.osm.pbf

EXPOSE 8989
ENV JAVA_OPS="-Xms250m -Xmx1g"

ENTRYPOINT [ "./graphhopper.sh", "-c", "bike-config-cologne.yml", "--input", "/data/koeln-regbez-latest.osm.pbf"]