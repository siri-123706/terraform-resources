variable "ami_id" {
    type = string
  default = "ami-09c813fb71547fc4f"
  description = " AMI ID of the EC2 instances"
}
variable "instance_type" {
    default = "t3.micro"
}
variable "tags" {
    default = {
    Name = "hellow-text"
    Terraform = "true"
    Environment = "dev" #tags mentioned real script not mentioned module 

}
}
variable "sg_ids" {
  type    = list(string)
  default = ["sg-07bae4cc6ca856d4a"] #sg id memtioned both module and real 
}


variable "sg_description" {
    default = "allowing traffic for sg"
}

#first push module code into git and when any chnages in module push again into git  so then you have to give terraform init -upgarde 