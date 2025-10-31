resource "aws_instance" "promethous" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.allow_all_sg.id ]
  
  
  tags = { 
    Name = "promethous-1"
  }
}

 provisioner "local-exec" { # creation time provisioner
    command = " ${self.private_ip} > inventory" # self-->roboshop,ip saved in inevntory 
    on_failure = continue #ignoring the errors
  }

#     provisioner "local-exec" {
#     when    = destroy # this is destroy time cretion provisioner
#     command = "echo 'instance is destroyed'" 
#   }

#   connection { #connects to server 
#     type     = "ssh"
#     user     = "ec2-user"
#     password = "DevOps321"
#     host     = self.public_ip
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo dnf install nginx -y",
#       "sudo systemctl start nginx", 
#     ]
#   }

# provisioner "remote-exec" {
#   when = destroy
#     inline = [
#       "sudo systemctl stop nginx"
      

#     ]

#   }
 #}


resource "aws_security_group" "allow_all_sg" {
  name        = "allow_all_sg"
  description = "Allowing all traffic"

    ingress {
        from_port        = var.from_port
        to_port          = to_port 
        protocol         = "-1" 
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }


  tags = {
    Name = "allow_all_sg"
  }
}
