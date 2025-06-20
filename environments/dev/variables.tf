variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "address_space" {
  description = "VNet address space"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnets with name and address_prefix"
  type = list(object({
    name           = string
    address_prefix = string
  }))
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
}

variable "Replication" {
  description = "Zone Selection"
  type        = string
  default     = "LRS"
}
