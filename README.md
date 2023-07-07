RapidPro v7 Helm Chart
==================================

![CI Tests](https://github.com/ngendah/rapidpro-k8s/actions/workflows/linux.yaml/badge.svg)

RapidPro is an open source platform for visually building interactive messaging applications. For more refer to https://github.com/rapidpro/rapidpro.

## Introduction

This repo provides a chart to bootstraps RapidPro on a Kubernetes cluster using the Helm package manager.

## Getting started:

1. Provision a Rapidpro cluster.

    a. Kubernetes

    b. A postgresql server database

    c. A container registry

    To help with this, the repo contains a script to provision the cluster using K3D and Docker compose. It's located in `infrastructure/local/k3d_compose`, refer to its readme to get started on it.

2. Update images container repository url and Helm chart values.

3. Build images and deploy the helm chart.

For more details refer to the github actions CI file.
