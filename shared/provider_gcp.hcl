locals {
account_vars     = read_terragrunt_config(find_in_parent_folders("account.hcl"))    
project_id = local.account_vars.locals.project_id
gcp_region = local.account_vars.locals.gcp_region
}


generate "provider_gcp" {
    path = "provider_gcp.tf"
    if_exists = "overwrite_terragrunt"
  contents  = <<EOF
        provider "google" {
        project = "${local.project_id}"
        region = "${local.gcp_region}"
        }
    EOF
}


generate "required_providers" {
    path = "required_gcp.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
        terraform {
        required_providers {
            google = {
            source = ""registry.terraform.io/hashicorp/google"
            version = "5.28"
            }
        }
        }    
    EOF
}
