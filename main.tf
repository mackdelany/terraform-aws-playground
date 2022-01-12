provider "aws" {
  region = var.region
}

module "fetching" {
  source    = "mackdelany/playground/aws"
  version   = "0.1.5"
  namespace = "mack"
}

module "networking" {
  source    = "mackdelany/playground/aws"
  version   = "0.1.5"
  namespace = "mack"
}

resource "aws_instance" "hello_world" {
  ami           = module.fetching.modules.fetching
  instance_type = "t2.micro"
  subnet_id     = module.networking.aws_subnet_id
  user_data     = <<EOT
  package_update: true
  packages:
  - <input-goes-here>
  write_files:
  - content: |
      <html>
      <body>
        <p> Customize your HTML here! </p>
      </body>
      </html>
    path: /usr/share/app/index.html
    permissions: '0644'
runcmd:
- cp /usr/share/app/index.html /usr/share/nginx/html/index.html
EOT

  tags = {
    Name = "mack_hello_world"
  }
}
