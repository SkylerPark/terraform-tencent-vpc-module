# terraform-tencent-vpc-module

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=flat-square)](https://github.com/pre-commit/pre-commit)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Component

아래 도구를 이용하여 모듈작성을 하였습니다. 링크를 참고하여 OS 에 맞게 설치 합니다.

> **macos** : ./bin/install-macos.sh

- [pre-commit](https://pre-commit.com)
- [terraform](https://terraform.io)
- [tfenv](https://github.com/tfutils/tfenv)
- [terraform-docs](https://github.com/segmentio/terraform-docs)
- [tfsec](https://github.com/tfsec/tfsec)
- [tflint](https://github.com/terraform-linters/tflint)

## Services

해당 Terraform 모듈을 사용하여 아래 서비스를 관리 합니다.

- **Tencent VPC (Virtual Private Network)**
  - vpc
  - nat-gateway
  - subnet-group
  - route-table
  - security-group
  - elastic-ip

## Usage

아래 예시를 활용하여 작성가능하며 examples 코드를 참고 부탁드립니다.

### vpc simple

vpc 를 생성 하는 예시 입니다.

```hcl
module "vpc" {
  source = "../../modules/vpc"
  name   = "parkm-vpc"
  ipv4_cidrs = [
    {
      cidr = "10.70.0.0/16"
    }
  ]

}
```

### nat gateway

multi_per_az_nat_gateway 와 single_nat_gateway 를 로컬 변수로 설정하여 Nat Gateway 를 분산하여 생성 할지 여부를 나타냅니다.

```hcl
locals {
  region                = "ap-seoul"
  project_name          = "parksm"
  environment_code      = "test"
  vpc_cidr              = "10.70.0.0/16"
  availability_zones    = ["ap-seoul-1", "ap-seoul-2"]
  private_subnet_count  = 2
  public_subnet_count   = 2

  nat_gateway_count        = local.single_nat_gateway ? 1 : local.multi_per_az_nat_gateway ? length(local.availability_zones) : 0
  multi_per_az_nat_gateway = true
  single_nat_gateway       = false
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
```

### vpc full

vpc, subnet-group, route-table, nat-gateway 를 생성 하는 예시 입니다.

```hcl
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

```

### Security Group

인바운드 80 에 대한 정책과 아웃바운드 Any 정책에 대한 예시 입니다.

```hcl
module "security_group" {
  source = "../../modules/security-group"
  name   = "parksm-test-sg"

  ingress_rules = [
    {
      action     = "ACCEPT"
      port       = "80,443"
      protocol   = "TCP"
      ipv4_cidrs = ["192.168.0.0/16", "10.0.0.0/8", "172.168.0.0/24"]
    }
  ]

  egress_rules = [
    {
      action     = "ACCEPT"
      port       = "ALL"
      protocol   = "ALL"
      ipv4_cidrs = ["0.0.0.0/0"]
    }
  ]
}
```
