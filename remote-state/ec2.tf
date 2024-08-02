resource "aws_instance" "db" {
  ami = "ami-041e2ea9402c46c32"
  vpc_security_group_ids = ["sg-0ae3a12e7b7696e53"]
  instance_type = "t2.micro"
  # left side things are known as arguements, right side things are known as values
  tags = {
    Name = "db"
  }
}
# before executing, please ensure that one IAM user is created using the CLI in AWS
# after creating, authenticate to $aws configure which will help in connecting to AWS