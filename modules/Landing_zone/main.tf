module "landing_zone" {
  source = "github.com/Eaton-Vance-Corp/terrafora-azure-component-landing-zone?ref=init"

  eonid               = local.eonid
  location            = local.location
  lz_name             = var.lz_name
  short_name          = var.short_name
  short_env           = var.short_env
  env                 = var.env_name
  vnet_address_prefix = var.vnet_address_prefix
}

module "subnets" {
  source     = "github.com/Eaton-Vance-Corp/terrafora-azure-component-subnets?ref=init"
  depends_on = [module.landing_zone.systemrg_id]

  system_ng_name = module.landing_zone.systemrg_name
  vnet_name      = module.landing_zone.vnet_name
  env            = var.env_name

  tags = {
    "app:project:eonid" = local.eonid
    "app:project:name"  = "test-project"
    "app:project:env"   = var.env_name
  }

  location = local.location

  subnets_info = [
    for i in range(length(var.subnet_names)) : {
      subnet_name                           = var.subnet_names[i]
      cidr                                  = var.subnet_cidrs[i]
      nsg_alias                             = var.subnet_nsg_aliases[i]
      route_table_alias                     = var.subnet_route_table_aliases[i]
      delegation_name                       = ""
      delegation_sd_name                    = ""
      delegation_sd_action                  = []
      service_endpoints                     = var.subnet_service_endpoints[i]
      enforce_private_link_service_network_policies = var.enforce_private_link_service_network_policies[i]
      enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies[i]
    }
  ]

  nsg_services = {
    apim = {
      extra_templates = []
      variables = {
        apim_cidr = var.apim_cidr
        ase_cidr  = var.ase_cidr
      }
      name = "im-eastus2-test-apim-nsg-01"
    },
    private = {
      extra_templates = []
      variables = {
        private_cidr = var.private_cidr
        apim_cidr    = var.apim_cidr
        ase_cidr     = var.ase_cidr
      }
      name = "im-eastus2-test-pvt-nsg-01"
    }
  }
}

swimlane_udrs = {
  apim = {
    extra_templates = []
    variables = {}
    name = "im-eastus2-test-apim-rt-01"
  },
  default = {
    extra_templates = []
    variables = {}
    name = "in-eastus2-test-default-rt-01"
  }
}
