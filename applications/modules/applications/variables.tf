variable "namespace" {
  description = "The namespace for the main application"
  type        = string
}

variable "name" {
  description = "The name of the main application"
  type        = string
}

variable "path" {
  description = "The path to the main application in the repository"
  type        = string
}

variable "repository" {
  description = "The URL of the repository for the main application"
  type        = string
}

variable "branch" {
  description = "The target branch of the repository for the main application"
  type        = string
  default     = "master"
}