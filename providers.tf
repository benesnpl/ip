terraform {
  required_version = "> 0.14.0"

  required_providers {
    azurerm = {
      version = "~> 2.54"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "643419c7-11b4-43c2-9d6a-ee115f86627f"
  client_id = "edb0ff32-e89f-40cb-88dc-a02959ae2a5a"
  client_secret = "qtX8Q~DQ1_WV-drIqfXN8pJrD1dmh_xEhB6J5bQ1"
  tenant_id = "cf668d98-df58-45c9-86fb-b72c2761364b"
}
