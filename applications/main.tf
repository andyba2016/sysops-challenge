# Module instantiation for API application
module "argocd_application" {
  source     = "./modules/applications"
  for_each   = tomap(local.applications)
  namespace  = local.applications[each.key].namespace
  name       = local.applications[each.key].name
  path       = local.applications[each.key].path
  repository = local.applications[each.key].repository
  branch     = local.applications[each.key].branch
}