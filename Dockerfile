FROM osrm/osrm-backend

LABEL maintainer="crazycapivara@gmail.com"

ENV OSM_DATA "australia-latest"

WORKDIR /data

RUN wget http://download.geofabrik.de/australia-oceania/${OSM_DATA}.osm.pbf && \
	osrm-extract -p /opt/car.lua ${OSM_DATA}.osm.pbf && \
	osrm-contract ${OSM_DATA}.osrm && \
	rm ${OSM_DATA}.osm.pbf

CMD osrm-routed ${OSM_DATA}.osrm

