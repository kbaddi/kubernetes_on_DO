output "kubeconfig" {
    value = digitalocean_kubernetes_cluster.k8s.kube_config.0 
}