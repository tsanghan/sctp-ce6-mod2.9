resource "random_id" "server" {
  byte_length = 4
}

resource "aws_elastic_beanstalk_application" "eb_app" {
  name        = "tsanghan-ce6-eb-${local.random.Name}"
  description = "Elastic Beanstalk Deployment with Terraform and GitHub Action"
}

resource "aws_elastic_beanstalk_environment" "eb_env" {
  name                = "tsanghan-ce6-eb-env-${local.random.Name}"
  application         = aws_elastic_beanstalk_application.eb_app.name
  solution_stack_name = "64bit Amazon Linux 2023 v6.1.6 running Node.js 20"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = module.vpc.vpc_id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = module.vpc.public_subnets[0]
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "arn:aws:iam::255945442255:role/service-role/aws-elasticbeanstalk-service-role"
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = "t2.micro"
  }
}