module "ec2" {
    source = "../01-aws-ec2"
    sg_ids = var.sg_ids
    instance_type = var.instance_type
    tags = var.tags
    
        
}
