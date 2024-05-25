module "efs" {
  source = "terraform-aws-modules/efs/aws"

  depends_on = [ aws_subnet.dev1-subnet, aws_subnet.dev2-subnet]

  # File system
  name           = "test"
  creation_token = "example-token"
  encrypted      = true
  lifecycle_policy = {
    transition_to_ia = "AFTER_30_DAYS"
  }

  # Mount targets / security group
  mount_targets = {  
    "us-east-1a" = {
      subnet_id = aws_subnet.dev1-subnet.id
    }
    "us-east-1b" = {
      subnet_id = aws_subnet.dev2-subnet.id
    }
  }
  security_group_description = "Example EFS security group"
  security_group_vpc_id      = aws_vpc.dev-vpc.id
  security_group_rules = {
    vpc = {
      # relying on the defaults provdied for EFS/NFS (2049/TCP + ingress)
      description = "NFS ingress from VPC private subnets"
      cidr_blocks = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
    }
  }
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}