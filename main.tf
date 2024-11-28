terraform {
  required_providers {
    tfe = {
      version = "~> 0.60.1"
    }
  }
}

provider "tfe" {
  token    = var.tfc_token
  organization = var.tfc_org
}

resource "tfe_policy_set" "test_policy_set" {
  name          = "test_policy_set"
  description   = "Massive test"
  kind          = "sentinel"
  global        = true
}

resource "tfe_policy_set_parameter" "test" {
  key           = "test_sensitive_param"
  value         = "some_test_value"
  policy_set_id = tfe_policy_set.test_policy_set.id
  sensitive     = true
}