include "root" {
    path = find_in_parent_folders("root.hcl")
}
include "cloudfunctions" {
    path = "${get_repo_root()}/shared/cloudfunctions.hcl"
    expose = true
}
terraform {
    source = include.cloudfunctions.locals.source_base_url
}

dependency "vpc" {
    config_path = find_in_parent_folders("vpc")
}

inputs = {

    cloud_fn_map = [ {
    "name" = "hello_http"
    "entrypoint" = "hello_http"
    "runtime" = "python311"
    "source_dir" = "${get_terragrunt_dir()}/codefunctions/helloWorld"
    "trigger_http" = true
    "available_memory_mb" = 256
    "min_instances" = 0
    "timeout" = 60
    "ingress_settings" = "ALLOW_ALL"
    "variablesInject" = "true"
  }]
 
  bucket_name_cloud_function = "gcp-terragrunt-cloud-function-bucket"
  vpc_connector_name = dependency.vpc.outputs.vpc_connector_name
}
