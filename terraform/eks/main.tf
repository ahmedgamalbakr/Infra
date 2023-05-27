module "network" {
  source          = "./network"
  VPC_CIDR        = var.VPC_CIDR
  PUBLIC_SUBNET1  = var.PUBLIC_SUBNET1
  PRIVATE_SUBNET1  = var.PRIVATE_SUBNET1
  PRIVATE_SUBNET2  = var.PRIVATE_SUBNET2

 

  AZ_1   = var.AZ_1
  AZ_2   = var.AZ_2
  REGION = var.REGION
}