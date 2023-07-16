provider "aws" {
  region = "us-west-2" # Update with your desired region
}

data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}


