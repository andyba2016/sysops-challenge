locals {
  vpc = {
    cidr_block = var.vpc_cidr_block
    subnets = {
      subnet_1 = {
        cidr_block        = var.subnet1_cidr_block
        availability_zone = var.subnet1_availability_zone
      }
      subnet_2 = {
        cidr_block        = var.subnet2_cidr_block
        availability_zone = var.subnet2_availability_zone
      }
    }
  }
}
