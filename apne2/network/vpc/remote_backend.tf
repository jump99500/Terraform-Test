terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Suwoong-TFC-Test"

    workspaces {
      name = "k8s-infra_apne2_network_vpc"
    }
  }
}
