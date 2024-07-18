resource "aws_db_subnet_group" "sub_gr_dev" {
    name = "dev_sub_gr"
    subnet_ids = [ aws_subnet.private-subnet.id, aws_subnet.private-subnet-1b.id ]

    tags = {
      name = "dev_db_subnet_group"
    }
  
}
resource "aws_security_group" "rds_mysql_sg" {
  name   = "mysql-sg"
  vpc_id = aws_vpc.production-vpc.id
  ingress {
    from_port   = 3306
    protocol    = "tcp"
    to_port     = 3306
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_db_instance" "dev" {
  allocated_storage    = 20
  db_name              = "mysqldb"
  engine               = "mysql"
  engine_version       = "8.0.35"
  identifier           = "dev_mysql_db"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "admindba123"
  parameter_group_name = "default.mysql8.0"
  storage_type         = "gp3"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.sub_gr_dev.id
  vpc_security_group_ids = [aws_security_group.rds_mysql_sg.id]
}