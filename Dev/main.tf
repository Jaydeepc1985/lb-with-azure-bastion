module "xyz" {
  source  = "../resource"
  rg_name = var.rg_name_x
}
# module "abc" {
#   source     = "../storage"
#   stg        = var.stg_x
#   cnt        = var.cnt_x
#   depends_on = [module.xyz]
# }
# module "flexi_server" {
#   source       = "../flexi server"
#   flexi_server = var.flexi_server_x
#   depends_on   = [module.xyz, module.VM]
# }
module "Vnet" {
  source     = "../vnet"
  vnet_y     = var.vnet_x
  depends_on = [module.xyz]

}
module "subnet" {
  source     = "../subnet"
  sub_front  = var.sub_front_x
  depends_on = [module.Vnet]
  
}
module "public_ip" {
  source     = "../publicip"
  public_ip  = var.public_ip_x
  depends_on = [module.Vnet]

}

# module "natgw" {
#   source     = "../NAT-GW"
#   natgw      = var.natgw_x
#   depends_on = [module.Vnet, module.public_ip,module.subnet]
# }

# module "Natgw_assoc" {
#   source = "../Natgw_assoc"
#   natgw_assoc = var.natgw_assoc_x
#   depends_on = [module.Vnet, module.public_ip, module.subnet, module.natgw]
# }

# module "subnet_assoc" {
#   source = "../Natgw_subnet"
#   subnet_assoc = var.subnet_assoc_x
#   depends_on = [ module.natgw, module.Natgw_assoc ]
# }

# module "azure_bastion" {
#   source       = "../azure-bastion"
#   bastion-host = var.bastion-host_x
#   depends_on   = [module.Vnet,module.subnet,module.public_ip]
# }

module "nic" {
  source       = "../nic"
  nic_config   = var.nic_config_x
  depends_on   = [module.subnet]
}
module "VM" {
  source      = "../VM"
  frontend_vm = var.frontend_vm_x
  backend_vm  = var.backend_vm_x
  depends_on  = [module.nic]

}

module "lb" {
  source     = "../load-balancer"
  frontend_lb = var.frontend_lb_x
  depends_on = [module.nic, module.VM, module.public_ip]

}

module "lb_backend_pool" {
  source       = "../lb_backend_pool"
  backend_pool = var.backend_pool_x
  depends_on   = [module.lb]
}

module "lb_backend_pool_assoc" {
  source       = "../lb_backend_pool_assoc"
  pool_assoc   = var.pool_assoc_x
  depends_on   = [module.lb, module.lb_backend_pool, module.nic]
}

module "health_probe" {
  source = "../health-probe"
  probes = var.probes_x
  depends_on   = [module.lb, module.lb_backend_pool, module.lb_backend_pool_assoc]
  
}

  module "lb_rule" {
  source        = "../lb_rule"
  lb_rules      = var.lb_rules_x

  backend_pools = {
    "pool1" = { backend_pool_id = module.lb_backend_pool.backend_pool_id["pool1"] }
  }

  probes = {
    "frontend_probe" = { probe_id = module.health_probe.probe_id["frontend_probe"] }
  }

  loadbalancer_id = module.lb.lb_id["frontend_lb_1"]

  depends_on = [module.lb, module.lb_backend_pool, module.lb_backend_pool_assoc, module.health_probe]
}



module "NSG" {
  source     = "../NSG" 
  NSG        = var.NSG_x
  depends_on = [module.nic, module.VM]
}

module "NSG-assoc" {
  source     = "../NSG-assoc"
  nsg_assoc  = var.nsg_assoc_x
  depends_on = [module.NSG, module.subnet]
  
}

# module "flexi_server" {
#   source       = "../flexi server"
#   flexi_server = var.flexi_server_x
#   depends_on   = [module.xyz, module.VM]
# }

# module "sqlsrv" {
#   source     = "../sqlsrv"
#   sql-server = var.sql-server_x
#   depends_on = [module.abc]
# }

# module "sqldb" {
#   source       = "../sqldb"
#   sql-database = var.sql-database_x
#   depends_on   = [module.sqlsrv]
# }


# module "key_vaults" {
#   source                   = "../key-vaults"
#   key_vaults               = var.key_vaults_x
#   depends_on               = [module.xyz]
# }

# module "kv_admin_roles" {
#   source                   = "../keyvault-role"
#   kv_admin_roles           = var.kv_admin_roles_x
#   depends_on               = [module.key_vaults]
# }
# module "dnszone" {
#   source                   = "../private_DNS_zone"
#   dnszone                  = var.dnszone_x
#   depends_on               = [module.xyz, module.key_vaults, module.kv_admin_roles, module.Vnet, module.subnet]
  
# }
# module "dnslink" {
#   source                   = "../Privatednslink"
#   dnslink                  = var.dnslink_x
#   depends_on               = [module.dnszone]
# }
# module "kv-pe" {
#   source                   = "../privateendpoint"
#   kv_pe                    = var.kv_pe_x
#   depends_on               = [module.dnslink]
# }

