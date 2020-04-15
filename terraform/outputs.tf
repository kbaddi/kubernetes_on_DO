output "kubeconfig" {
    value = digitalocean_kubernetes_cluster.axl.kube_config.0 
}