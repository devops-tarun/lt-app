provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  private_subnet_cidr  = "10.0.2.0/24"
  az                   = "us-east-1a"
}

module "ec2" {
  source             = "./modules/ec2"
  vpc_id             = module.vpc.vpc_id
  private_subnet_id  = module.vpc.private_subnet_id
  key_name           = module.ec2.aws_key_pair.key_name
  ami_id             = "ami-0f9de6e2d2f067fca"
  instance_type      = "t2.micro"
  user_data_path     = "${path.module}/userdata.sh"
  alb_sg_id          = module.alb.alb_sg_id
}

module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id
  instance_id       = module.ec2.instance_id
}
