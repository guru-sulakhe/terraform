locals { #locals are also used to hold any type of expressions, you can als use variables inside locals
  ami_id = "ami-041e2ea9402c46c32"
  sg_id = "sg-0ae3a12e7b7696e53" # replace with your security group ID
  instance_type = var.instance_name == "db" ? "t2.micro" : "t2.small"
  tags = {
    Name = "locals"
  }
}
