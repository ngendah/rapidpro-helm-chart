Provision a local infrastructure using k3d and docker compose
================================================================

## Pre-requisites:

- [k3d](https://k3d.io/)

- [Docker and docker compose](https://docs.docker.com/engine/install/)

- jq

    For most linux distro its available on the distro package repositories.

## Steps:

1. Installation: 

    Execute the script `run.sh`.

    Options:

    - `install` : This will install on the local host the container registry self-signed certificate.

    - `stop` : This will stop and delete all the installed services.

    E.g. To start all services:

    ```sh
        ./run.sh install
    ```

    Installation results:

    a. A 3 node Kubernetes cluster

    b. A Postgresql server

    c. A container registry

    d. Configurations:

        - For the container registry they are located on the directory `registry.conf.d`

        - For the postgres server they are located on the directory `postgresql.conf.d`

2. Login to the container registry

    The directory `registry.conf.d` will contain;
    a. username,
    b. password and 
    c. the container registry host ip.

    Using this details login to the registry;

    ```sh
        docker login --username <name> <container-registry-ip>
    ```

With this setup, you can now easily

1. Build and push the images

2. Deploy Rapidpro helm charts

In case of any issues, checkout the github actions file on this repo `.github/workflows`.
