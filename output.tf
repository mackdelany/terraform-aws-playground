output "ami_id" {
  value = module.fetching.modules.fetching
}

output "aws_subnet_id" {
  value = module.networking.aws_subnet_id
}