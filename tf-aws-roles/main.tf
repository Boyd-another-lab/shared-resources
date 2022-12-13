terraform {
  required_version = "~> 1.3.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.38.0"
    }
  }

  backend "remote" {
    hostname     = "boydcompsol.scalr.io"
    organization = "env-uc2f5k4nbuhv6u0"
    workspaces {
      name = "shared-resources"
    }
  }
}
locals {
# boundary_arn              = "some_boundary"
 scalr_trusted_role_arn    = "-"
 #
   aws_account_id_scalr = 919814621061
   aws_account_id_lab   = 340526426765
  #
}

provider "aws" {
 region = "ca-central-1"
  default_tags {
    tags = {
      managed-by = "aws-lab-shared-resources"
    }
  }
 # alias = "aws-ca-central"
}
