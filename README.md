# tiger-delta-cities

Run Osmlint for detection of tiger delta, focusing in main cities in USA

### Install 

```
git clone https://github.com/Rub21/tiger-delta-cities.git
cd tiger-delta-cities
npm install
cd deploy
./install.sh

```

### Run


```
./worker.sh usa-cities.geojson

```

**Where:**

- usa-cities.geojson: the cities
- usa-cities-buffer0.1.geojson, cities with 0.1 distance 

### Output

The output will be a tiger.json file and tiger.geojson