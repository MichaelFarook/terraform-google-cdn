# Google Cloud CDN Terraform module

The 'terraform-google-cdn' module simplifies the deployment and management of a Content Delivery Network (CDN) on Goolge Cloud. This module allows you to accelerate content delivery, enhance user experience and improve the performance of your web applications by leveraging Google's global network infrastructure.

## Usage

```hcl
module "cdn" {
  source = "github.com/MichaelFarook/terraform-google-cdn"

  bucket_name = "example-bucket"
  description = "CDN module"
  project     = "you-project"
  domain      = "example.com"

  # Conditional creation
  create_dns_record = true
  dns_cdn_domain    = "cdn-domain"
  dns_managed_zone  = "example-zone"

}
```
## Examples

- [Basic CDN creation](https://github.com/MichaelFarook/terraform-google-cdn/examples/basic)
- [Complete CDN creation](https://github.com/MichaelFarook/terraform-google-cdn/examples/complete)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Providers

| Name | Version |
|------|---------|
| <a name="google"></a> [google](#provider\_google) | >= 4.84.0, < 6 |
| <a name="google-beta"></a> [google-beta](#provider\_google-beta) | >= 4.84.0, < 6 |

## Requirements

| Name | Version |
|------|---------|
| <a name="google"></a> [google](#requirement\_google) | >= 4.84.0, < 6 |

## Resources

| Name | Version |
|------|---------|
| <a name="google_compute_backend_bucket.this"></a>[google_compute_backend_bucket.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_bucket) | resource |
| <a name="google_compute_url_map.this"></a> [google_compute_url_map.this"](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map) | resource |
| <a name="google_compute_managed_ssl_certificate.this"></a> [google_compute_managed_ssl_certificate.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/compute_managed_ssl_certificate) | resource |
| <a name="google_compute_global_address.this"></a> [google_compute_global_address.this"](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| <a name="google_compute_global_forwarding_rule.this"></a> [google_compute_global_forwarding_rule.this"](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule) | resource |
| <a name="google_dns_record_set.this"></a> [google_dns_record_set.this"](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | The ID of the project where this module will be created | `string` | `null` | yes |
| <a name="input_prefix"></a> [prefix](#input\_project) | Name prefix for the cdn resources | `string` | `cdn` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | The lables to attach to the resources | `map(string)` | `null` | no |
| <a name="input_bucket_name"></a> [bucket_name](#input\_bucket_name) | The name of the bucket that will be the backend for our CDN | `string` | `null` | yes |
| <a name="input_domain"></a> [domain](#input\_allocated\_domain) | The domain of your frontend application | `string` | `null` | yes |
| <a name="input_description"></a> [description](#input\_description) | An optional description of this resource | `string` | `null` | no |
| <a name="input_ip_version"></a> [ip_version](#input\_ip_version) | The IP version of cdn public address | `string` | `IPV4` | no |
| <a name="input_address_type"></a> [address_type](#input\_address_type) | The address type of cdn public address | `string` | `EXTERNAL` | no |
| <a name="input_ip_protocol"></a> [ip_protocol](#input\_ip_protocol) | The type of protocole to global forwarding rule | `string` | `TCP` | no |
| <a name="input_port_range"></a> [port_range](#input\_port_range) | The port range to global forwarding rule | `string` | `443` | no |
| <a name="input_create_dns_record"></a> [create_dns_record](#input\_create_dns_record) | Create the DNS record set to the frontend | `bool` | `false` | no |
| <a name="input_dns_managed_zone"></a> [dns_managed_zone](#input\_dns_managed_zone) | The managed zone of DNS | `string` | `null` | no |
| <a name="input_dns_record_type"></a> [dns_record_type](#input\_dns_record) | The type of DNS record | `string` | `A` | no |
| <a name="input_dns_ttl"></a> [dns_ttl](#input\_dns_ttl) | Time to Live (TTL) for DNS record | `string` | `300` | no |
| <a name="input_dns_cdn_domain"></a> [dns_cdn_domain](#input\_dns_cdn_domain) | Time CDN dashboard Domain | `string` | `null` | no |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip"></a> [external_ip](#outputs\_external_ip) | The external global static address |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module is maintained by [Michael Nakhtigal](https://github.com/MichaelFarook). 

## License

Apache 2 Licensed. See [LICENSE](https://github.com/MichaelFarook/terraform-google-cdn/LICENSE) for full details.

