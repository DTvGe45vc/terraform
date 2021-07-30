provider "helm" {
  kubernetes {
    config_path = "~/kubeconfig"
  }
}

provider "kubernetes" {
  config_path    = "~/kubeconfig"
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

