resource "aws_instance" "public" {
  ami           = "ami-04dfd853d88e818e8"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public.id
}

resource "aws_instance" "private" {
  ami           = "ami-04dfd853d88e818e8"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private.id
}
