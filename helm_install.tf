resource "null_resource" "helm_install" {
  provisioner "local-exec" {
    command = <<EOT
    aws eks update-kubeconfig --name ${module.eks.cluster_name} --region ${var.region}
    helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
    helm repo update
    helm install my-otel-demo open-telemetry/opentelemetry-demo
    EOT
  }
  depends_on = [module.eks]
}