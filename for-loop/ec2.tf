resource "aws_instance" "promethous" {
  for_each = var.instances
  ami           = var.ami_id
  instance_type = each.value 
  vpc_security_group_ids = [ aws_security_group.allow_all_sg.id ] 
#   vpc_security_group_ids = locals.sg_id
  
  tags = { 
    Name = each.key #each = mongodb,redis, and key = t3.micro, t2.micro
  }
} 

resource "aws_security_group" "allow_all_sg" {
  name        = "allow_all_sg"
  description = "Allowing all traffic"

    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1" 
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }


  tags = {
    Name = "allow_all_sg"
  }
}
