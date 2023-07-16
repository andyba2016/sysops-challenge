variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "aws_region" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "us-west-2"
}




variable "endpoint_private_access" {
  description = "Indicates whether or not the EKS cluster's Kubernetes API server endpoint is private"
  type        = bool
  default     = false
}

variable "endpoint_public_access" {
  description = "Indicates whether or not the EKS cluster's Kubernetes API server endpoint is public"
  type        = bool
  default     = true
}

variable "desired_capacity" {
  description = "The desired capacity of the EKS worker node group"
  type        = number
  default     = 1
}

variable "min_capacity" {
  description = "The minimum capacity of the EKS worker node group"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "The maximum capacity of the EKS worker node group"
  type        = number
  default     = 3
}

variable "instance_types" {
  description = "List of EC2 instance types for EKS worker nodes"
  type        = list(string)
  default     = ["m5.large"]
}

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.27"
}


variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "vpc" {
  description = "VPC configuration"
  type = object({
    cidr_block = string
    subnets = map(object({
      cidr_block        = string
      availability_zone = string
    }))
  })
}
