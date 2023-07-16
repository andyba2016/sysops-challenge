## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.main_application](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace.main_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch"></a> [branch](#input\_branch) | The target branch of the repository for the main application | `string` | `"master"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the main application | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace for the main application | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | The path to the main application in the repository | `string` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | The URL of the repository for the main application | `string` | n/a | yes |

## Outputs

No outputs.
