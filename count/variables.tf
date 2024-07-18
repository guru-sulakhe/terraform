variable "instance_names" {
    type = list
    default = ["db","backend","frontend"]
}

variable "image_id" {
  type        = string # optional
  default     = "ami-041e2ea9402c46c32" # optional
  description = "RHEL-9 AMI id" # optional
}
 
variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "tags" {
    default = {
        Project = "Expense"
        Environment = "DEV"
        Module = "DB"
        Name = "DB"
    }
}
variable "sg_name" {
    default = "allow_ssh"
}

variable "sg_description" {
    default = "allowing port 22"
}

variable "ssh_port" {
    default = "22"
}

variable "protocol" {
    default = "tcp"
}

variable "allowed_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
}