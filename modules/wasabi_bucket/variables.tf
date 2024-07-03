variable "bucket_names" {
  description = "Wasabi  bucket names"
  type        = set(string)
}

variable "environment" {
  description = "Environment"
  type        = string
}