#!/bin/bash
OSM_DATA_SOURCE=${1-europe/monaco-latest}
TAG=$(basename $OSM_DATA_SOURCE)
echo $OSM_DATA_SOURCE
echo $TAG
docker build --build-arg "OSM_DATA_SOURCE=$OSM_DATA_SOURCE" -t "crazycapivara/osrm-backend:$TAG" .

