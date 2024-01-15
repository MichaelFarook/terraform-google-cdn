locals {
  project_id = "my-project-id"
}

data "google_dns_managed_zone" "dns_zone" {}

resource "google_storage_bucket" "cdn_bucket" {
  name     = "cdn-bucket-${var.environment}"
  storage_class = "MULTI_REGIONAL"
  location = "US"
  project   = local.project_id
  
  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_iam_member" "cdn_bucket_public_access" {
  bucket = google_storage_bucket.cdn_bucket_name
  role   = "roles/storage.legacyObjectReader"
  member = "allUsers"
}

module "cdn" {
  source = "github.com/MichaelFarook/terraform-google-cdn"
  
  bucket_name = google_storage_bucket.cdn_bucket.name
  description = "CDN module"
  project     = local.project_id
  domain      = data.google_dns_managed_zone.dns_zone.dns_name
  
  create_dns_record = true
  dns_cdn_domain    = "example"
  dns_managed_zone  = data.google_dns_managed_zone.dns_zone.name
  
  labels = {
    terraform = true
    environment = development
    devops      = true
 }
}
