## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.main_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.main_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_openid_connect_provider.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.aws_load_balancer_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.aws_load_balancer_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.cluster_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.aws_load_balancer_controller_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.main_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.public_subnet_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [helm_release.aws-load-balancer-controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [aws_iam_policy_document.aws_load_balancer_controller_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [tls_certificate.eks](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Name of the EKS cluster | `string` | `"us-west-2"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS cluster | `string` | n/a | yes |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | The desired capacity of the EKS worker node group | `number` | `1` | no |
| <a name="input_endpoint_private_access"></a> [endpoint\_private\_access](#input\_endpoint\_private\_access) | Indicates whether or not the EKS cluster's Kubernetes API server endpoint is private | `bool` | `false` | no |
| <a name="input_endpoint_public_access"></a> [endpoint\_public\_access](#input\_endpoint\_public\_access) | Indicates whether or not the EKS cluster's Kubernetes API server endpoint is public | `bool` | `true` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | List of EC2 instance types for EKS worker nodes | `list(string)` | <pre>[<br>  "m5.large"<br>]</pre> | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Kubernetes version | `string` | `"1.27"` | no |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | The maximum capacity of the EKS worker node group | `number` | `3` | no |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | The minimum capacity of the EKS worker node group | `number` | `1` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-west-2"` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | VPC configuration | <pre>object({<br>    cidr_block = string<br>    subnets = map(object({<br>      cidr_block        = string<br>      availability_zone = string<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_load_balancer_controller_role_arn"></a> [aws\_load\_balancer\_controller\_role\_arn](#output\_aws\_load\_balancer\_controller\_role\_arn) | n/a |
| <a name="output_cluster"></a> [cluster](#output\_cluster) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Kubernetes Cluster Name |
