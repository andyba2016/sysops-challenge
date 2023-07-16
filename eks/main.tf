# Create the EKS cluster
module "eks_cluster" {
  source           = "./modules/eks"
  cluster_name     = var.cluster_name
  vpc              = local.vpc
  instance_types   = var.instance_types
  desired_capacity = var.desired_capacity
  min_capacity     = var.min_capacity
  max_capacity     = var.max_capacity
  k8s_version      = var.k8s_version
}
