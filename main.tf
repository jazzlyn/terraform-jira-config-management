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

#module "project" {
#  for_each = var.projects
#  source = "./modules/project"
#  project = each.value
#}
