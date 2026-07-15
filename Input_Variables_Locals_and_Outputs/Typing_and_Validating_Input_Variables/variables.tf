variable "ec2_instance_type" {
  type        = string
  default     = "t3.micro"
  description = "The type of new/managed EC2 instance"

  validation {
    condition = contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    #condition = var.ec2_instance_type == "t2.micro" || var.ec2_instance_type == "t3.micro"
    error_message = "!!! Only supports t2.micro and t3.micro !!!"
  }
}

variable "ec2_volume_size" {
  type        = number
  description = "Provide the volume size in GB"
}

variable "ec2_volume_type" {
  type        = string
  description = "Provide the desired type of volume"
}