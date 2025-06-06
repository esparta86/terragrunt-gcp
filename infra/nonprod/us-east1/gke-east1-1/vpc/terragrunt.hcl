include "root" {
    path = find_in_parent_folders("root.hcl")
}

include "vpc" {
    path = "${get_repo_root()}/shared/vpc.hcl"
    expose = true
}


terraform {
    source = include.vpc.locals.source_base_url
}

inputs ={
   routing_mode_vpc = "REGIONAL"
   enable_vpc_connector    = false

}
