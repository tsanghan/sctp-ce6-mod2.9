################################################################################
# Supporting Resources
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.8.1"

  name = local.name
  cidr = local.vpc_cidr

  azs = local.azs
  public_subnets           = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 48)]
  enable_nat_gateway       = false
  default_route_table_name = "${local.name}-default-rt"

  tags = local.tags
}