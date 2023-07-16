
variable "nginx_repository" {
  description = "The repository URL for the nginx application"
  type        = string
}

variable "nginx_path" {
  description = "The path to the nginx application in the repository"
  type        = string
}

variable "nginx_branch" {
  description = "The target branch of the repository for the nginx application"
  type        = string
}

variable "nginx_namespace" {
  description = "The namespace for the nginx application"
  type        = string
}

variable "api_repository" {
  description = "The repository URL for the api application"
  type        = string
}

variable "api_path" {
  description = "The path to the api application in the repository"
  type        = string
}

variable "api_branch" {
  description = "The target branch of the repository for the api application"
  type        = string
}

variable "api_namespace" {
  description = "The namespace for the api application"
  type        = string
}

variable "cluster_name" {
  description = "The cluster name"
  type        = string
}

