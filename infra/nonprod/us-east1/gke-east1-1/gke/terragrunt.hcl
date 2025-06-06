include "root" {
    path = find_in_parent_folders("root.hcl")
}
include "cloudfunctions" {
    path = "${get_repo_root()}/shared/gke.hcl"
    expose = true
}
terraform {
    source = include.cloudfunctions.locals.source_base_url
}

dependency "vpc" {
    config_path = find_in_parent_folders("vpc")

    mock_outputs = {
        vpc_id = "gke-east1-1-vpc-connector"
    }
}

inputs = {

  
#   vpc_connector_name = dependency.vpc.outputs.vpc_connector_name
}
