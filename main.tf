locals {
  dns_name                = "${var.dns_cdn_domain}.${var.domain}"
  backend_bucket_name     = "${var.prefix}-dashboard-bucket"
  compute_url_map_name    = "${var.prefix}-url-map"
  managed_ssl_name        = "${var.prefix}-managed-certificate"
  target_https_proxy_name = "${var.prefix}-https-proxy"
  global_address_name     = "${var.prefix}-public-address"
  forwarding_rule_name    = "${var.prefix}-forwarding-rule"
}

##############################################################################
# BACKEND GCS CDN BUCKET
##############################################################################

resource "google_compute_backend_bucket" "this" {
  name        = local.backend_bucket_name
  description = var.description
  bucket_name = var.bucket_name
  project     = var.project
  enable_cdn  = true
}

##############################################################################
# URL MAP
##############################################################################

resource "google_compute_url_map" "this" {
  name            = local.compute_url_map_name
  description     = var.description
  default_service = google_compute_backend_bucket.this.self_link
  project         = var.project
}

##############################################################################
# MANAGED SSL/TLS CERT 
##############################################################################

resource "google_compute_managed_ssl_certificate" "this" {
  name        = local.managed_ssl_name
  description = var.description
  project     = var.project
  provider    = google-beta

  managed {
    domains = [local.dns_name]
  }
}

##############################################################################
# HTTPS PROXY
##############################################################################

resource "google_compute_target_https_proxy" "this" {
  name             = local.target_https_proxy_name
  description      = var.description
  url_map          = google_compute_url_map.this.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.this.self_link]
  project          = var.project
}

##############################################################################
# GLOBAL PUBLIC IP ADDRESS 
##############################################################################

resource "google_compute_global_address" "this" {
  provider     = google-beta
  name         = local.global_address_name
  description  = var.description
  ip_version   = var.ip_version
  address_type = var.address_type
  labels       = var.labels
  project      = var.project
}

##############################################################################
# GLOBAL FORWARDING RULE 
##############################################################################

resource "google_compute_global_forwarding_rule" "this" {
  provider              = google-beta
  name                  = local.forwarding_rule_name
  description           = var.description
  target                = google_compute_target_https_proxy.this.self_link
  ip_address            = google_compute_global_address.this.address
  ip_protocol           = var.ip_protocol
  load_balancing_scheme = "EXTERNAL"
  port_range            = var.port_range
  labels                = var.labels
  project               = var.project
}

##############################################################################
# create a dns record 
##############################################################################

resource "google_dns_record_set" "this" {
  count = var.create_dns_record ? 1 : 0

  managed_zone = var.dns_managed_zone
  name         = local.dns_name
  type         = var.dns_record_type
  ttl          = var.dns_ttl
  project      = var.project
  rrdatas      = [google_compute_global_address.this.address]
}
