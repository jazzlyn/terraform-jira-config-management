terraform {
  required_providers {
    jira = {
      source  = "fourplusone/jira"
      version = "0.1.15"
    }
  }
}



// Create a Project with a shared configuration
resource "jira_project" "project_shared" {
  key                             = "SHARED"
  name                            = "Project (with shared config)"
  lead                            = "bot"
  shared_configuration_project_id = jira_project.project_a.project_id
}
