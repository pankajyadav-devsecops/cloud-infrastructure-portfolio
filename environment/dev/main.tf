module "rgs" {
  source = "../../module/resource-group"
  rgs    = var.rgs
}

module "stgs" {
  source     = "../../module/storage-account"
  stgs       = var.stgs
  depends_on = [module.rgs]
}