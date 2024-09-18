module "s3_bucket" {
  for_each = var.bucket_names
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = each.value
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}


output "s3_arn" {
  value = [for s3_bucket in module.s3_bucket :  s3_bucket.s3_bucket_arn]


         // [ for Element in LIST : ELEMENT.attribute]
}

