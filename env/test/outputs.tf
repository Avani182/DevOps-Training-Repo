# S3 bucket specific output.
output "s3_bucket_name" {
  value = module.s3_test.s3_bucket_name
}

# SNS Topic specific output.
output "sns_topic_name" {
  value = module.sns_test.sns_name
}