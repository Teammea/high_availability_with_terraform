resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow DB access"
  vpc_id      = aws_vpc.custom.id

  ingress {
    description = "MySQL access from EC2"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    # Replace with actual EC2 SG if you want stricter control
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}