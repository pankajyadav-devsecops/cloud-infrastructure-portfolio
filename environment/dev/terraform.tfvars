
rgs = {
  rg1 = {
    name     = "dev_rg"
    location = "eastus"
  }
   rg2 = {
    name     = "dev_rg2"
    location = "eastus"
  }
}
stgs = {
  stg1 = {
    name                     = "pankajstorage135"
    resource_group_name      = "dev_rg"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}