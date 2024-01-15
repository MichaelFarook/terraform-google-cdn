variable "project" {
  description = "The ID of the project where this module will be created"
  type        = string
}

variable "cdn_distributions" {
  description = "List of distributions"
  type        = list(any)
  default     = ["first", "second"]
}
