resource "aws_security_group" "allow_ports" {
    name = "allow_ports"
    description = "allowing ports 22,80,8080,3306"

    #terraform block
    dynamic "ingress" { # looping ingress block
        for_each = var.inbound_rules # looping inbound_rules resource
        content {
            from_port        = ingress.value["port"] # block-name.value["key-name"]
            to_port          = ingress.value["port"]
            protocol         = ingress.value["protocol"]
            cidr_blocks      = ingress.value["allowed_cidr"]
        }
    }

    egress { # outbound security
        from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ports"
        CreatedBy = "guru prasad"
    }
}