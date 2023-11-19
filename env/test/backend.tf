terraform {
  backend "s3" {
    bucket = "glue-b1"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}