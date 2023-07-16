# ArgoCD module call
module "argocd" {
  source       = "./modules/argocd"
  cluster_name = var.cluster_name
}


