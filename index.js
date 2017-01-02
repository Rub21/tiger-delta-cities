var fs = require('fs');
var tb = require('turf-bbox');
var geojson = JSON.parse(fs.readFileSync(process.argv.slice(2)[0]).toString());
var result = {};
var features = geojson.features;
for (var i = 0; i < features.length; i++) {
  process.stdout.write('[' + tb(features[i]) + ']' + '\n');
}