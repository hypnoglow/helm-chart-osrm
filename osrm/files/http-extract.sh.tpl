#!/bin/bash
set -euo pipefail

cd /data/maps

if [ ! -r extracted.txt ]; then
  fname_pbf="{{ include "osrm.map.http.filename-pbf" . }}"
  fname_osrm="{{ include "osrm.map.http.filename-osrm" . }}"

  osrm-extract -p /opt/car.lua $fname_pbf
  osrm-partition $fname_osrm
  osrm-customize $fname_osrm

  touch extracted.txt
fi

echo "Done!"
exit 0
