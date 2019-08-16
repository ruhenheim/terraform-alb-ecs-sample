variable "name" {
  default = "sample-project"
}

variable "dns" {
  default = "sample-project.com"
}

variable "bucket" {
  default = "sample-project"
}
variable "bucket_domain" {
  default = "sample-project.s3.amazonaws.com"
}

// 既存のsubnet使う(ので未使用)
# variable "subnet_public_a_cidr" {
#   default = "172.31.48.0/20"
# }

# variable "subnet_public_c_cidr" {
#   default = "172.31.64.0/20"
# }

// 既存のVPC使う
variable "vpc_id" {
  default = "vpc-yyyyyy"
}

// 既存のSecurityGroup使う
variable "security_group" {
  default = "sg-xxxxxx"
}

variable "region" {}

variable "alb_certificate_arn" {
  default = "arn:aws:acm:ap-northeast-1:aws_account_id:certificate/xxxxxx"
}
