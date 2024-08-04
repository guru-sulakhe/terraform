resource "aws_instance" "expense" {
  for_each = var.instance_names # each.key and each.value will be iterated for every iteration
  ami = data.aws_ami.ami_info.id
  vpc_security_group_ids = ["sg-0ae3a12e7b7696e53"]
  instance_type = each.value #each.vlue refers to t2.micro  instance type
  # left side things are known as arguements, right side things are known as values
  tags = merge(
    var.common_tags,
    {
        Name = each.key
        Module = each.key
    }
  )
}
# before executing, please ensure that one IAM user is created using the CLI in AWS
# after creating, authenticate to $aws configure which will help in connecting to AWS