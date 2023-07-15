RapidPro v7 Helm Chart
==================================

![CI Tests](https://github.com/ngendah/rapidpro-k8s/actions/workflows/linux.yaml/badge.svg)

RapidPro is an open source platform for visually building interactive messaging applications. For more on it refer to https://github.com/rapidpro/rapidpro.

### Introduction

This repo provides a chart to bootstraps RapidPro on a Kubernetes cluster using the Helm package manager.

### Getting started

To get started with the helm chart, you'll need;

1. A running cluster composed of;

    a. Kubernetes version 1.21+,

    b. Postgresql version 1.13+ and

    c. a Docker container registry either hosted locally or on the cloud.

2. This repository together with it's sub-repository. You can clone the repo by executing the following command;
    
    ```shell
       git clone --recurse-submodules https://github.com/ngendah/rapidpro-helm-chart 
    ```

    The repository has 2 subdirectories;

    a. `rapidpro` directory containing the helm chart,

    b. `extras` directory containing,
    
      * Dockerfiles for building the required images.

      * A start-up script to help quickly set up a cluster with all the necessary services.

#### Steps, for a local linux host:

** At the moment these steps have been verified on an Ubuntu 22.04.

1. Install the following pre-requisites;

   * Docker and Docker Compose
   * GNU Make
   * Helm
   * jq, The JSON processor
   * K3D
   * Kubectl 

2.  Stand up a cluster

   ```shell
   ./extras/cluster/run.sh install
   ```
   
   The cluster will be exposed on the localhost on port 8080.
   
3. Login to the Docker registry

   ```shell
   sudo docker login -u $(cat ./extras/cluster/registry.conf.d/username) $(cat ./extras/cluster/registry.conf.d/hostip)
   ```
   
4. Build and push images

   ```shell
   cd ./extras/images
   sudo make -e REGISTRY_HOST=$(cat ../cluster/registry.conf.d/hostip) -j3
   cd ../.. # change directory back to the project root
   ```
   
5. Export the path to `kubeconfig`

   ```shell
   export KUBECONFIG=./extras/cluster/kubeconfig 
   ```

   because relative paths break easily, it's recommended to use the full file path;

   ```shell
   export KUBECONFIG=$(pwd)/extras/cluster/kubeconfig
   ```

6.  Install the chart

   ```shell
   helm install rapidpro ./rapidpro/ --set global.databaseHost.postgres.host=$(cat ./extras/cluster/postgresql.conf.d/hostip) --set global.registry.host=$(cat ./extras/cluster/registry.conf.d/hostip)
   ```
   
7. Wait for the services to be in a running state;

   ```shell
   watch kubectl get pods
   ```
   
8. If all services are up and running, on the browser goto the url `localhost:8080/`.

### Credits

1. [RapidPro](https://github.com/rapidpro/rapidpro) project.

2. [Praekelt.org](https://github.com/praekeltfoundation) for the initial docker base images for [mailroom](https://github.com/praekeltfoundation/mailroom-docker) and [courier](https://github.com/praekeltfoundation/courier-docker).
