#!/bin/bash

echo "Downloading system regions data for CitiBike..."
wget -q https://gbfs.lyft.com/gbfs/2.3/bkn/en/system_regions.json -O citibike_system_regions.json
echo "region_id, name" > citibike_system_regions.csv
cat citibike_system_regions.json | jq -r '.data.regions[] | [.region_id, .name] | @csv' >> citibike_system_regions.csv

echo "Downloading system regions data for Divvy..."
wget -q https://gbfs.lyft.com/gbfs/2.3/chi/en/system_regions.json -O divvy_system_regions.json
echo "region_id, name" > divvy_system_regions.csv
cat divvy_system_regions.json | jq -r '.data.regions[] | [.region_id, .name] | @csv' >> divvy_system_regions.csv
