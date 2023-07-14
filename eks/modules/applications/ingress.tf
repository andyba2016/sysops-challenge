# resource "kubernetes_ingress_v1" "api" {
#   wait_for_load_balancer = true
#   metadata {
#     name      = "${terraform.workspace}-alb"
#     namespace = "api"
#     annotations = {
#       "alb.ingress.kubernetes.io/load-balancer-name" = "${terraform.workspace}-alb"
#       "kubernetes.io/ingress.class"                  = "alb"
#       "alb.ingress.kubernetes.io/scheme"             = "internet-facing"
#       "alb.ingress.kubernetes.io/listen-ports"       = "[{\"HTTP\": 80}]"
#       "alb.ingress.kubernetes.io/target-type"        = "ip"
#       "alb.ingress.kubernetes.io/group.name"         = "${terraform.workspace}-external"
#     }
#   }
#   spec {
#     ingress_class_name = "alb"
#     rule {
#       http {
#         path {
#           path      = "/api"
#           path_type = "Prefix"
#           backend {
#             service {
#               name = "api_application"
#               port {
#                 number = 80
#               }
#             }
#           }
#         }
#       }
#     }
#   }
# }