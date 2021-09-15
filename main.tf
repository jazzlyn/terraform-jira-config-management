terraform {
  required_providers {
    jira = {
      source  = "fourplusone/jira"
      version = "0.1.15"
    }
  }
}

module "filter" {
  for_each           = var.filters
  source             = "./modules/filter"
  filter             = each.value
  filter_permissions = var.filter_permissions
}

module "project_memberships" {
  for_each = var.project_memberships
  source = "./modules/project_memberships"
  project = each.value
}
