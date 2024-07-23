data "github_repository_environment" "github_repository_environment_dev_ci" {
  environment = "${local.base_domain_name}-ci"
  repository  = var.github.repository
}


data module "checkout_cdn_dev" {
  name                = "checkout"
  resource_group_name = "selc-d-checkout-fe-rg"
}


resource "github_actions_environment_secret" "env_dev_ci_secrets_storage" {
  repository       = "selfcare-web"
  environment      = data.github_repository_environment.github_repository_environment_dev_ci.environment
  secret_name      = "STORAGE_ACCOUNT_KEY"
  plaintext_value  = data.module.checkout_cdn.storage_primary_access_key
}
