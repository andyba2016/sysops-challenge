# Create the namespace
resource "kubernetes_namespace" "nginx_namespace" {
  metadata {
    name = "api"
  }
}

resource "kubernetes_namespace" "api_namespace" {
  metadata {
    name = "nginx"
  }
}

resource "kubernetes_manifest" "nginx_application" {
  manifest = yamldecode(<<-EOF
    apiVersion: argoproj.io/v1alpha1
    kind: Application
    metadata:
      name: nginx
      namespace: argocd
    spec:
      source:
        path: statics
        repoURL: https://github.com/andyba2016/argo-applications.git
        targetRevision: master
      destination:
        server: 'https://kubernetes.default.svc'
        namespace: nginx
      project: default
      syncPolicy:
        automated:
          prune: true
          selfHeal: true
  EOF
  )
}

resource "kubernetes_manifest" "api_application" {
  manifest = yamldecode(<<-EOF
    apiVersion: argoproj.io/v1alpha1
    kind: Application
    metadata:
      name: api
      namespace: argocd
    spec:
      source:
        path: api
        repoURL: https://github.com/andyba2016/argo-applications.git
        targetRevision: master
      destination:
        server: 'https://kubernetes.default.svc'
        namespace: api
      project: default
      syncPolicy:
        automated:
          prune: true
          selfHeal: true
  EOF
  )
}
