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

