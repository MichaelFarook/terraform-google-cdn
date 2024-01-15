output "external_ip" {
  description = "The external global address"
  value       = google_compute_global_forwarding_rule.this.ip_address
}
