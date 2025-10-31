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

variable "from_port" {
    type = number 
    default = 0
}
    
variable "to_port" {
    type = number 
    default = 0
}

variable "cidr_blocks" {
   type = list(string)
   default = [ "0.0.0.0/0" ]
}