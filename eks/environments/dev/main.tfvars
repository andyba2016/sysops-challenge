# main.tfvars

cluster_name            = "eks-cluster-dev"
vpc_id                  = "eks-vpc"
subnet_ids              = ["eks-private-subnet", "eks-public-subnet"]
#security_group_ids      = ["security-group-id-1", "security-group-id-2"]
endpoint_private_access = false
endpoint_public_access  = true
desired_capacity        = 1
min_capacity            = 1
max_capacity            = 3
instance_types          = ["t2.small"]
k8s_version             = "1.27"
