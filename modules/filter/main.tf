terraform {
  required_providers {
    jira = {
      source  = "fourplusone/jira"
      version = "0.1.15"
    }
  }
}

resource "jira_filter" "filter" {
  name        = var.filter.name
  jql         = var.filter.jql
  description = var.filter.description
  favourite   = var.filter.favourite
  dynamic "permissions" {
    for_each    = var.filter.permissions
    content {
      type            = var.filter_permissions[permissions.value].type
      group_name      = var.filter_permissions[permissions.value].group_name
      project_id      = var.filter_permissions[permissions.value].project_id
      project_role_id = var.filter_permissions[permissions.value].project_role_id
    }
  }
}
