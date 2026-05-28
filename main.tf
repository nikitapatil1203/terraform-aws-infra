
module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.cidr_block
  subnet_cidr_range = var.subnet_cidr_range
}

module "ec2_instance" {
  source        = "./modules/ec2_instance"
  vpc_id        = module.vpc.vpc_id
  instance_type = var.instance_type
  ami_value     = var.ami_value
  subnet_id     = module.vpc.subnet_id
  key_name      = var.key_name

}

