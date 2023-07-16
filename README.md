SysOps Test
===========

This repository contains the necessary code to deploy an infrastructure that supports a web application development lifecycle. The infrastructure includes the deployment of an EKS cluster, an ArgoCD instance for managing applications, and two applications to handle specific requests.

Project considerations
----------------------

This solution is based on 3 terraform projects: eks, argocd, and applications.

- 1) `eks`: Provides the EKS cluster creation.
- 2) `argocd`: Installs ArgoCD.
- 3) `applications`: Sets up the ArgoCD applications.

It will provide only 2 ALB for each cluster:

- ArgoCD LoadBalancer
- Applications LoadBalancer (with prefixes /statics.html and /api)

To expedite the build of your environment, I haven't utilized an S3 backend for Terraform. However, it's important to emphasize that using an S3 backend is highly recommended.

Directory Structure
-------------------

The directory structure for this project is as follows:

- `main.tf`: The main Terraform configuration file for the overall infrastructure setup.

- `variables.tf`: This file contains the variable declarations used in the main Terraform configuration file.

- `outputs.tf`: Defines the outputs that should be displayed after Terraform applies the configuration.

- `modules`: This directory contains sub-modules for each component of the infrastructure setup.

  - `eks`: Terraform module for setting up the EKS cluster.
  - `argocd`: Terraform module for deploying the ArgoCD instance.
  - `environments`: This directory contains separate directories for each environment (production, stage, dev).

  - Inside each environment directory, there are `.tfvars` files specific to that environment, which provide values for the variables declared in `variables.tf`.
  - `backend.tfvars` files define the backend configuration for each environment.

Usage
-----

1. Set up AWS credentials with appropriate permissions for Terraform.
2. Update the necessary variables in the `main.tf` and `variables.tf` files as per your requirements.
3. Customize the specific environment configurations by updating the `.tfvars` files in the `environments` directory.

Automatic apply & destroy:

IMPORTANT: The following scripts use -auto-approve Caution: Scripts use "-auto-approve". It automatically approves changes. Review carefully before running. Test and verify changes to avoid risks.

1. Run `chmox +x` and `plan.sh` to check the plan changes.
2. Run `chmox +x` and `create.sh` and choose the environment you want to create. It will deploy the EKS Cluster and deploy the Argo CD instance and applications.
3. Run `chmox +x` and `destroy.sh` and choose the environment you want to destroy.

If you prefer to execute it manually, please check `create.sh` and respect the execution order (eks, argocd, applications).

Related repos: [argo-applications](https://github.com/andyba2016/argo-applications)

Author: Andres Tarrio
Date: July, 2023

Thanks for this opportunity!!
