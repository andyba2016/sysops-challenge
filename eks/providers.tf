provider "aws" {
  region = "us-west-2" # Update with your desired region
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
terraform {
  required_version = ">= 1.4.2"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "= 2.5.1"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  #config_context = "my-context"
}
