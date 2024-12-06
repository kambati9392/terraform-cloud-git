

# resource "aws_s3_bucket" "state_s3_bucket" {
    
#   bucket = "tfstate-bucket1111"
  
  
#   tags = {
#     Name= "state-bucket"
#   }
# }

#createing an vpc
resource "aws_vpc" "terraform_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name=var.terraform_vpc_name
  }
}
#-----igw-------#
resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = var.igw-name
  }
}


# Create Public Subnets

resource "aws_subnet" "terraform_public_subnet_1" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = var.public_subnet_cidr_1
  availability_zone       = var.public_subnet_az_1
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_1_name
  }
}


resource "aws_subnet" "terraform_public_subnet_2" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = var.public_subnet_cidr_2
  availability_zone       = var.public_subnet_az_2
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_2_name
  }
}



# Create Private Subnets
resource "aws_subnet" "terraform_private_subnet_1" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.private_subnet_cidr_1
  availability_zone = var.private_subnet_az_1
  tags = {
    Name = var.private_subnet_1_name
  }
}

resource "aws_subnet" "terraform_private_subnet_2" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.private_subnet_cidr_2
  availability_zone = var.private_subnet_az_2
  tags = {
    Name = var.private_subnet_2_name
  }
}

#------#


resource "aws_route_table" "terraform_public_route_table" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = var.all_traffic
    gateway_id = aws_internet_gateway.terraform_igw.id
  }


  tags = {
    Name = var.ws-pub-route-table
  }
}

resource "aws_route_table_association" "public_assoc_1" {
  subnet_id      = aws_subnet.terraform_public_subnet_1.id
  route_table_id = aws_route_table.terraform_public_route_table.id
}

resource "aws_route_table_association" "public_assoc_2" {
  subnet_id   = aws_subnet.terraform_public_subnet_2.id
  route_table_id = aws_route_table.terraform_public_route_table.id
}



resource "aws_route_table" "terraform_private_route_table" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = var.ws-pri-route-tabled
  }
}
resource "aws_route_table_association" "private_assoc_1" {
  subnet_id      = aws_subnet.terraform_private_subnet_1.id
  route_table_id = aws_route_table.terraform_private_route_table.id
}

resource "aws_route_table_association" "private_assoc_2" {
  subnet_id      = aws_subnet.terraform_private_subnet_2.id
  route_table_id = aws_route_table.terraform_private_route_table.id
  
}

#----------------#
# Create NAT Gateway in Public Subnet 1
resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.terraform_public_subnet_1.id

  tags = {
    Name = var.ws-nat-gate-way
  }
}
# Add Route to Private Route Table for NAT Gateway
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.terraform_private_route_table.id
  destination_cidr_block = var.all_traffic
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}