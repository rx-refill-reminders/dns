include "root" {
  path = find_in_parent_folders("root.hcl")
}

dependency "hosted_zone" {
  config_path = "../dns-hosted-zone"

  mock_outputs = {
    zone_id = "Z000000000000000000000"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

dependencies {
  paths = ["../dns-hosted-zone"]
}

terraform {
  source = "git::github.com/rx-refill-reminders/terraform-modules//modules/dns-acm-certificate?ref=optional-validation-records&depth=0"
}

inputs = merge(
  values,
  {
    zone_id = dependency.hosted_zone.outputs.zone_id
  },
)
