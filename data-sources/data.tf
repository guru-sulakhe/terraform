data "aws_ami" "ami_id" {

    most_recent = true
    owners = ["973714476881"]

    filter { # fetching ami image-id summary data
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_vpc" "default" {
    default = true
}
# data sources are used to query the resources of the provider

