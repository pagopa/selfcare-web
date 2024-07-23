data "github_repository" "repo" {
  full_name = "pagopa/selfcare-web"
}

resource "github_repository_environment" "github_repository_environment_dev_cd" {
  environment = "${var.env}-cd"
  repository  = data.github_repository.repo.name
}



# data module "checkout_cdn" {
#   name                = "checkout"
#   resource_group_name = "selc-${var.env_short}-checkout-fe-rg"
# }


data "azurerm_key_vault" "key_vault" {
  resource_group_name = var.key_vault.resource_group_name
  name                = var.key_vault.name
}

data "azurerm_key_vault_secret" "web_storage_access_key" {
  name         = "web-storage-access-key"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

# resource "azurerm_key_vault_access_policy" "keyvault_github_access_policy" {
#   key_vault_id = data.azurerm_key_vault.key_vault.id
#   tenant_id    = data.azurerm_client_config.current.tenant_id
#   object_id    = module.selc_onboarding_fn.system_identity_principal

#   secret_permissions = [
#     "Get",
#   ]
# }

resource "github_actions_environment_secret" "github_cd_secrets_storage" {
  repository       = data.github_repository.repo.name
  environment      = github_repository_environment.github_repository_environment_dev_cd.environment
  secret_name      = "STORAGE_ACCOUNT_KEY"
  plaintext_value  = data.azurerm_key_vault_secret.web_storage_access_key.value
}
