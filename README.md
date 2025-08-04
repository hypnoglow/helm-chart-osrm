# helm-chart-osrm

![Maintenance](https://img.shields.io/maintenance/yes/2025)

[Helm](https://helm.sh/) chart for [OSRM](https://github.com/Project-OSRM/osrm-backend).

Notable features:

- 🗺 Out-of-the-box map management, allowing to download and persist a map by the URI. Currently supports HTTP(S) and Google Cloud Storage,
others (AWS S3, etc) incoming.
- 🖴 Runs as a StatefulSet so each instance keeps its own maps in PersistentVolume.

By default, this chart deploys [osrm-routed](http://project-osrm.org/docs/v5.22.0/api/) server, but you can replace
it with your own implementation (e.g. based on `libosrm`) if you want. 

## Install

```bash
helm repo add hypnoglow https://hypnoglow.github.io/helm-charts

# For Helm v2
helm install hypnoglow/osrm --name osrm

# For Helm v3
helm install osrm hypnoglow/osrm
```

## Configuration

### Map Management and Source Providers (modes)

By default chart has map management enabled, with `http` as a source provider. This allows you to simply specify
publicly-accessible url to the map you want to download:

```yaml
map:
  http:
    uri: https://download.openstreetmap.fr/extracts/europe/monaco.osm.pbf
```

There are few so-called "source providers" you can use to download maps from:

- `http` - for HTTP endpoints 
- `gcs` - for Google Cloud Storage

#### Google Cloud Storage

To enable gcs as a source provider, use `--set map.source=gcs`.

By default the chart is configured to download maps from private buckets. If your bucket is public, you can disable
credentials requirement: `--set map.gcs.googleApplicationCredentials.enabled=false`.

To access maps in private bucket you need credentials. The chart is already configured to use secret named `osrm-google-application-credentials`
and key `credentials.json`. This secret is not managed by the chart. You can create secret from credentials file as follows:

```bash
kubectl create secret generic osrm-google-application-credentialss \
    --from-file=credentials.json=/path/to/credentials.json \
    --dry-run -o yaml | kubectl apply -f -
```

Example `values.yaml` customization for gcs provider:

```yaml
map:
  source: gcs
  gcs:
    version: "20200226-1"
    uri: "gs://my-osrm-maps/20200226-1/map.tar.gz"
```
