output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = var.cluster_name
}

output "subnet_1" {
  value = aws_subnet.public_subnet.id
}

output "subnet_2" {
  value = aws_subnet.public_subnet_2.id
}