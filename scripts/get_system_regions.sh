#!/bin/bash

echo "Downloading system regions data for CitiBike..."
wget -q https://gbfs.lyft.com/gbfs/2.3/bkn/en/system_regions.json -O json_files/citibike_system_regions.json
echo "region_id,name" > csv_files/citibike_system_regions.csv
cat json_files/citibike_system_regions.json | jq -r '.data.regions[] | [.region_id, .name] | @csv' >> csv_files/citibike_system_regions.csv

echo "Downloading system regions data for Divvy..."
wget -q https://gbfs.lyft.com/gbfs/2.3/chi/en/system_regions.json -O json_files/divvy_system_regions.json
echo "region_id,name" > csv_files/divvy_system_regions.csv
cat json_files/divvy_system_regions.json | jq -r '.data.regions[] | [.region_id, .name] | @csv' >> csv_files/divvy_system_regions.csv
