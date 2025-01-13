resource "aws_instance" "db" {
  ami = var.image_id
  instance_type = var.instance_name == "db" ? "t2.micro" : "t2.small"
  # left side things are known as arguements, right side things are known as values
}
#if the condition is true then t2.micro will be executed
#if the condition is false then t2.small will be executed