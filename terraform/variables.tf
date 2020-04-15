// variable "do_token" {

//     description = "Digital Ocean token, use it as Environment variable; `TV_VAR_do_token=<your-do-token>` "

// }

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