terraform {
  required_providers {
    jira = {
      source  = "fourplusone/jira"
      version = "0.1.15"
    }
  }
}

// Grant Project Access to user "bot"
resource "jira_project_membership" "member" {
  for_each = toset(var.project.roles)
  project_key = var.project.project_key
  role_id = each.role_id
  username = each.usernames
  group = each.groups
}
