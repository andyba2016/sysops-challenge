cluster_name = "eks-cluster-stage"

# Application: nginx
nginx_repository = "https://github.com/andyba2016/argo-applications.git"
nginx_path       = "statics"
nginx_branch     = "stage"
nginx_namespace  = "nginx"

# Application: api
api_repository = "https://github.com/andyba2016/argo-applications.git"
api_path       = "api"
api_branch     = "stage"
api_namespace  = "api"
