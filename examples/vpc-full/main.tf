locals {
  region                = "ap-seoul"
  project_name          = "parksm"
  environment_code      = "test"
  vpc_cidr              = "10.75.0.0/16"
  availability_zones    = ["ap-seoul-1", "ap-seoul-2"]
  private_subnet_count  = 2
  public_subnet_count   = 2
  database_subnet_count = 2

  nat_gateway_count        = local.single_nat_gateway ? 1 : local.multi_per_az_nat_gateway ? length(local.availability_zones) : 0
  multi_per_az_nat_gateway = true
  single_nat_gateway       = false
}

module "vpc" {
  source = "../../modules/vpc"
  name   = "parksm-test-vpc"
  ipv4_cidrs = [
    {
      cidr = local.vpc_cidr
    }
  ]
}

module "private_subnet_group" {
  source = "../../modules/subnet-group"
  vpc_id = module.vpc.id
  subnets = {
    for idx in range(local.private_subnet_count) : format("${local.project_name}-${local.environment_code}-private-subnet-0%s", (idx + 1)) => {
      availability_zone = local.availability_zones[idx % length(local.availability_zones)]
      ipv4_cidr         = cidrsubnet(local.vpc_cidr, 8, 10 + idx + 1)
    }
  }
}

module "public_subnet_group" {
  source = "../../modules/subnet-group"
  vpc_id = module.vpc.id
  subnets = {
    for idx in range(local.public_subnet_count) : format("${local.project_name}-${local.environment_code}-public-subnet-0%s", (idx + 1)) => {
      availability_zone = local.availability_zones[idx % length(local.availability_zones)]
      ipv4_cidr         = cidrsubnet(local.vpc_cidr, 8, 30 + idx + 1)
    }
  }
}

module "database_subnet_group" {
  source = "../../modules/subnet-group"
  vpc_id = module.vpc.id
  subnets = {
    for idx in range(local.database_subnet_count) : format("${local.project_name}-${local.environment_code}-database-subnet-0%s", (idx + 1)) => {
      availability_zone = local.availability_zones[idx % length(local.availability_zones)]
      ipv4_cidr         = cidrsubnet(local.vpc_cidr, 8, 10 + idx + 1)
    }
  }
}

module "eip" {
  source = "../../modules/elastic-ip"
  count  = local.nat_gateway_count
  name   = "${local.project_name}-${local.environment_code}-natgw-${local.availability_zones[count.index]}"
}

module "nat_gateway" {
  source = "../../modules/nat-gateway"
  count  = local.nat_gateway_count
  name   = "${local.project_name}-${local.environment_code}-natgw-${local.availability_zones[count.index]}"

  vpc_id    = module.vpc.id
  subnet_id = module.public_subnet_group.ids[count.index]

  primary_ip_assignment = {
    elastic_ip = module.eip[count.index].id
  }
}

module "public_route_table" {
  source  = "../../modules/route-table"
  name    = "${local.project_name}-${local.environment_code}-public-rt"
  vpc_id  = module.vpc.id
  subnets = module.public_subnet_group.ids

  ipv4_routes = []
}

module "private_route_table" {
  source = "../../modules/route-table"
  count  = local.nat_gateway_count
  name   = "${local.project_name}-${local.environment_code}-private-rt-${local.availability_zones[count.index]}"
  vpc_id = module.vpc.id
  subnets = [
    for subnet in module.private_subnet_group.subnets_by_az[local.availability_zones[count.index]] :
    subnet.id
  ]

  ipv4_routes = [
    {
      destination = "0.0.0.0/0"
      target = {
        type = "NAT_GATEWAY"
        id   = module.nat_gateway[count.index].id
      }
    }
  ]
}
