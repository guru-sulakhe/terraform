# Dynamic Blocks are used whenever we want to repeat the required block to the number of times and need to mention dynamic to loop the block
# Here ingress block will be repeated based on the var.inbound_rules and must mention content {} where we need to mention the block which will be looped
resource "aws_security_group" "allow_ports" {
    name = "allow_ports"
    description = "allowing ports 22,80,8080,3306"

    #terraform block
    dynamic "ingress" { # looping ingress block
        for_each = var.inbound_rules # looping resource inbound_rules for 4 times which is based on the number of list items
        content { # this block will be looped based on the list items
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