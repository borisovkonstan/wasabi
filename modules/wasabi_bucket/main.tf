resource "wasabi_bucket" "my_buckets" {
  for_each = var.bucket_names

  bucket = each.value
#   acl    = "private"
}