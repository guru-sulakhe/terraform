locals {
  ami_id = "ami-041e2ea9402c46c32"
  sg_id = "sg-0ae3a12e7b7696e53" # replace with your security group ID
  instance_type = "t2.micro"
  tags = {
    Name = "locals"
  }
}
