# S3 bucket specific variables.
variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}
variable "tag_name" {
  description = "S3 bucket tag name"
  type        = string
}
variable "env_name" {
  description = "S3 bucket env name"
  type        = string
}

# Terraform provider specific variables.
variable "aws_profile_name" {
  description = "AWS profile name"
  type        = string
}
variable "aws_region_name" {
  description = "AWS region name"
  type        = string
}

# SNS Topic specific variable.
variable "sns_topic_name" {
  description = "SNS topic name"
  type        = string
}

