RapidPro v7 Helm Chart
==================================

![CI Tests](https://github.com/ngendah/rapidpro-k8s/actions/workflows/linux.yaml/badge.svg)

RapidPro is an open source platform for visually building interactive messaging applications. For more on refer to https://community.rapidpro.io/.

### Introduction

This repo provides a chart to bootstraps RapidPro on a Kubernetes cluster using the Helm package manager.

### Getting started

To get started with the helm chart, you'll need;

1. A running cluster composed of;

    a. Kubernetes version 1.21+,

    b. Postgresql version 1.13+ and

    c. a container image registry either hosted locally or on the cloud.

2. This repository together with it's sub-repository.

    The repository has 2 directories;

    a. `rapidpro` directory containing the helm chart, and an

    b. `extras` directory containing,

      * Dockerfiles for building the required images.

      * A start-up script to help quickly stand up a cluster with all the necessary services running.

#### Steps, on the local host

    Linux:

1.  Install the following pre-requisites;

   * Docker and Docker Compose
   * GNU Make
   * Helm
   * jq, The JSON processor
   * K3D
   * Kubectl

2.  Clone the repository together with it's sub-repository.

    ```shell
    git clone --recurse-submodules https://github.com/ngendah/rapidpro-helm-chart
    ```

3.  Change directory to the root of the project.

    ```shell
    cd rapidpro-helm-chart
    ```

4.  Stand up a cluster

    ```shell
    ./extras/cluster/run.sh install
    ```

    The cluster load balancer will be exposed on the localhost on port 8080.

5.  Login to the Docker registry

    ```shell
    docker login -u $(cat ./extras/cluster/registry.conf.d/username) -p $(cat ./extras/cluster/registry.conf.d/passwd) $(cat ./extras/cluster/registry.conf.d/hostip)
    ```

6.  Build and push images

    ```shell
    cd ./extras/images
    make -e REGISTRY_HOST=$(cat ../cluster/registry.conf.d/hostip) -j3
    cd ../.. # change directory back to the project root
    ```

7.  Export the path to `kubeconfig`

    ```shell
    export KUBECONFIG=./extras/cluster/kubeconfig
    ```

    because relative paths break easily, I recommend using full file path;

    ```shell
    export KUBECONFIG=$(pwd)/extras/cluster/kubeconfig
    ```

8.  Install the chart

    ```shell
    helm install rapidpro ./rapidpro/ \
        --set global.databaseHost.postgres.host=$(cat extras/cluster/postgresql.conf.d/hostip) \
        --set global.registry.host=$(cat ./extras/cluster/registry.conf.d/hostip)
    ```

9.  Wait for the services to be in a running state;

    ```shell
    watch kubectl get pods
    ```

10. If all services are up and running, on the browser goto the url `localhost:8080/`.


### Credits

1. [RapidPro](https://github.com/rapidpro/rapidpro) project.

2. [Praekelt.org](https://github.com/praekeltfoundation) for the initial docker base images for [mailroom](https://github.com/praekeltfoundation/mailroom-docker) and [courier](https://github.com/praekeltfoundation/courier-docker).
