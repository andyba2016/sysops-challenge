# Create VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc.cidr_block

  tags = {
    Name = "Main VPC"
  }
}

# Create public subnets
resource "aws_subnet" "public_subnet" {
  for_each = var.vpc.subnets

  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name                                        = "Public Subnet ${each.key}"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }

  depends_on = [aws_vpc.main_vpc]
}

# Create internet gateway
resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Main Internet Gateway"
  }

  depends_on = [aws_vpc.main_vpc]
}

# Create table route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name = "Public Route Table"
  }

  depends_on = [aws_vpc.main_vpc, aws_internet_gateway.main_igw]
}

# Subnet association
resource "aws_route_table_association" "public_subnet_association" {
  for_each       = aws_subnet.public_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_route_table.id

  depends_on = [aws_subnet.public_subnet, aws_route_table.public_route_table]
}
