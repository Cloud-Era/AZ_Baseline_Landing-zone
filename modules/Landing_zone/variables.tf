variable "lz_name" {
  description = "Name of the landing zone"
  type        = string
}

variable "short_name" {
  description = "Short name for the landing zone"
  type        = string
}

variable "short_env" {
  description = "Short environment name"
  type        = string
}

variable "env_name" {
  description = "Environment name"
  type        = string
}

variable "vnet_address_prefix" {
  description = "Address prefix for the VNet"
  type        = string
}

variable "apim_cidr" {
  description = "CIDR block for the APIM subnet"
  type        = string
}

variable "private_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "ase_cidr" {
  description = "CIDR block for the ASE subnet"
  type        = string
}

# Define additional subnet variables if needed
variable "apin_cidr" {
  description = "CIDR block for the APIN subnet"
  type        = string
}

variable "subnet_names" {
  description = "List of subnet names"
  type        = list(string)
  default     = ["im-eastus2-test-apin-snet-01", "im-eastus2-test-pvt-snet-01"]
}

variable "subnet_cidrs" {
  description = "List of subnet CIDR blocks"
  type        = list(string)
  default     = [var.apin_cidr, var.private_cidr]
}

variable "subnet_nsg_aliases" {
  description = "List of NSG aliases for the subnets"
  type        = list(string)
  default     = ["apim", "private"]
}

variable "subnet_route_table_aliases" {
  description = "List of route table aliases for the subnets"
  type        = list(string)
  default     = ["apim", "default"]
}

variable "subnet_service_endpoints" {
  description = "List of service endpoints for the subnets"
  type        = list(list(string))
  default     = [
    ["Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage"],
    []
  ]
}

variable "enforce_private_link_service_network_policies" {
  description = "List of booleans to enforce private link service network policies for subnets"
  type        = list(string)
  default     = ["false", "true"]
}

variable "enforce_private_link_endpoint_network_policies" {
  description = "List of booleans to enforce private link endpoint network policies for subnets"
  type        = list(string)
  default     = ["false", "true"]
}
