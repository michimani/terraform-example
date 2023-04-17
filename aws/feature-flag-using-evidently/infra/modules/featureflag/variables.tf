locals {
  env = var.env

  tags = {
    env        = var.env
    managed_by = "terraform"
  }
}

variable "env" {
  type        = string
  description = "Environments short name"
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "bool_features" {
  type = map(object({
    description       = string
    variations        = map(bool)
    default_variation = string
    overrides         = map(string)
  }))
  description = "List of boolean value features"
}

variable "string_features" {
  type = map(object({
    description       = string
    variations        = map(string)
    default_variation = string
    overrides         = map(string)
  }))
  description = "List of string value features"
}
