# variables.tf

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
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

variable "vpc_id" {
  description = "ID of the VPC to link the EKS cluster"
  type        = string
}

# variable "argocd_instance_name" {
#   description = "Name of the ArgoCD instance"
#   type        = string
# }

# variable "api_app_name" {
#   description = "Name of the API application"
#   type        = string
# }

# variable "statics_app_name" {
#   description = "Name of the statics application"
#   type        = string
# }

