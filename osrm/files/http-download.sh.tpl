#!/bin/sh
set -euo pipefail

cd /data/maps

if [ ! -r downloaded.txt ]; then
  wget {{ .Values.map.http.uri }}
  touch downloaded.txt
fi

{{- if .Values.map.http.checkMD5 }}
if [ ! -r checksum.txt ]; then
  wget {{ .Values.map.http.uri }}.md5
  md5sum -c {{ include "osrm.map.http.filename-pbf" . }}.md5
  touch checksum.txt
fi
{{- end }}

echo "Done!"
exit 0
