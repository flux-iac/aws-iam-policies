variable "token" { }

terraform {
  cloud {
    organization = "weaveworks"

    workspaces {
      name = "default"
    }
  }
}

credentials "app.terraform.io" {
  token = var.token
}
