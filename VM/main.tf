resource "azurerm_linux_virtual_machine" "frontend_vm" {
  for_each                        = var.frontend_vm
  name                            = each.value.name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.admin-login.value
  admin_password                  = data.azurerm_key_vault_secret.vm-password.value
  disable_password_authentication = each.value.disable_password_authentication

  network_interface_ids = [
    data.azurerm_network_interface.net_front[each.key].id
  ]

  dynamic "os_disk" {
    for_each = each.value.os_disk
    content {
      name                 = os_disk.value.name
      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type
      disk_size_gb         = os_disk.value.disk_size_gb

    }

  }

  dynamic "source_image_reference" {
    for_each = each.value.source_image_reference
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }
  custom_data = base64encode(<<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF
  )


}

resource "azurerm_linux_virtual_machine" "backend_vm" {
  for_each                        = var.backend_vm
  name                            = each.value.name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.admin-login.value
  admin_password                  = data.azurerm_key_vault_secret.vm-password.value
  disable_password_authentication = each.value.disable_password_authentication

  network_interface_ids = [
    data.azurerm_network_interface.net_backend.id
  ]

  dynamic "os_disk" {
    for_each = each.value.os_disk
    content {
      name                 = os_disk.value.name
      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type
      disk_size_gb         = os_disk.value.disk_size_gb

    }

  }

  dynamic "source_image_reference" {
    for_each = each.value.source_image_reference
    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }
  custom_data = base64encode(<<-EOF
    #!/bin/bash
    set -e
	
    apt-get update
    apt-get install -y wget apt-transport-https software-properties-common
	    
    wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    dpkg -i packages-microsoft-prod.deb
	    
    apt-get update
    apt-get install -y dotnet-sdk-8.0 aspnetcore-runtime-8.0 dotnet-runtime-8.0
       
	  EOF
  )


}
