
# Data source to find the most recent joindevops AMI
data "aws_ami" "joindevops" {
  most_recent = true
  owners      = ["973714476881"] # The owner ID for joindevops AMIs
  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Output the ami id of the EC2 instance
output "ami_id" {
  value = data.aws_ami.joindevops.id
}