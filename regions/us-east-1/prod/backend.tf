terraform {
  required_providers {
    wasabi = {
      source = "thesisedu/wasabi"
      version = "4.1.9"
    }
  }
}

provider "wasabi" {
  region     = var.region

  endpoints {
    sts = "https://sts.wasabisys.com"
    iam = "https://iam.wasabisys.com"
    s3  = "https://s3.wasabisys.com"
  }
  s3_force_path_style = true
}

