terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" { #backend is nothing state s3 is simple storage service 
    bucket = "sr-remote-state-dev1" #bucket name 
    key    = "remote-state-demo" # created with this name store file with this name 
    region = "us-east-1"
    #  dynamodb_table = "sr-remote-state" #locking with dynamodb s3
    encrypt        = true #if someone is open lock encrypt says this was locked no entry 
    use_lockfile   = true # s3 with native locking 
  }
  }


provider "aws" {
  # Configuration options
}