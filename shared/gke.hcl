locals {
    #   source_base_url = "git@github.com:esparta86/terraform_gcp_modules.git//vpc?ref=master"
    source_base_url =   "/home/esparta86/personal-development/terraform_gcp_modules/gke"
  # source_base_url = "https://github.com/esparta86/terraform_gcp_modules.git"
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
    
}

inputs = {
    environment           = local.env_vars.locals.environment
     region                 = local.region_vars.locals.gcp_region
     project_id             = local.account_vars.locals.project_id
}
