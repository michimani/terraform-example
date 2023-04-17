module "feature_flags" {
  source = "../../modules/featureflag"

  env          = local.env
  project_name = "feature-flag-using-evidently"

  bool_features = {
    "sushi" = {
      description       = "Sushi feature"
      variations        = { "on" = true, "off" = false }
      default_variation = "off"
      overrides = {
        "force-sushi" = "on"
      }
    },
    "niku" = {
      description       = "Niku feature"
      variations        = { "on" = true, "off" = false }
      default_variation = "on"
      overrides = {
        "vegan" = "off"
      }
    }
  }

  string_features = {
    "food" = {
      description = "food feature"
      variations = {
        "rice"      = "rice",
        "humberger" = "humberger",
        "ramen"     = "ramen",
        "sushi"     = "sushi",
        "yakiniku"  = "yakiniku",
      }
      default_variation = "ramen"
      overrides = {
        "only-rice" = "rice"
      }
    }
  }
}
