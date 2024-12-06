variable "vpc_cidr_block" {
  description = "vpc cidr block"
}
variable "terraform_vpc_name" {
  description = "terraform vpc name"
}
variable "igw-name" {
  description = "internet gateway name"
}
#-------#

variable "public_subnet_cidr_1" {
  description = "cidr block of public subnet 1"
}
variable "public_subnet_az_1" {
  description = "availability zone for public subnet 1"
}
variable "public_subnet_1_name" {
  description = "public subnet 1 name"
}
variable "public_subnet_cidr_2" {
  description = "cidr block of public subnet 2"
}
variable "public_subnet_az_2" {
  description = "availability zone for public subnet 2"
}
variable "public_subnet_2_name" {
  description = "public subnet 2 name"
}
variable "private_subnet_cidr_1" {
  description = "cidr block of privatec subnet 1"
}
variable "private_subnet_az_1" {
  description = "availability zone for private subnet 1"
}
variable "private_subnet_1_name" {
  description = "private subnet 1 name"
}
variable "private_subnet_cidr_2" {
  description = "cidr block of privatec subnet 2"
}
variable "private_subnet_az_2" {
  description = "availability zone for private subnet 2"
}
variable "private_subnet_2_name" {
  description = "private subnet 2 name"
}
#----#
variable "all_traffic" {
  description = "allow all traffic"
}
variable "ws-pub-route-table" {
  description = "name of public route table"
}
variable "ws-pri-route-tabled" {
  description = "name of the private route table"
}

variable "ws-nat-gate-way" {
  description = "name of the nat-gateway"
}
