variable "ami_id" {
 type = string
 default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
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
    default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
} 

variable "sg_name" {
  default = "allow_all_sg"
}

variable "sg_description" {
    default = "allowing all ports from internet"
}

variable "sg_tags" {
   default = {
    Name = "allow_all_sg"

   }
}

variable "ec2_tags" {
    type = map(string)
    default = {
        Name = "promethous-1"
    }  
}

#sg_name and sg_tags with same 