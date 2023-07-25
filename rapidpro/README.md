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
    The images are unique to the helm chart because they have start-up scripts needed to bootstrap each application.

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

| Name                                              | Description                                                     | Value                    |
|---------------------------------------------------|-----------------------------------------------------------------|--------------------------|
| `global.registry.host`                            | Global Docker image registry host                               | `""`                     |
| `global.imagePullSecrets`                         | Global Docker registry secret names as an array                 | `[]`                     |
| `global.adminCredentials.name`                    | Global secret name with RapidPro administrator credentials      | `"admin-credentials"`    |
| `global.adminCredentials.credentials.create`      | Global create a new RapidPro administrator credentials secret   | `"false"`                |
| `global.adminCredentials.credentials.user`        | Global RapidPro administrator user name                         | `""`                     |
| `global.adminCredentials.credentials.password`    | Global RapidPro administrator user password                     | `""`                     |
| `global.adminCredentials.credentials.email`       | Global RapidPro administrator user email                        | `""`                     |
| `global.databaseCredentials.name`                 | Global secret name with Postgresql login credentials            | `"database-credentials"` |
| `global.databaseCredentials.credentials.create`   | Global create a new Postgresql login credentials secret         | `"false"`                |
| `global.databaseCredentials.credentials.user`     | Global Postgresql login user name                               | `"temba"`                |
| `global.databaseCredentials.credentials.password` | Global Postgresql login user password                           | `""`                     |
| `global.databaseCredentials.credentials.database` | Global Postgresql login user database                           | `"temba"`                |
| `global.redis.url`                                | Global URL to the redis server, a default server is provisioned | `"redis://redis:6379"`   |
| `global.databaseHost.postgres.host`               | Global URI or IP to the postgresql host                         | `""`                     |
| `global.databaseHost.postgres.port`               | Global port to the postgresql server                            | `"5432"`                 |
| `global.labels`                                   | Global additional common labels                                 | `[]`                     |
| `global.annotations`                              | Global additional common annotations                            | `[]`                     |
