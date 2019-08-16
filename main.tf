variable "access_key" {}
variable "secret_key" {}
variable "region" { default = "ap-northeast-1" }

# S3バケット指定だけはどうにも変数使えん(面倒)
terraform {
  backend "s3" {
    bucket = "sample-project"
    key = "sample-project.terraform.tfstate"
    region = "ap-northeast-1"
    profile = "default"
  }
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

module "base" {
  region     = "${var.region}"
  source     = "./modules"
}
