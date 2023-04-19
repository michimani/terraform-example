resource "aws_evidently_project" "main" {
  name = "${local.env}-${var.project_name}-project"

  tags = local.tags
}

# Features that has boolean value
resource "aws_evidently_feature" "bool_feature" {
  for_each = var.bool_features

  project     = aws_evidently_project.main.name
  name        = each.key
  description = each.value.description

  dynamic "variations" {
    for_each = local.bool_variations
    iterator = v

    content {
      name = v.key
      value {
        bool_value = v.value
      }
    }
  }

  default_variation = each.value.default_variation

  entity_overrides = each.value.overrides

  lifecycle {
    ignore_changes = [
      default_variation,
    ]
  }
}

# Features that has string value
resource "aws_evidently_feature" "string_feature" {
  for_each = var.string_features

  project     = aws_evidently_project.main.name
  name        = each.key
  description = each.value.description

  dynamic "variations" {
    for_each = each.value.variations
    iterator = v

    content {
      name = v.key
      value {
        string_value = v.value
      }
    }
  }

  default_variation = each.value.default_variation

  entity_overrides = each.value.overrides

  lifecycle {
    ignore_changes = [
      default_variation,
    ]
  }
}
