variable "cidr_for_vpc" {
  description = "cidr range for vpc"
  type        = string
}

variable "tenancy" {
  description = "Instance tenancy for instance launched in this vpc"
  default     = "default"
}

variable "dns_hostnames_enabled" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = false
}

variable "dns_support_enabled" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "vpc_name" {
  description = "Name for the vpc"
  type        = string
}

variable "web_server_name" {
  type        = string
  description = "name for the instance created as web server"
}

variable "inbound_rules_web" {
  description = "ingress rule for security group of web server"
  type = list(object({
    port        = number
    description = string
    protocol    = string

  }))

  default = [{
    port        = 22
    description = "this is for ssh connection"
    protocol    = "tcp"
    },
    {
      port        = 80
      description = "this is for web hosting"
      protocol    = "tcp"
  }]

}
variable "key_name" {
  type = string
  description = "key pair name"
  default = "deployer-key"
}