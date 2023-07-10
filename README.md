RapidPro v7 Helm Chart
==================================

![CI Tests](https://github.com/ngendah/rapidpro-k8s/actions/workflows/linux.yaml/badge.svg)

RapidPro is an open source platform for visually building interactive messaging applications. For more refer to https://github.com/rapidpro/rapidpro.

### Introduction

This repo provides a chart to bootstraps RapidPro on a Kubernetes cluster using the Helm package manager.

### Getting started

1. A cluster composed of the following components;

    a. Kubernetes cluster

    b. A postgresql server and

    c. a container registry

2. Update helm chart values.

3. Deploy the helm chart.

### Credits

1. [RapidPro](https://github.com/rapidpro/rapidpro) project.

2. [Praekelt.org](https://github.com/praekeltfoundation) for the initial docker base images for [mailroom](https://github.com/praekeltfoundation/mailroom-docker) and [courier](https://github.com/praekeltfoundation/courier-docker).
