# CDN Complete example

This example shows how to create the CDN for website stored in cloud storage bucket using the Terraform module.

## Run Terraform

Create resources with terraform:

```bash
terraform init
terraform plan
terraform apply
```

To remove all resources created by terraform:

```bash
terraform destroy
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.84.0, < 6 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 4.84.0, < 6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.11.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cdn"></a> [cdn](#module\_cdn) | github.com/MichaelFarook/terraform-google-cdn | n/a |

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket.cdn_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.cdn_bucket_public_access](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_dns_managed_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/dns_managed_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cdn_distributions"></a> [cdn\_distributions](#input\_cdn\_distributions) | List of distributions | `list(any)` | <pre>[<br>  "first",<br>  "second"<br>]</pre> | no |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project where this module will be created | `string` | n/a | yes |
