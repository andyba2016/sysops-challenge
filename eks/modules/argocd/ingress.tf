# resource "kubernetes_ingress_v1" "argocd" {
#   wait_for_load_balancer = true
#   metadata {
#     name      = "${terraform.workspace}-argocd-alb"
#     namespace = "argocd"
#     annotations = {
#       "alb.ingress.kubernetes.io/load-balancer-name" = "${terraform.workspace}-argocd-alb"
#       "kubernetes.io/ingress.class"                  = "alb"
#       "alb.ingress.kubernetes.io/scheme"             = "internet-facing"
#       "alb.ingress.kubernetes.io/listen-ports"       = "[{\"HTTP\": 80}]"
#       "alb.ingress.kubernetes.io/target-type"        = "ip"
#       "alb.ingress.kubernetes.io/group.name"         = "${terraform.workspace}-external"
#       "alb.ingress.kubernetes.io/conditions.argogrpc" = jsonencode([
#         {
#           field = "http-header"
#           httpHeaderConfig = {
#             httpHeaderName = "Content-Type"
#             values         = ["application/grpc"]
#           }
#         }
#       ])
#     }
#   }
#   spec {
#     ingress_class_name = "alb"
#     rule {
#       http {
#         path {
#           backend {
#             service {
#               name = "argocd-server"
#               port {
#                 number = 80
#               }
#             }
#           }

#           path = "/*"
#         }
#       }
#     }
#   }
# }
