# Create the namespace
resource "kubernetes_namespace" "main_namespace" {
  metadata {
    name = var.namespace
  }
}

# Load ArgoCD application
resource "kubernetes_manifest" "main_application" {
  manifest = yamldecode(<<-EOF
    apiVersion: argoproj.io/v1alpha1
    kind: Application
    metadata:
      name: ${var.name}
      namespace: argocd
    spec:
      source:
        path: ${var.path}
        repoURL: ${var.repository}
        targetRevision: ${var.branch}
      destination:
        server: 'https://kubernetes.default.svc'
        namespace: ${kubernetes_namespace.main_namespace.metadata[0].name}
      project: default
      syncPolicy:
        automated:
          prune: true
          selfHeal: true
  EOF
  )
}