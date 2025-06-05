locals {
  environment        = "nonprod"
  name               = "nonprod-gke1"
  cidr_subnet        = "10.0.4.0/22"
  cidr_k8s_pods      = "10.4.0.0/14"
  cidr_k8s_services  = "10.0.32.0/20"
  cidr_vpc_connector = "10.0.100.0/28"
}
