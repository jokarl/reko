variable "env" {
  description = "Environment of the application"
  type        = string
}

variable "acr_name" {
  description = "Name of container registry to pull images from"
  type        = string

}

variable "infra_resource_group_name" {
  description = "Name of the resource group housing shared infra"
  type        = string
}
