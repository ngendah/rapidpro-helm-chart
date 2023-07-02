Build and push images
-----------------------

## Prerquisites:

    - make

        on most distro install `build-essentials`

    - jq

    - docker/podman

## Steps:

1. Update `registry.json` file with the location of the registry server.

   Note:
   
   Login to the registry prior to building the images.

2. Build and push the images

    ```sh
        make -j3
    ```

Quick note:

The Rapidpro image is large, more than 1 GiB.
Registry location will need to consider issues such as container storage limits, network bandwidth/speed will be a few factors to consider.
