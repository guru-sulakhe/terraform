resource "aws_route53_record" "expense" {
  for_each = aws_instance.expense # iterated for three times at which the resources are mentioned
  zone_id = var.zone_id
  name    = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}" # ${}are for adding string to variables
  #each.key refers key of the outputs.tf at which frotend = {}
  #name = local.record_name
  # if we dont include ${} in line 4, it will treat var.domain_name as a text which will returns error while execution
  type    = "A"
  ttl     = 1
  #records = local.record_value
  records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip] # here each.value refers to the value of the outputs.tf
  # if records already exists
  allow_overwrite = true
}

# count and count.index will not work in locals