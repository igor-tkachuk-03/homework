module "ec2" {
  source = "./ec2"

  subnet_id = module.networking.public_subnet_id
}

module "networking" {
  source = "./networking"
}
