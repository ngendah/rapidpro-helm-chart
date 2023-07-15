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

    The repository has 3 sub-directories;

    a. `rapidpro` directory containing the helm chart,

    b. `extras` directory containing,
    
      * Dockerfiles for building the required images.

      * A start up script to help quickly setup a cluster with all the necessary services.

      * A readme guide to help get started.

    c. `.github/workflows` containing github actions CI file which also serves as an additional guide on how to get started.

### Credits

1. [RapidPro](https://github.com/rapidpro/rapidpro) project.

2. [Praekelt.org](https://github.com/praekeltfoundation) for the initial docker base images for [mailroom](https://github.com/praekeltfoundation/mailroom-docker) and [courier](https://github.com/praekeltfoundation/courier-docker).
