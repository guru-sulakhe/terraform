output "aws_ami" {
    value = data.aws_ami.ami_id.id
}

output "vpc_info" {
    value = data.aws_vpc.default
}

# outputs.tf file is used to display the quered output in the $terraform plan