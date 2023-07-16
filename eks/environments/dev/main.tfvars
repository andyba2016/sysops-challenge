# main.tfvars

cluster_name = "eks-cluster-dev"

desired_capacity = 1
min_capacity     = 1
max_capacity     = 3
instance_types   = ["m5.large"]
k8s_version      = "1.27"


#networking
vpc_cidr_block            = "192.168.0.0/16"
subnet1_cidr_block        = "192.168.0.0/24"
subnet1_availability_zone = "us-west-2a"
subnet2_cidr_block        = "192.168.1.0/24"
subnet2_availability_zone = "us-west-2b"
