output "subnets" {
  value = module.vpc.public_subnets[0]
}

output "vpcid" {
  value = module.vpc.vpc_id
}

output "app_name" {
  value = aws_elastic_beanstalk_application.eb_app.name
}

output "env_name" {
  value = aws_elastic_beanstalk_environment.eb_env.name
}

output "cname" {
  value = aws_elastic_beanstalk_environment.eb_env.cname
}