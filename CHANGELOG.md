# Change log

## [0.4.0] - 2020-02-28

- Add a new map source provider: Google Cloud Storage. This allows downloading maps
from gcs bucket.
- Add versioning support for HTTP source provider.
- Add [examples](examples/) of OSRM deployments with various options.

## [0.3.0] - 2020-02-26

- **BREAKING:** map configuration in `values.yaml` changed, see [diff]() to migrate.
- Expose more configuration options: extra volumes, init container, etc.

## [0.2.0] - 2020-01-22

- Add `extraArgs` option to provide additional arguments to osrm.

## [0.1.0] - 2020-01-21

First public release.
