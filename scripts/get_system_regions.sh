#!/bin/bash

wget -q https://gbfs.lyft.com/gbfs/2.3/bkn/en/system_regions.json -O system_regions.json
echo "region_id, name" > system_regions.csv
cat system_regions.json | jq -r '.data.regions[] | [.region_id, .name] | @csv' > citibike-system_regions.csv >> system_regions.csv
