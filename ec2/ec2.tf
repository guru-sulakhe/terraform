resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing SSH access"

    #terraform block
    ingress { # inbound security
        from_port        = 22
        to_port          = 22
        protocol         = "tcp" # all traffic
        cidr_blocks      = ["0.0.0.0/0"] # allowing to everything
    }

    egress { # outbound security
        from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "guru prasad"
    }
}

resource "aws_instance" "db" {
  ami = "ami-041e2ea9402c46c32"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type = "t2.micro"
  # left side things are known as arguements, right side things are known as values
  tags = {
    Name = "db"
  }
}
# before executing, please ensure that one IAM user is created using the CLI in AWS
# after creating, authenticate to $aws configure which will help in connecting to AWS