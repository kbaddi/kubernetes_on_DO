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

1. git clone https://github.com/kbaddi/kubernetes_on_DO.git
2. cd Terraform
3. Rename `terraformtfvars.copy` to `terraform.tfvars` and update the following values
    1. `cluster_name` - Desired name of the cluster.
    2. `region` - Desired region for your cluster. 
        To get the list of regions where Kubernetes cluster is available in Digital Ocean
    
          ```bash 
          doctl kubernetes options regions
          ```

    3. `slug_version` - This is the version of the Kubernetes version available in Digtial Ocean
    To get the latest Kuberneteres version run:

          ```bash
          doctl kubernetes options versions
          ```
    4. `node_size` - Size of the Working machine droplets (VMs)
       To get the list of sizes run:

          ```bash
          doctl compute size list
          ```
    5. `min_nodes` - Mininum number of nodes required in the cluster

    6. `max_nodes` - Maximum  number of nodes required in the cluster

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

7. Verify the deployment

```bash
doctl kubernetes cluster list
```

## Accessing your cluster

Once the terraform module is applied and the cluster is created, you could get the kubeconfig by running the below command

```bash
doctl kubernetes cluster kubeconfig save <cluster_name>  

# Example:
doctl kubernetes cluster kubeconfig save my-kluster
```

To Verify run

```bash
kubectl config current-context
```

You should the name of your context as `do-<region>-<cluster_name>`
For instance, if you have set `cluster_name` as `my-kluster` in the region `nyc1` you would see `do-nyc1-my-kluster` as your current context

Running the below should show you the nodes:

```bash
kubectl get nodes
```
