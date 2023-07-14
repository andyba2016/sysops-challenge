resource "aws_eks_cluster" "main_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster_role.arn
  version  = "1.27" # Update with your desired Kubernetes version
  vpc_config {
    subnet_ids              = [aws_subnet.public_subnet.id, aws_subnet.public_subnet_2.id]
    endpoint_private_access = false
    endpoint_public_access  = true
  }

  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]

}

resource "aws_eks_node_group" "main_node_group" {
  cluster_name    = aws_eks_cluster.main_cluster.name
  node_group_name = "main_node_group"
  node_role_arn   = aws_iam_role.eks_cluster_role.arn
  subnet_ids      = [aws_subnet.public_subnet_2.id, aws_subnet.public_subnet.id]

  scaling_config {
    desired_size = var.desired_capacity
    min_size     = var.min_capacity
    max_size     = var.max_capacity
  }

  instance_types = var.instance_types
  version        = var.k8s_version

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly
  ]

}

resource "null_resource" "kubectl" {
    provisioner "local-exec" {
        command = "aws eks --region ${var.region} update-kubeconfig --name ${var.cluster_name}"
    }
    depends_on = [ aws_eks_node_group.main_node_group ]
}

resource "null_resource" "context" {
    provisioner "local-exec" {
        command = "kubectl config use-context ${aws_eks_cluster.main_cluster.arn}"
    }
    depends_on = [ null_resource.kubectl ]
}