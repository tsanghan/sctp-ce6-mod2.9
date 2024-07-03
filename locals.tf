locals {

  number_of_azs = 1
  name          = "tsanghan-ce6-${basename(path.cwd)}"
  region        = "ap-southeast-1"

  vpc_cidr = "10.255.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, local.number_of_azs)

  user_data = <<-EOT
    #!/bin/bash
    echo "Hello Terraform!"
  EOT

  tags = {
    Name    = local.name
    Example = local.name
  }

  random = {
    Name = "${random_id.server.hex}"
  }
}