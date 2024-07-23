variable "env" {
  description = "Environment name"
  type        = string
  validation {
    condition = (
      length(var.env) <= 4
    )
    error_message = "Max length is 1 chars."
  }
}

variable "env_short" {
  description = "Environment short name"
  type        = string
  validation {
    condition = (
      length(var.env_short) <= 1
    )
    error_message = "Max length is 1 chars."
  }
}

variable "tags" {
  type = map(any)
}


variable "key_vault" {
  description = "KeyVault data to get secrets values from"
  type = object({
    resource_group_name = string
    name                = string
  })
}