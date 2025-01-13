resource "aws_instance" "db" {
  ami = local.ami_id
  vpc_security_group_ids = [local.sg_id] # allow everything sg group
  instance_type = local.instance_type
  # left side things are known as arguements, right side things are known as values
  tags = local.tags
}