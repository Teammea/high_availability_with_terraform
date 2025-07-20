# Create database
resource "aws_db_parameter_group" "custom_mysql" {
  name        = "custom-mysql8"
  family      = "mysql8.0"
  description = "Custom parameter group for MySQL 8.0"

  tags = {
    Name = "custom-mysql8"
  }
}

resource "aws_db_instance" "default" {
  count                  = 2
  identifier             = "terraform-${count.index}"
  engine                 = "mysql"
  engine_version         = "8.0.36"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = "admin"
  password               = "admin1234"
  db_name                = "mydb"
  db_subnet_group_name   = aws_db_subnet_group.mydb_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  parameter_group_name = aws_db_parameter_group.custom_mysql.name
}