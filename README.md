# 📊 cncf-o11y-demo

## 🌟 Overview

This repository contains OpenTofu code to provision and manage a Grafana dashboard tailored for observability. The dashboard is designed to monitor metrics and logs from various sources, such as Prometheus and OpenSearch, in a cloud environment.

## 🚀 Features

- **Automated Infrastructure Setup:** The OpenTofu configuration sets up a Virtual Private Cloud (VPC) and an Elastic Kubernetes Service (EKS) cluster on AWS.
- **Grafana Dashboard as Code:** Define and deploy Grafana dashboards using OpenTofu, ensuring that your observability setup is version-controlled and reproducible.
- **Pre-configured Metrics and Logs Panels:** The dashboard includes panels for monitoring:
  - AWS EC2 instances via Prometheus.
  - Logs from OpenSearch to visualize real-time log data.
- **Integration with OpenTelemetry:** Includes a Helm chart installation to deploy OpenTelemetry components for distributed tracing and observability.

## 📁 Repository Structure

- `data.tf`: Data configuration.
- `ebs_csi.tf`: CSI configuration for EBS.
- `eks.tf`: EKS configuration.
- `helm_install.tf`: Helm installation.
- `locals.tf`: Local variables definition.
- `outputs.tf`: Specifies the outputs from the OpenTofu configuration, such as the cluster endpoint and security group IDs.
- `provider.tf`: Contains provider configurations, including AWS, Kubernetes, and Grafana.
- `terraform.tf`: Main configuration file for OpenTofu.
- `variables.tf`: Defines the variables used in the OpenTofu configuration, such as AWS region, cluster name, etc.
- `vpc.tf`: VPC configuration.
- `README.md`: This file, providing an overview of the repository and instructions for use.

## 🛠️ Usage

### Prerequisites

- **OpenTofu:** Install OpenTofu (>= 1.3) on your local machine.
- **AWS CLI:** Ensure you have the AWS CLI installed and configured with appropriate credentials.
- **Grafana API Key:** Obtain a Grafana API key for dashboard management.

### Steps to Deploy

1. **Clone the Repository**
    ```bash
    git clone https://github.com/omontero90/cncf-o11y-demo.git
    cd cncf-o11y-demo
    ```

2. **Configure Variables**
    Edit the `variables.tf` file to set your AWS region, cluster name, and Grafana details.

3. **Initialize OpenTofu**
    ```bash
    tofu init
    ```

4. **Apply the OpenTofu Configuration**
    ```bash
    tofu apply
    ```
    Review the changes OpenTofu plans to make and type `yes` to confirm.

### Access the Grafana Dashboard

Once the deployment is complete, you can access the Grafana dashboard using the URL provided in the OpenTofu output.

### Using the Makefile

This repository includes a Makefile to streamline various tasks such as cleaning up Terraform files, configuring AWS CLI, initializing and applying Terraform (OpenTofu) configuration, and setting up port forwarding for a Kubernetes service.

To use the Makefile, simply run the following commands:

- Clean up Terraform files:
    ```bash
    make clean
    ```

- Configure AWS CLI:
    ```bash
    make aws-config
    ```

- Initialize Terraform (OpenTofu):
    ```bash
    make terraform-init
    ```

- Apply Terraform (OpenTofu) configuration:
    ```bash
    make terraform-apply
    ```

- Wait for Kubernetes service to be ready:
    ```bash
    make kubectl-wait
    ```

- Set up port forwarding:
    ```bash
    make port-forward
    ```

## OpenTelemetry Demo

We will be working with an OpenTelemetry demo to verify logs, metrics, and traces. For more information, refer to the [OpenTelemetry documentation][docs].

### Access Demo Components

- Web store: [http://localhost:8080/](http://localhost:8080/)
- Grafana: [http://localhost:8080/grafana/](http://localhost:8080/grafana/)
- Load Generator UI: [http://localhost:8080/loadgen/](http://localhost:8080/loadgen/)
- Jaeger UI: [http://localhost:8080/jaeger/ui/](http://localhost:8080/jaeger/ui/)
- Flagd Configurator UI: [http://localhost:8080/feature](http://localhost:8080/feature)

### Expose Demo Components Using Service

You can expose the demo components using the service provided in the repository.

[docs]: https://opentelemetry.io/docs/demo/