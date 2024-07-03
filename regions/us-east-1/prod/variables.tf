variable "bucket_names" {
  description = "Wasabi  bucket names"
  type        = set(string)
}

variable "users" {
  description = "IAM users"
  type        = set(string)
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "region" {
  type = string
  default = "us-east-1"
}