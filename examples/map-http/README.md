# Example: map provider HTTP

*Paths are relative to the repository root*

```shell script
helm upgrade osrm-map-http ./osrm \
    --install --namespace testing \
    --wait --atomic --timeout 600 \
    --values ./examples/map-http/values.yaml
```
