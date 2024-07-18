resource "aws_instance" "db" {
  ami = var.image_id
  instance_type = var.instance_name == "db" ? "t2.micro" : "t2.small"
  # left side things are known as arguements, right side things are known as values
}