
# module "s3" {
#   source = "../../../modules/wasabi_bucket"

#   bucket_names = var.bucket_names
#   environment = var.environment
#    providers = {
#     wasabi = wasabi.wus1
#   }
# }
locals {
 policy  = "151551515115"
 }

resource "wasabi_bucket" "my_buckets" {
  for_each = var.bucket_names

  bucket = each.value
  acl    = "private"
}

resource "wasabi_user" "my_users" {
for_each = var.users

name = each.value 
}

resource "wasabi_bucket_policy" "my_policy" {
  for_each = var.bucket_names

  bucket = each.value
  policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListAllMyBuckets"
      ],
      "Effect": "Allow",
      "Principal" : { 
      "AWS": [ 
      "arn:aws:iam::100000292017:root",
      "100000292017" 
    ]
},
      "Resource": "*"
    },
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${each.value}"
    }
  ]

}
EOT
}

output "bucket_ids" {
  value = [for bucket in wasabi_bucket.my_buckets : bucket.id]
}

output "bucket_arns" {
  value = [for bucket in wasabi_bucket.my_buckets : bucket.arn]
}

