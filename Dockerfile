FROM graphhopper/graphhopper:1.0-pre38

COPY bike_config.yml /graphhopper/config.yml
COPY koeln-regbez-latest.osm.pbf /data/koeln-regbez-latest.osm.pbf

CMD [ "/data/koeln-regbez-latest.osm.pbf" ]