
resource "aws_instance" "promethous" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.allow_all_sg.id ]
  # vpc_security_group_ids = locals.sg_id
  
  tags = var.ec2_tags
}
          #type                   #name
resource "aws_security_group" "allow_all_sg" {
  name        = "allow_all_sg"
  description = "Allowing all traffic"

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1" 
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = var.to_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }


  
    tags = var.sg_tags
  }

