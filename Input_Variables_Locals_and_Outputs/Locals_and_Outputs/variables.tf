variable "ec2_instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Provide EC2 instance type: "

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    error_message = "You can choose only between t2.micro and t3.micro"
  }
}

variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })

  description = "The size and the type of the root block storage"

  default = {
    size = 10
    type = "gp2"
  }
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}

variable "my_sensitive_value" {
  type      = string
  sensitive = true
}


