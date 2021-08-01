provider "helm" {
  kubernetes {
    config_path = "/kubeconfig"
  }
}

provider "kubernetes" {
  config_path    = "/kubeconfig"
}


terraform {
  backend "s3" {
    bucket = "backups"
    key    = "terraform.tfstate"
    region = "ru-1a"
    endpoint = "https://s3.selcdn.ru"
    skip_region_validation = true
    skip_credentials_validation = true
    force_path_style = true
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

