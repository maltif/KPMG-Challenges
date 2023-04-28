variable "location" {
  description = "The Azure location to use for resources"
  type        = string
  default     = "East US"
}

variable "environment" {
  description = "The environment to deploy the infrastructure to"
  type        = string
  default     = "production"
}
