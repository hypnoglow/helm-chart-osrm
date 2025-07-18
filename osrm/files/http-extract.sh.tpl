#!/usr/bin/env bash
set -euo pipefail

ensure_dependency() {
  if ! which "$1" &>/dev/null ; then
    echo "$1 not found"
    exit 1
  fi
}

ensure_dependency osrm-extract
ensure_dependency osrm-partition
ensure_dependency osrm-customize

version="{{ .Values.map.http.version | default "unversioned" }}"
file_pbf="map.osm.pbf"
file_osrm="map.osrm"
profile="{{ .Values.map.profile | default "car" }}"
threads="{{ .Values.map.threads | default 8 }}"


cd "/data/maps/${version}"

if [ ! -r extracted.lock ]; then
  osrm-extract -p /opt/${profile}.lua "${file_pbf}" -t {threads}
  osrm-partition "${file_osrm}"
  osrm-customize "${file_osrm}"

  touch extracted.lock
fi

echo "Done!"
exit 0
