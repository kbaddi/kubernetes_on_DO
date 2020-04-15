# Terrraform Module to create a Kubernetes Cluster

This module creates Kubernetes cluster with Auto scaling option. Just replace the Slug version, droplet size and min and max number of nodes and run `terraform apply` and your cluster is ready

## Pre-requisites

1. Terraform - https://www.terraform.io/downloads.html
2. doctl - https://github.com/digitalocean/doctl.git

## Authentication

Login to Digital Ocean and create a `Personal Access Token (PAT)` by clicking on `API` under `Account` in the Left Panel. Ensure it has READ WRITE permissions

Copy the `PAT` to your clipboard

In your terminal, create an environment variable called `DIGITALOCEAN_TOKEN`

```bash
export DIGITALOCEAN_TOKEN="<DO_TOKEN>"
```

## Build your cluster
1. git clone ``
2. cd Terraform
3. Rename terraformfvars.copy and update the following values
    1. `slug_version` - This is the version of the Kubernetes version available in Digtial Ocean
    To get the latest Kuberneteres version run:

          ```bash
          doctl kubernetes options versions
          ```
    2.`node_size` - Size of the Working machine droplets (VMs)
       To get the list of sizes run:

        ```bash
        doctl compute size list
        ```
    3. `min_nodes` - Mininum number of nodes required in the cluster

    4. `max_nodes` - Maximum  number of nodes required in the cluster

4. Initialize the deployment 
   
   ```bash
   terraform init
   ```
5. Run Plan to see what will be created (optional)
    ```bash
    terraform plan
    ```
6. Apply the configuration to build the cluster
   
   ```bash 
   terraform apply
   ```