
# module "s3" {
#   source = "../../../modules/wasabi_bucket"

#   bucket_names = var.bucket_names
#   environment = var.environment
#    providers = {
#     wasabi = wasabi.wus1
#   }
# }


resource "wasabi_bucket" "my_buckets" {
  for_each = var.bucket_names

  bucket = each.value
  acl    = "private"
}

resource "wasabi_user" "my_users" {
for_each = var.users

name = each.value 
}