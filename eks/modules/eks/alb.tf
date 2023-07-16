provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.main_cluster.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.main_cluster.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.main_cluster.id]
      command     = "aws"
    }
  }
}

# Create the ALB controller
resource "helm_release" "aws-load-balancer-controller" {
  name = "${terraform.workspace}-aws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"
  version    = "1.4.1"

  set {
    name  = "clusterName"
    value = aws_eks_cluster.main_cluster.id
  }

  set {
    name  = "vpcId"
    value = aws_vpc.main_vpc.id
  }

  set {
    name  = "image.tag"
    value = "v2.4.2"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.aws_load_balancer_controller.arn
  }

  depends_on = [
    aws_eks_node_group.main_node_group,
    aws_iam_role_policy_attachment.aws_load_balancer_controller_attach
  ]
}
