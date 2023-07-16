locals {
  applications = {
    nginx = {
      name       = "nginx"
      repository = var.nginx_repository
      path       = var.nginx_path
      branch     = var.nginx_branch
      namespace  = var.nginx_namespace
    }
    api = {
      name       = "api"
      repository = var.api_repository
      path       = var.api_path
      branch     = var.api_branch
      namespace  = var.api_namespace
    }
  }
}