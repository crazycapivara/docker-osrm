FROM osrm/osrm-backend

LABEL maintainer="crazycapivara@gmail.com"

ARG OSM_DATA_SOURCE="http://download.geofabrik.de/europe/iceland-latest.osm.pbf"

WORKDIR /data

RUN wget $OSM_DATA_SOURCE && \
	OSM_DATA=$(basename $OSM_DATA_SOURCE .osm.pbf) && \
	echo $OSM_DATA > /data/OSM_DATA && \
	osrm-extract -p /opt/car.lua ${OSM_DATA}.osm.pbf && \
	osrm-contract ${OSM_DATA}.osrm && \
	rm ${OSM_DATA}.osm.pbf

CMD OSM_DATA=$(cat /data/OSM_DATA) && \
	osrm-routed ${OSM_DATA}.osrm

