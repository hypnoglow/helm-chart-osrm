# Example: map provider HTTP with MD5 check

*Paths are relative to the repository root*

```shell script
helm upgrade osrm-map-http-md5 ./osrm \
    --install --namespace testing \
    --wait --atomic --timeout 600 \
    --values ./examples/map-http-md5/values.yaml
```
