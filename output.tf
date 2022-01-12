output "ami_id" {
  value = module.fetching.ami_id
}

output "aws_subnet_id" {
  value = module.networking.aws_subnet_id
}
