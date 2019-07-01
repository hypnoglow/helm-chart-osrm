# helm-chart-osrm

[Helm](https://helm.sh/) chart for [OSRM](https://github.com/Project-OSRM/osrm-backend).

Features:

- Automatically downloads and persists a map that can be specified using Helm values
- Runs as a StatefulSet so each instance keeps its own maps in PersistentVolume

By default, this chart deploys [osrm-routed](http://project-osrm.org/docs/v5.22.0/api/) server, but you can replace
it with your own implementation (e.g. based on `libosrm`) if you want. 
