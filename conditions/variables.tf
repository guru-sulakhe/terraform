variable "image_id" {
  type        = string # optional
  default     = "ami-041e2ea9402c46c32" # optional
  description = "RHEL-9 AMI id" # optional
}
 
variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
    default = "db"
}