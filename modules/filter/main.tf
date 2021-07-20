terraform {
  required_providers {
    jira = {
      source  = "fourplusone/jira"
      version = "0.1.15"
    }
  }
}

resource "jira_filter" "filter" {
  for_each    = toset(var.filter.permissions)
  name        = var.filter.name
  jql         = var.filter.jql
  description = var.filter.description
  favourite   = var.filter.favourite
  permissions {
    type            = var.filter_permissions[each.value].type
    group_name      = var.filter_permissions[each.value].group_name
    project_id      = var.filter_permissions[each.value].project_id
    project_role_id = var.filter_permissions[each.value].project_role_id
  }
}
