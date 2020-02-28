# Example: map provider Google Cloud Storage

*Paths are relative to the repository root*

```shell script
helm upgrade osrm-gcs ./osrm \
    --install --namespace testing \
    --wait --atomic --timeout 600 \
    --values ./examples/map-gcs/values.yaml
```
