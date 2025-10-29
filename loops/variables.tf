variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description =  "AMI ID of joindevops RHEL9"
}


variable "ec2_tags"{
     type = map(string)
  default = {
    Name    = "promethous"
    Purpose = "variables-demo"
  }
}


variable "instance_type"{
    type = string
    default = "t3.micro"
}   

 variable "instances" {
   default = [ "mongodb", "mysql", "redis", "rabbitmq" ]
}


