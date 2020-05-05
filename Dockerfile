FROM graphhopper/graphhopper:1.0-pre38

COPY bike-config.yml /graphhopper/config.yml
ADD https://download.geofabrik.de/europe/germany/nordrhein-westfalen/koeln-regbez-latest.osm.pbf /data/koeln-regbez-latest.osm.pbf

CMD [ "/data/koeln-regbez-latest.osm.pbf" ]