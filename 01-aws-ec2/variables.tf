variable "ami_id" {
    type = string
  default = "ami-09c813fb71547fc4f"
  description = " AMI ID of the EC2 instances"
}
variable "instance_type" {
    default = "t3.micro"
}
variable "tags" {
    type = map
   
}
variable "sg_ids" {
  type    = list(string)
  default = ["sg-07bae4cc6ca856d4a"]
}

variable "sg_description" {
    default = "allowing traffic for sg"
}
