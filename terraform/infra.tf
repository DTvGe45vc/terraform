provider "helm" {
  kubernetes {
    config_path = "~/kubeconfig"
  }
}

provider "kubernetes" {
  config_path    = "~/kubeconfig"
}


terraform {
  backend "s3" {
    access_key                  = "153598_s3"
    secret_key                  = "HUqptT?A7A"
    bucket                      = "backups"
    key                         = "terraform/terraform.tfstate"
    endpoint                    = "https://s3.selcdn.ru"
    region                      = "ru-1"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

#--------------------------------------------------------
#-----resources--------------
#-------------------------------------------------------
resource "kubernetes_secret" "test-secret" {
  metadata {
    name = "test-secret"
    namespace = "infra"
  }

  data = {
    "USERNAME" = "test-secret"
    "PASSWORD" = "test-secret"
  }
}

