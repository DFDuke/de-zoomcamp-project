#!/bin/bash

wget -q https://gbfs.lyft.com/gbfs/2.3/bkn/en/station_information.json -O station_information.json
echo "region_id, station_id, capacity, name, short_name, lon, lat, rental_uris.android, rental_uris.ios" > station_information.csv
cat station_information.json | jq -r '.data.stations[] | [.region_id, .station_id, .capacity, .name, .short_name, .lon, .lat, .rental_uris.android, .rental_uris.ios] | @csv' >> station_information.csv
