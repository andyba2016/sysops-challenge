# Create the EKS cluster
resource "aws_eks_cluster" "main_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster_role.arn
  version  = var.k8s_version # Update with your desired Kubernetes version
  vpc_config {
    subnet_ids              = values(aws_subnet.public_subnet)[*].id
    endpoint_private_access = false
    endpoint_public_access  = true
  }

  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]

}

# Create the EKS cluster node group
resource "aws_eks_node_group" "main_node_group" {
  cluster_name    = aws_eks_cluster.main_cluster.name
  node_group_name = "${terraform.workspace}-main_node_group"
  node_role_arn   = aws_iam_role.eks_cluster_role.arn
  subnet_ids      = values(aws_subnet.public_subnet)[*].id

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
