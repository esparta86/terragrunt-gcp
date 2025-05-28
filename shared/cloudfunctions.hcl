locals {
    source_base_url = "git@github.com:esparta86/terraform_gcp_modules.git//cloud_functions?ref=master"
    env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
    account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
    region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

    name             = local.env_vars.locals.name
    environment      = local.env_vars.locals.environment
    project_id       = local.account_vars.locals.project_id
}



inputs = {
    environment = local.environment
    name        = local.name
    project_id  = local.project_id
    region      = local.region_vars.locals.gcp_region
}
