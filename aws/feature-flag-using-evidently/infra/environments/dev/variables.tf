locals {
  env      = "dev"
  app_name = "${local.env}-feature-flag-using-evidently"

  tags = {
    env        = local.env
    managed_by = "terraform"
  }
}
