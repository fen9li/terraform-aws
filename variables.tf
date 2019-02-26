# variables.tf
variable "gc_dev_vpc_id" {
  type        = "string"
  default     = "vpc-0c706b6c3f3370430"
  description = "Greencap VPC for Developing and QA in greencapdev account"
}

variable "gc_dev_public_subnet" {
  type        = "string"
  default = "subnet-0aadd0618861a2069"
  description = "The public subnets in GC_DEV_VPC in greencapdev account"
}

variable "jumpbox_ami_id" {
  type        = "string"
  default     = "ami-0cac10a084edcc825"
  description = "Amazon Linux 2 AMI 2.0.20190218 x86_64 HVM gp2"
}

variable "jumpbox_instance_type" {
  type        = "string"
  default     = "t2.micro"
  description = "Jumpbox instance type"
}

variable "key_pair_name" {
  type        = "string"
  default     = "devaccess"
  description = "The key pair in greencapdev account"
}

variable "jumpbox_ssh_location" {
  type        = "list"
  default = ["194.223.11.132/32"]
  description = "The allow ssh location to greencapdev account jumpbox"
}
