variable "filters" {
  type        = map(any)
  description = "all filter from yaml file"
}

variable "filter_permissions" {
  type        = map(any)
  description = "all filter permissions from yaml file"
}

variable "project_memberships" {
  type        = map(any)
  description = "all projects memberships from yaml file"
}
