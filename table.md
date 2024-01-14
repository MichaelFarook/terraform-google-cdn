## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.84.0, < 6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.84.0, < 6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_backend_bucket.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_bucket) | resource |
| [google_compute_global_address.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_global_forwarding_rule.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule) | resource |
| [google_compute_managed_ssl_certificate.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_managed_ssl_certificate) | resource |
| [google_compute_target_https_proxy.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_https_proxy) | resource |
| [google_compute_url_map.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map) | resource |
| [google_dns_record_set.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_type"></a> [address\_type](#input\_address\_type) | The address type of cdn public address | `string` | `"EXTERNAL"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the bucket that will be the backend for our CDN | `string` | n/a | yes |
| <a name="input_create_dns_record"></a> [create\_dns\_record](#input\_create\_dns\_record) | Create the DNS record set to the frontend | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | An optional description of this resource | `string` | `""` | no |
| <a name="input_dns_cdn_domain"></a> [dns\_cdn\_domain](#input\_dns\_cdn\_domain) | Time CDN dashboard Domain | `string` | `""` | no |
| <a name="input_dns_managed_zone"></a> [dns\_managed\_zone](#input\_dns\_managed\_zone) | The managed zone of DNS | `string` | `""` | no |
| <a name="input_dns_record_type"></a> [dns\_record\_type](#input\_dns\_record\_type) | The type of DNS record | `string` | `"A"` | no |
| <a name="input_dns_ttl"></a> [dns\_ttl](#input\_dns\_ttl) | Time to Live (TTL) for DNS record | `number` | `300` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The domain of your frontend application | `string` | n/a | yes |
| <a name="input_ip_protocol"></a> [ip\_protocol](#input\_ip\_protocol) | The type of protocole to global forwarding rule | `string` | `"TCP"` | no |
| <a name="input_ip_version"></a> [ip\_version](#input\_ip\_version) | The IP version of cdn public address | `string` | `"IPV4"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | The lables to attach to the resources | `map(string)` | `{}` | no |
| <a name="input_port_range"></a> [port\_range](#input\_port\_range) | The port range to global forwarding rule | `string` | `"443"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Name prefix for the cdn resources | `string` | `"cdn"` | no |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project where this module will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip"></a> [external\_ip](#output\_external\_ip) | The external global address |
