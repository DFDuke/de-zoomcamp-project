#!/bin/bash

echo "Downloading station information data for CitiBike..."
wget -q https://gbfs.lyft.com/gbfs/2.3/bkn/en/station_information.json -O citibike_station_information.json
echo "region_id, station_id, capacity, name, short_name, lon, lat, rental_uris.android, rental_uris.ios" > citibike_station_information.csv
cat citibike_station_information.json | jq -r '.data.stations[] | [.region_id, .station_id, .capacity, .name, .short_name, .lon, .lat, .rental_uris.android, .rental_uris.ios] | @csv' >> citibike_station_information.csv

echo "Downloading station information data for Divvy..."
wget -q https://gbfs.lyft.com/gbfs/2.3/chi/en/station_information.json -O divvy_station_information.json
echo "region_id, station_id, capacity, name, short_name, lon, lat, rental_uris.android, rental_uris.ios" > divvy_station_information.csv
cat divvy_station_information.json | jq -r '.data.stations[] | [.region_id, .station_id, .capacity, .name, .short_name, .lon, .lat, .rental_uris.android, .rental_uris.ios] | @csv' >> divvy_station_information.csv