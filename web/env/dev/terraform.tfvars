# general
env_short           = "d"
env                 = "dev"
location            = "westeurope"
location_short      = "weu"
location_pair       = "northeurope"
location_pair_short = "neu"

tags = {
  CreatedBy   = "Terraform"
  Environment = "Dev"
  Owner       = "SelfCare"
  Source      = "https://github.com/pagopa/selfcare-infra"
  CostCenter  = "TS310 - PAGAMENTI & SERVIZI"
}


# dns
dns_zone_prefix    = "dev.selfcare"
dns_zone_prefix_ar = "dev.areariservata"
external_domain    = "pagopa.it"

# storage account
public_network_access_enabled = false
