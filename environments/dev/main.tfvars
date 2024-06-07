# Main Terraform configuration for Azure Landing Zone and Subnets

module "landing_zone" {
  source = "github.com/Eaton-Vance-Corp/terrafora-azure-component-landing-zone?ref=init"

  # Parameters for the landing zone module
  eonid               = var.eonid
  location            = var.location
  lz_name             = var.lz_name
  short_name          = var.short_name
  short_env           = var.short_env
  env                 = var.env_name
  vnet_address_prefix = var.vnet_address_prefix
}

module "subnets" {
  source     = "github.com/Eaton-Vance-Corp/terrafora-azure-component-subnets?ref=init"
  depends_on = [module.landing_zone.systemrg_id]

  # Parameters for the subnets module
  system_ng_name = module.landing_zone.systemrg_name
  vnet_name      = module.landing_zone.vnet_name
  env            = var.env_name

  # Resource tags
  tags = {
    "app:project:eonid" = var.eonid
    "app:project:name"  = var.project_name
    "app:project:env"   = var.env_name
  }

  # Azure location
  location = var.location

  # Subnet configurations using for loop
  subnets_info = [
    for subnet_name, subnet in var.subnets : {
      subnet_name                           = subnet.subnet_name
      cidr                                  = subnet.cidr
      nsg_alias                             = subnet.nsg_alias
      route_table_alias                     = subnet.route_table_alias
      delegation_name                       = subnet.delegation_name
      delegation_sd_name                    = subnet.delegation_sd_name
      delegation_sd_action                  = subnet.delegation_sd_action
      service_endpoints                     = subnet.service_endpoints
      enforce_private_link_service_network_policies = subnet.enforce_private_link_service_network_policies
      enforce_private_link_endpoint_network_policies = subnet.enforce_private_link_endpoint_network_policies
    }
  ]

  # Network Security Group (NSG) services configuration
  nsg_services = {
    apim = {
      extra_templates = []
      variables = {
        apim_cidr = var.subnets["apim"].cidr
        ase_cidr  = var.subnets["ase"].cidr
      }
      name = var.nsg_names["apim"]
    }
    private = {
      extra_templates = []
      variables = {
        private_cidr = var.subnets["private"].cidr
        apim_cidr    = var.subnets["apim"].cidr
        ase_cidr     = var.subnets["ase"].cidr
      }
      name = var.nsg_names["private"]
    }
  }

  # User-Defined Route (UDR) configurations for subnets
  swimlane_udrs = {
    apim = {
      extra_templates = []
      variables = {}
      name = var.swimlane_udr_names["apim"]
    }
    default = {
      extra_templates = []
      variables = {}
      name = var.swimlane_udr_names["default"]
    }
  }
}
create_rg = true
create_group = true

rg_name = "example-resource-group"
your_subscription_id = "your-subscription-id"

azure_ad_group_name = "cloud-deployment"

rbac = {
  "api_management_service_contributor" = {
    scope                = "/subscriptions/${your_subscription_id}"
    role_definition_name = "API Management Service Contributor"
    description          = "Role assignment to allow management of API Management services at the subscription level."
  },
  "private_dns_zone_contributor" = {
    scope                = "/subscriptions/${your_subscription_id}/resourceGroups/${rg_name}"
    role_definition_name = "Private DNS Zone Contributor"
    description          = "Role assignment to allow management of Private DNS zones in the specified resource group."
  },
  "reader" = {
    scope                = "/subscriptions/${your_subscription_id}"
    role_definition_name = "Reader"
    description          = "Role assignment to grant read-only access to the entire subscription."
  }
}

