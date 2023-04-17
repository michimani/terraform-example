terraform {
  required_providers {
    aws = "= 4.63.0"
  }

  required_version = "= 1.4.5"
}

provider "aws" {
  region = "ap-northeast-1"
}
