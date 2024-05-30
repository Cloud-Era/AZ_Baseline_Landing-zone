# Landing Zone module
module "landing_zone" {
  source = "github.com//terrafora-azure-component-landing-zone?ref=init"

  # Pass landing zone parameters
  eonid               = var.eonid
  location            = var.location
  lz_name             = var.lz_name
  short_name          = var.short_name
  short_env           = var.short_env
  env                 = var.env_name
  vnet_address_prefix = var.vnet_address_prefix
}

# Subnets module
module "subnets" {
  source     = "github.com//terrafora-azure-component-subnets?ref=init"
  depends_on = [module.landing_zone.systemrg_id]

  # Pass subnet details
  system_ng_name = module.landing_zone.systemrg_name
  vnet_name      = module.landing_zone.vnet_name
  env            = var.env_name

  # Tags for resources
  tags = {
    "app:project:eonid" = var.eonid
    "app:project:name"  = "test-project"
    "app:project:env"   = var.env_name
  }

  # Location
  location = var.location

  # Subnet configurations
  subnets_info = [
    for subnet_name, subnet in var.subnets : {
      subnet_name                           = subnet_name
      cidr                                  = subnet.cidr
      nsg_alias                             = subnet.nsg_alias
      route_table_alias                     = subnet.route_table_alias
      delegation_name                       = ""
      delegation_sd_name                    = ""
      delegation_sd_action                  = []
      service_endpoints                     = subnet.service_endpoints
      enforce_private_link_service_network_policies = subnet.enforce_private_link_service_network_policies
      enforce_private_link_endpoint_network_policies = subnet.enforce_private_link_endpoint_network_policies
    }
  ]

  # NSG services configuration
  nsg_services = {
    for subnet_name, nsg_name in var.subnets : subnet_name => {
      extra_templates = []
      variables = {
        cidr = var.subnets[subnet_name].cidr
        ase_cidr  = var.subnets[subnet_name].cidr
      }
      name = var.nsg_names[subnet_name]
    }
  }
}

# Swimlane UDRs
swimlane_udrs = {
  for udr_name, rt_name in var.swimlane_udr_names : udr_name => {
    extra_templates = []
    variables = {}
    name = rt_name
  }
}
