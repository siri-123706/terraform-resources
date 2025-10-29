
resource "aws_instance" "promethous" {
  /* count = 4  */
  count = length(var.instances) # no need mentioned number automatically created instances when you required
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.allow_all_sg.id ]
  
  tags = merge (
    var.common_tags,{
      Name = var.instances[count.index] #created resources mongodb, redis, mysql, rabbitmq and index start 0 
      Component = var.instances[count.index]
    }
  )   
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


  tags = merge(
    var.common_tags,{
       Name = "allow_all_sg"
    }
  )
   
 
}
 