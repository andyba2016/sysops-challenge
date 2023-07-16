cluster_name = "eks-cluster-prod"

# Application: nginx
nginx_repository = "https://github.com/andyba2016/argo-applications.git"
nginx_path       = "statics"
nginx_branch     = "master"
nginx_namespace  = "nginx"

# Application: api
api_repository = "https://github.com/andyba2016/argo-applications.git"
api_path       = "api"
api_branch     = "master"
api_namespace  = "api"
