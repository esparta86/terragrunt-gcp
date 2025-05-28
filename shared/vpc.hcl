locals {
  source_base_url = "git@github.com:esparta86/terraform_gcp_modules.git//vpc?ref=master"
  # source_base_url = "https://github.com/esparta86/terraform_gcp_modules.git"
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  name             = local.env_vars.locals.name
  environment      = local.env_vars.locals.environment
  project_id       = local.account_vars.locals.project_id
  gcp_cidr_subnet  = local.env_vars.locals.cidr_subnet
  gcp_k8s_pods     = local.env_vars.locals.cidr_k8s_pods
  gcp_k8s_services = local.env_vars.locals.cidr_k8s_services

}

inputs = {
  environment            = local.environment
  name                   = local.name
  project_id             = local.project_id
  cidr_k8s_pods          = local.gcp_k8s_pods
  cidr_k8s_services      = local.gcp_k8s_services
  gcp_cidr_subnet        = local.gcp_cidr_subnet
  gcp_cidr_vpc_connector = local.env_vars.locals.cidr_vpc_connector
  region                 = local.region_vars.locals.gcp_region
}
