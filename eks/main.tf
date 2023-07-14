module "eks_cluster" {
  source = "./modules/eks"
  cluster_name = var.cluster_name
  subnet_ids = var.subnet_ids
  vpc_id = var.vpc_id
}

# Module instantiation for ArgoCD instance
 module "argocd" {
   source = "./modules/argocd"
   depends_on = [ module.eks_cluster ]
 }

# Module instantiation for API application
 module "api_application" {
   source = "./modules/applications"
   depends_on = [ module.argocd ]
 }

# # Module instantiation for statics application
# module "statics_application" {
#   source = "./modules/statics-application"
# }


