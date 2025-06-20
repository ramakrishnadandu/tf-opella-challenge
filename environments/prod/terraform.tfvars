subscription_id      = "f95be054-4850-4ab7-9f78-ebd1c752a9e6"
environment          = "prod"
resource_group_name  = "Prod-Rg"
location             = "East US"
Replication = "ZRS"
address_space =  ["10.40.0.0/16"]

subnets = [
  {
    name           = "private-subnet"
    address_prefix = "10.40.1.0/24"
  }
]

tags = {
  environment = "prod"
  owner       = "opella"
}
