resource "aws_route53_record" "expense" {
  for_each = aws_instance.expense # iterated for three times at which the resources are mentioned
  zone_id = var.zone_id
  name    = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}" # ${}are for adding string to variables
  #each.key refers key of the output of ec2.tf at which frontend = {}
  #name = local.record_name
  # if we dont include ${} in line 4, it will treat var.domain_name as a text which will returns error while execution
  type    = "A"
  ttl     = 1
  #records = local.record_value
  records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip] # here each.value refers to the value of the output of ec2.tf
  # if records already exists, it will override the records
  allow_overwrite = true
}

# count and count.index will not work in locals

# Here records are created based on the output of the ec2 instance, but the ec2 instances are created by using for_each.
# If the instances are created by using for_each then the records will be created based on the each.value of the output.tf file
# In output.tf file, backend = {}, frontend = {}, db = {}.
# Which means we need to refer the output values by using each.value