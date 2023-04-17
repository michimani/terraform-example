<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_evidently_feature.bool_feature](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/evidently_feature) | resource |
| [aws_evidently_feature.string_feature](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/evidently_feature) | resource |
| [aws_evidently_project.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/evidently_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bool_features"></a> [bool\_features](#input\_bool\_features) | List of boolean value features | <pre>map(object({<br>    description       = string<br>    variations        = map(bool)<br>    default_variation = string<br>    overrides         = map(string)<br>  }))</pre> | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environments short name | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name | `string` | n/a | yes |
| <a name="input_string_features"></a> [string\_features](#input\_string\_features) | List of string value features | <pre>map(object({<br>    description       = string<br>    variations        = map(string)<br>    default_variation = string<br>    overrides         = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->