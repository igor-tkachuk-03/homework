provider "aws" { region = "us-east-1" }

resource "aws_vpc" "main" { cidr_block = "10.0.0.0/16" }

resource "aws_subnet" "public" {

 vpc_id         = aws_vpc.main.id

 cidr_block       = "10.0.1.0/24"

 availability_zone    = "us-east-1"

 map_public_ip_on_launch = true

}

resource "aws_route_table" "public" {

 vpc_id = aws_vpc.main.id

}

resource "aws_route_table_association" "public" {

 subnet_id   = aws_subnet.public.id

 route_table_id = aws_route_table.public.id

}

resource "aws_internet_gateway" "main" {

 vpc_id = aws_vpc.main.id

}

resource "aws_route" "public_igw" {

 route_table_id     = aws_route_table.public.id

 destination_cidr_block = "0.0.0.0/0"

 gateway_id       = aws_internet_gateway.main.id

}

resource "aws_subnet" "private" {

 vpc_id         = aws_vpc.main.id

 cidr_block       = "10.0.101.0/24"

 availability_zone    = "us-east-1" 

}

resource "aws_route_table" "private" {

 vpc_id = aws_vpc.main.id

}

resource "aws_route" "private_nat" {

 route_table_id     = aws_route_table.private.id

 destination_cidr_block = "0.0.0.0/0"

 nat_gateway_id     = aws_nat_gateway.main.id

}

resource "aws_nat_gateway" "main" {

 allocation_id = aws_eip.main.id

 subnet_id   = aws_subnet.public.id

}

resource "aws_eip" "main" {

}

resource "aws_instance" "public" {

 ami      = "ami-0c55b159cbfafe1f0" # Замініть на свій AMI ID

 instance_type = "t3.micro"

 subnet_id   = aws_subnet.public.id

}

resource "aws_instance" "private" {

 ami      = "00000000000000000000" # Вкажи свій AMI ID

 instance_type = "t3.micro"

 subnet_id   = aws_subnet.private.id

}
