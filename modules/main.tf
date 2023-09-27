module "vpc-network" {
  source                        = "./vpc-network"
  vpc_cidr                      = var.vpc_cidr
  public_subnets_cidr           = var.public_subnets_cidr
  private_subnets_cidr          = var.private_subnets_cidr
  subnets_az                    = var.subnets_az

}

module "bastion" {
  source                       = "./bastion"

  appvpc_id                  = module.vpc-network.appvpc_id
  public_subnets_id          = [module.vpc-network.public_subnet_id, module.vpc-network.public_subnet2_id]

}

module "eks" {
  source                 = "./eks"
  appvpc_id                  = module.vpc-network.appvpc_id
  private_subnets_id = [module.vpc-network.private_subnet_id, module.vpc-network.private_subnet2_id]


}
