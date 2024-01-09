variable "project" {
  description = "The ID of the project where this module will be created"
  type        = string
}

variable "prefix" {
  description = "Name prefix for the cdn resources"
  type        = string
  default     = "cdn"
}

variable "labels" {
  description = "The lables to attach to the resources"
  type        = map(string)
  default     = {}
}

variable "bucket_name" {
  description = "The name of the bucket that will be the backend for our CDN"
  type        = string
}

variable "domain" {
  description = "The domain of your frontend application"
  type        = string
}

variable "description" {
  description = "An optional description of this resource"
  type        = string
  default     = ""
}
##############################################################################
# GLOBAL PUBLIC IP ADDRESS
##############################################################################

variable "ip_version" {
  description = "The IP version of cdn public address"
  type        = string
  default     = "IPV4"
}

variable "address_type" {
  description = "The address type of cdn public address"
  type        = string
  default     = "EXTERNAL"
}

##############################################################################
# GLOBAL FORWARDING RULE
##############################################################################

variable "ip_protocol" {
  description = "The type of protocole to global forwarding rule"
  type        = string
  default     = "TCP"
}

variable "port_range" {
  description = "The port range to global forwarding rule"
  type        = string
  default     = "443"
}

##############################################################################
# DNS RECORD VARIABLES
##############################################################################

variable "create_dns_record" {
  description = "Create the DNS record set to the frontend"
  type        = bool
  default     = false
}

variable "dns_managed_zone" {
  description = "The managed zone of DNS"
  type        = string
  default     = ""
}

variable "dns_record_type" {
  description = "The type of DNS record"
  type        = string
  default     = "A"
}

variable "dns_ttl" {
  description = "Time to Live (TTL) for DNS record"
  type        = number
  default     = 300
}

variable "dns_cdn_domain" {
  description = "Time CDN dashboard Domain"
  type        = string
  default     = ""
}
