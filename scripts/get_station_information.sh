#!/bin/bash

echo "Downloading station information data for CitiBike..."
wget -q https://gbfs.lyft.com/gbfs/2.3/bkn/en/station_information.json -O json_files/citibike_station_information.json
echo "region_id,station_id,capacity,name,short_name,lon,lat,android_rental_uri,ios_rental_uri" > csv_files/citibike_station_information.csv
cat json_files/citibike_station_information.json | jq -r '.data.stations[] | [.region_id, .station_id, .capacity, .name, .short_name, .lon, .lat, .rental_uris.android, .rental_uris.ios] | @csv' >> csv_files/citibike_station_information.csv

echo "Downloading station information data for Divvy..."
wget -q https://gbfs.lyft.com/gbfs/2.3/chi/en/station_information.json -O json_files/divvy_station_information.json
echo "region_id,station_id,capacity,name,short_name,lon,lat,android_rental_uri,ios_rental_uri" > csv_files/divvy_station_information.csv
cat json_files/divvy_station_information.json | jq -r '.data.stations[] | [.region_id, .station_id, .capacity, .name, .short_name, .lon, .lat, .rental_uris.android, .rental_uris.ios] | @csv' >> csv_files/divvy_station_information.csv