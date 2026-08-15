
rgs = {
  rg1 = {
    name     = "dev_rg"
    location = "eastus"
  }
}
stgs = {
  stg1 = {
    name                     = "pankajstorage"
    resource_group_name      = "dev_rg"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}