#!/usr/bin/env bash
wget https://s3.amazonaws.com/mapbox/osm-qa-tiles/latest.country/united_states_of_america.mbtiles.gz
gunzip united_states_of_america.mbtiles.gz
wget https://s3.amazonaws.com/mapbox/tile-reduce-watchbot/mbtiles/tiger2016.mbtiles
node index.js usa-buffer.geojson > bbox.txt
filename="bbox.txt"
IFS=$'\n'
for next in `cat $filename`
do
    # echo "$next" 
    echo osmlint tigerdelta --bbox="$next" --zoom=12 united_states_of_america.mbtiles tiger2015.mbtiles #> tiger-delta-$next.json
done

cat  tiger-delta-*.tofix.json > tofix.json



