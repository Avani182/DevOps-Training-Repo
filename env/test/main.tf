module "s3_test" {
  source      = "../../modules/s3"
  bucket_name = var.bucket_name
  tag_name    = var.tag_name
  env_name    = var.env_name
}

module "sns_test" {
  source         = "../../modules/sns"
  sns_topic_name = var.sns_topic_name
}