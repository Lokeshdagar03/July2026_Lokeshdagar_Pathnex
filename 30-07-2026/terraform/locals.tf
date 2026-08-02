locals {
  project = "production-eks-platform"

  common_tags = {
    Project     = local.project
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
