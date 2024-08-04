# instance variables
variable "instance_names" {
  type        = map
  default     = {
    db = "t2.micro"
    backend = "t2.micro"
    frontend = "t2.micro"
  }
}
variable "common_tags" {
  type        = map
  default = {
    Project = "Expense"
    Terraform = "true"
  }
}

# route53 records variables
variable "zone_id" {
    type = string
    default = "Z08273698E2G6XTP9T7C"
}
variable "domain_name" {
    type = string
    default = "guru97s.cloud"
}