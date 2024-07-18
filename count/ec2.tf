resource "aws_instance" "db"{
    # count = 3 # loop will be continued upto three times
    count =length(var.instance_names) # length() is a function to determine the lenght of the given list
    ami = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = { # tags are used for naming purpose in aws
        Name = var.instance_names[count.index] # create 0.db,1.backend,2.frontend instance
    }
}

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
        Name = "allow_ssh" # name of security group
        CreatedBy = "guru prasad"
    }
}