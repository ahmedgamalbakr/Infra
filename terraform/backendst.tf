terraform {
  backend "s3" {
    bucket = "iti-eks"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}