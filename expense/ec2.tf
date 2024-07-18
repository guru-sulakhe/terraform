resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description

    #this is block
    ingress { # inbound security
        from_port        = var.ssh_port
        to_port          = var.ssh_port
        protocol         = var.protocol
        cidr_blocks      = var.allowed_cidr# allowing to everything
    }

    egress { # outbound security
        from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        cidr_blocks      = var.allowed_cidr
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "guru prasad"
    }
}

resource "aws_instance" "db" {
  ami = var.image_id
  count = length(var.instance_names)
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type = var.instance_names[count.index] == "db" ? "t3.micro" : "t2.micro"
  # left side things are known as arguements, right side things are known as values
  tags = merge(
    var.common_tags,
    {
        Name = var.instance_names[count.index]
        Module = var.instance_names[count.index]
    }
  )
}
# before executing, please ensure that one IAM user is created using the CLI in AWS
# after creating, authenticate to $aws configure which will help in connecting to AWS