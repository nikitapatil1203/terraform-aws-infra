
module "vpc" {
  source     = "/Users/nikitapatil/Desktop/DevOps_Projects/Terraform_New_20May2026/modules/vpc"
  cidr_block = var.cidr_block
}

module "ec2_instance" {
  source                      = "/Users/nikitapatil/Desktop/DevOps_Projects/Terraform_New_20May2026/modules/ec2_instance"
  instance_type               = var.instance_type
  ami                         = var.ami_value
  subnet_id                   = module.vpc.subnet_id
  vpc_security_group_ids      = [module.ec2_instance.security_group_east_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

}

