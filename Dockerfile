FROM osrm/osrm-backend

LABEL maintainer="Stefan Kuethe <crazycapivara@gmail.com>"

ARG OSM_DATA_SOURCE=europe/portugal-latest

WORKDIR /data

RUN wget http://download.geofabrik.de/${OSM_DATA_SOURCE}.osm.pbf && \
	OSM_DATA=$(basename $OSM_DATA_SOURCE) && \
	osrm-extract -p /opt/car.lua ${OSM_DATA}.osm.pbf && \
	osrm-contract ${OSM_DATA}.osrm && \
	rm ${OSM_DATA}.osm.pbf

CMD OSM_DATA=$(ls /data/*.osrm) && \
	osrm-routed $OSM_DATA

