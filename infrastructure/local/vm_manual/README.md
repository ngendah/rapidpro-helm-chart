Provision the infrastructure
-----------------------------------
This is a manual process but works!.

# What you need:

- MultiPass / LXD / Virtual Box / Virtual Machine Manager / Vagrant

- Ansible latest

# Steps:

1. Provision at least 4 ubuntu 22.04 server machines each with 3 vCPU's, 4GiB of memory and at least 10GiB of hard disk.

   Set the username as `ubuntu`.
   
2. Get the IP addresses of each of the machine.

2. SSH copy your public key to each of the machine

   ```sh
      ssh-copy-id ubuntu@<node-ip>
   ```

3. Edit `cfg/inventory.yml` file with the ip address of each machine.

4. Run the ansible playbook:

   ```sh
        ansible-playbook cfg/main.yml -i cfg/inventory.yml
   ```
   
   Wait for it to complete.

5. Copy the generated docker registry TLS certificate to the node that will build the docker images.

   The generated certificate directory is shown on the file `cfg/main.yml`, under the variable `registry_ca_dir`. The default is: `/tmp/rapidpro/registry-ca/docker/<ip>/ca.crt`
   
   If we assume that the images will be built locally, the location of the destination directory is `/etc/docker/certs.d/<ip-address-of-registry-node>/`.
   
   check by log-in to the docker registry: The credentials are located in the file `cfg/main.yml` file.

   ```sh
      docker login <ip>
   ```
   
   In case of any issues follow this guide: https://docs.docker.com/registry/insecure/#use-self-signed-certificates.
   
6. That's it!

