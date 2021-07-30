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
    bucket                      = "${var.BUCKET_NAME}"
    key                         = "terraform/terraform.tfstate"
    endpoint                    = "s3.selcdn.ru"
    region                      = "ru-1a"
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

