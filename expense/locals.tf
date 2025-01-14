# count and count.index will not work in locals
locals {
    record_name = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"
    # if the above code is true then guru97s.cloud will be created
    # if the above code is false then backend.guru97s.cloud or db.guru97s.cloud will be created
    record_value = var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
    # if the above code is true then public IPV4 will be displayed in record value of the record
    # if the above code is true then private IPV4 will be displayed in record value of the record

}