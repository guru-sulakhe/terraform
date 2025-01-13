resource "aws_route53_record" "expense" {
  count = length(var.instance_names) # three records will be created with the help of length(var.instance_names) 
  zone_id = var.zone_id
  name    = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}" # ${}are for adding string to variables
  #name = local.record_name
  # if we dont include ${} in line 4, it will treat var.domain_name as a text which will returns error while execution
  type    = "A"
  ttl     = 1
  #records = local.record_value
  # records will be created based on frontend. if the instance name is frontend then record will be created with public_ip
  # if the instance name is not frontend  then record will be created with private_ip
  records = var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
  # if records already exists, then it will override the records with latest values
  allow_overwrite = true
}

# count and count.index will not work in locals