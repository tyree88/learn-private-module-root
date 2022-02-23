terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

}

provider "aws" {
  region = var.region
}

module "module" {
  source  = "app.terraform.io/tyreepearson/module/aws"
  name    = var.name
  region  = var.region
  prefix  = var.prefix
  version = "1.0.0"
}
module "s3-webapp" {
  source  = "app.terraform.io/tyreepearson/s3-webapp/aws"
  name    = var.name
  region  = var.region
  prefix  = var.prefix
  version = "1.1.2"
}