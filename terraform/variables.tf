variable "cluster_name"{

    description = "Desired Name for the cluster"
    default = "my-k8s"
}

variable "region" {
    description = "Desired region to create your cluster"
    default = "nyc1"
}
variable "node_size" {
    description = "Size of K8s worker node"
    default = "s-1vcpu-1gb"
}

variable "slug_version" {
    description = "Version of the D.O Slug"
}
variable "min_nodes" {
    description = "Min. Number of worker nodes when auto-scaling is enabled"
    default = 1
}

variable "max_nodes" {
    description = "Max. Number of worker nodes when auto-scaling is enabled"
    default = 2
}