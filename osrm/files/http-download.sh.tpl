#!/usr/bin/env bash
set -euo pipefail

ensure_dependency() {
  if ! which "$1" &>/dev/null ; then
    echo "$1 not found"
    exit 1
  fi
}

ensure_dependency wget
ensure_dependency md5sum

version="{{ .Values.map.http.version | default "unversioned" }}"
uri="{{ .Values.map.http.uri }}"
file="{{ base .Values.map.http.uri }}"
checkMD5="{{ if .Values.map.http.checkMD5 }}1{{ end }}"

mkdir -p "/data/maps/${version}"
cd "/data/maps/${version}"

if [ ! -r downloaded.lock ]; then
  wget "${uri}"

  if [ -n "${checkMD5}" ]; then
    wget "${uri}.md5"
    md5sum -c "${file}.md5"
    rm "${file}.md5"
  fi

  # Rename the file so we have predictable argument name in statefulset.
  echo "Rename ${file} -> map.osm.pbf"
  mv "${file}" "map.osm.pbf"

  touch downloaded.lock
fi

echo "Done!"
exit 0
