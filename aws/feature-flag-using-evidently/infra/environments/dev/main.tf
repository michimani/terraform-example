module "feature_flags" {
  source = "../../modules/featureflag"

  env          = local.env
  project_name = "feature-flag-using-evidently"

  bool_features = {
    "sushi" = {
      description       = "Sushi feature"
      default_variation = "false"
      overrides = {
        "force-sushi" = "true"
      }
    },
    "niku" = {
      description       = "Niku feature"
      default_variation = "true"
      overrides = {
        "vegan" = "false"
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
