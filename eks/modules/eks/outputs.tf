output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = var.cluster_name
}

output "cluster" {
  value = aws_eks_cluster.main_cluster.id
}