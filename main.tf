terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
        random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  cloud {
    organization = "tyreepearson"
    workspaces {
      
      name = "private-module-root"
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
  version = "1.0.0"
}
module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "3.4.1"
  name = "ecs-module-7"
  # insert required variables here
}