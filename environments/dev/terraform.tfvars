subscription_id      = "f95be054-4850-4ab7-9f78-ebd1c752a9e6"
environment          = "dev"
resource_group_name  = "dev-rg"
location             = "Central India"

address_space = ["10.10.0.0/16"]

subnets = [
  {
    name           = "private-subnet"
    address_prefix = "10.10.1.0/24"
  }
]

tags = {
  environment = "dev"
  owner       = "opella"
}
