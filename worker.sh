#!/usr/bin/env bash
export DATA=/mnt/data
mkdir $DATA
# chmod 777 -R $DATA
wget https://s3.amazonaws.com/mapbox/osm-qa-tiles/latest.country/united_states_of_america.mbtiles.gz -O $DATA/united_states_of_america.mbtiles.gz
gunzip  $DATA/united_states_of_america.mbtiles.gz
# wget https://s3.amazonaws.com/mapbox/tile-reduce-watchbot/mbtiles/tiger2015.mbtiles -O  $DATA/tiger2016.mbtiles
wget https://s3.amazonaws.com/mapbox/tile-reduce-watchbot/mbtiles/tiger2015.mbtiles -O  $DATA/tiger2015.mbtiles
node index.js $1 > $DATA/bbox.txt
filename="$DATA/bbox.txt"
IFS=$'\n'
for next in `cat $filename`
do
    osmlint tigerdelta --bbox="$next" --zoom=12 $DATA/united_states_of_america.mbtiles $DATA/tiger2015.mbtiles > $DATA/tiger-delta-$next.json
done
cat  $DATA/tiger-delta-*.json > $DATA/tiger.json
rm tiger-delta-*.json
osmlint-filter -g $DATA/tiger.json > $DATA/tiger.geojson
numFeatures=$(grep -o "Feature" $DATA/tiger.geojson | wc -l)
echo "num Features : $numFeatures"
cp $DATA/tiger.geojson $DATA/tigerdeltauadtb.geojson
