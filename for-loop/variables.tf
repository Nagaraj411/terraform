variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "AMI ID of joindevops RHEL9"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "ec2_tags" {
    type = map(string)
    default = {
        Name = " RoboShop " # Captain N mainsion chestene Terraform main ani name vashudi
        Purpose = " Checking "
    }
  
}

variable "sg_name" {
    default = "allow-all"
}

variable "sg_description" {
    default = "allowing all ports from internet"
}

variable "from_port" {
    default = 0
}

variable "to_port" {
    default = 0
}

variable "cidr_blocks" {
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    default = {
        Name = "allow-all"
    }
}

variable "environment" {
    default = "dev" # if dev is using in ec2 instance is takes "t3.micro" other then that like prod it will take "t3.small"
  
}

variable "instances" {
    # default = {  # This for loop map format get keyword assigned for each.key for each.value
    #     mongodb = "t3.micro"
    #     redis = "t3.micro"
    #     mysql = "t3.micro"
    #     rabbitmq = "t3.micro"
    # }
    default = ["mongodb" , "redis" , "mysql" , "rabbitmq"] 
    # list lone vunchali ante if want to use for_each ante (toset) laga convert cheyali use cheyali ot tomap ga aina use cheyali
  
}

variable "zone_id" {
    default = "Z05005862BAG0R5BQ5WUP"
}

variable "domain_name" {
    default = "devops84.shop"
}