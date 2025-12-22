variable "vpc_cidr"{
    description = "value of CIDR range"
    type        = string
    default       = "10.0.0.0/16"
}
variable "vpc_name"{
    description = "Name of the VPC"
    type        = string
    default     = "AppstudyVPC"
}

variable "subnet_cidr"{
    description = "Subnet range"
    type        = string
    default     = "10.0.1.0/24"
}

variable "subnet_name"{
    description = "Name of the subnet"
    type        = string
    default     = "AppstudySubnet"
}

variable "igw_name"{
    description = "Name of the Internet gateway"
    type        = string
    default     = "AppstudyIGW"
}

variable "ec2_ami"{
    description = "Value of EC2 ami for instance"
    type        = string
    default     = "ami-0481ea759c68ebcfd"
}

variable "ec2_name"{
    description = "Value of EC2 name for instance"
    type        = string
    default     = "AppstudyEC2"
}