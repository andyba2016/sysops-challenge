# SysOps Test

This repository contains the necessary code to deploy an infrastructure that supports a web application development lifecycle. The infrastructure includes the deployment of an EKS cluster, an ArgoCD instance for managing applications, and two applications to handle specific requests.

## Directory Structure

The directory structure for this project is as follows:

├── main.tf
├── variables.tf
├── outputs.tf
├── modules
│ ├── eks
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── argocd
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── api-application
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── statics-application
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
└── environments
├── production
│ ├── main.tfvars
│ └── backend.tfvars
├── stage
│ ├── main.tfvars
│ └── backend.tfvars
└── dev
├── main.tfvars
└── backend.tfvars

markdown
Copy code

- `main.tf`: The main Terraform configuration file for the overall infrastructure setup.
- `variables.tf`: This file contains the variable declarations used in the main Terraform configuration file.
- `outputs.tf`: Defines the outputs that should be displayed after Terraform applies the configuration.

- `modules`: This directory contains sub-modules for each component of the infrastructure setup.
  - `eks`: Terraform module for setting up the EKS cluster.
  - `argocd`: Terraform module for deploying the ArgoCD instance.
  - `api-application`: Terraform module for deploying the application that handles `/api` requests.
  - `statics-application`: Terraform module for deploying the application that handles `/statics` requests.

- `environments`: This directory contains separate directories for each environment (production, stage, dev).
  - Inside each environment directory, there are `.tfvars` files specific to that environment, which provide values for the variables declared in `variables.tf`.
  - `backend.tfvars` files define the backend configuration for each environment.

## Usage

1. Set up AWS credentials with appropriate permissions for Terraform.
2. Update the necessary variables in the `main.tf` and `variables.tf` files as per your requirements.
3. Customize the specific environment configurations by updating the `.tfvars` files in the `environments` directory.
4. Run `terraform init` to initialize the Terraform workspace.
5. Run `terraform plan` to preview the changes that will be applied.
6. Run `terraform apply` to deploy the infrastructure.
7. Once the deployment is complete, you can access the applications and manage deployments using the provided resources.

## License

This project is licensed under the [MIT License](LICENSE).
Feel free to customize the README file based on your specific project requirements and provide additional details or instructions as needed.