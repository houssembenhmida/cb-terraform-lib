# backend

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_s3_backend"></a> [aws\_s3\_backend](#module\_aws\_s3\_backend) | ../../modules/aws-s3-backend | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_preffix"></a> [preffix](#input\_preffix) | Preffix of the demo | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_name"></a> [backend\_name](#output\_backend\_name) | AWS S3 Bucket state |
| <a name="output_dynamo_table_lock_name"></a> [dynamo\_table\_lock\_name](#output\_dynamo\_table\_lock\_name) | AWS Dynamo Table lock |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
