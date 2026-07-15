locals {
  project       = "input-vars-local-outputs"
  project_owner = "TF-course"
  cost_center   = "1234"
  managed_by    = "Terraform"
  sensitive     = "Haslo i login"
}

locals {
  common_tags = {
    project       = local.project
    project_owner = local.project_owner
    cost_center   = local.cost_center
    managed_by    = local.managed_by
    sensitive     = var.my_sensitive_value
  }
}