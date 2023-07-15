RapidPro v7 Helm Chart
==================================

RapidPro is an open source platform for visually building interactive messaging applications. For more refer to https://github.com/rapidpro/rapidpro.

### Introduction

This repo provides a chart to bootstraps RapidPro on a Kubernetes cluster using the Helm package manager.

### Pre-requisites

* Kubernetes 1.19+

* postgresql 13+

* container registry repository with images;
    
    * RapidPro 7.4+

    * Courier 7.4+

    * mailroom 7.4.1+

    Docker files are available in a sub-repository to create these images.
    These images are unique to this helm chart since they have start-up scripts needed to bootstrap the applications.

### Installing the chart

```sh
helm install rapidpro github.com/ngendah/rapidpro-helm-chart/rapidpro
```

### Uninstalling the chart

```sh
helm uninstall rapidpro
```

### Parameters
#### Global parameters

| Name                                | Description                                                     | Value                    |
|-------------------------------------|-----------------------------------------------------------------|--------------------------|
| `global.registry.host`              | Global Docker image registry host                               | `""`                     |
| `global.imagePullSecrets`           | Global Docker registry secret names as an array                 | `[]`                     |
| `global.adminCredentialsSecret`     | Global secret name with RapidPro administrator credentials      | `"admin-credentials"`    |
| `global.databaseCredentialsSecret`  | Global secret name with Postgresql login credentials            | `"database-credentials"` |
| `global.redis.url`                  | Global URL to the redis server, a default server is provisioned | `"redis://redis:6379"`   |
| `global.databaseHost.postgres.host` | Global URI or IP to the postgresql host                         | `""`                     |
| `global.databaseHost.postgres.port` | Global port to the postgresql server                            | `"5432"`                 |
| `global.labels`                     | Global additional common labels                                 | `[]`                     |
| `global.annotations`                | Global additional common annotations                            | `[]`                     |
