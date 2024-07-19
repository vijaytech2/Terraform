module "vpc" {
    source = "../vpc"

}
resource "aws_db_subnet_group" "sub_gr_dev" {
    name = "dev_sub_gr"
    subnet_ids = module.vpc.subnet_ids

    tags = {
      name = "dev_db_subnet_group"
    }
  
}
resource "aws_db_instance" "dev" {
  allocated_storage    = 20
  db_name              = "mysqldb"
  engine               = var.engine
  engine_version       = var.engine_version
  identifier           = "devmysqldb"
  instance_class       = "db.t3.micro"
  username             = var.uname
  password             = var.pwd
  parameter_group_name = var.parameter
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.sub_gr_dev.id
  vpc_security_group_ids = module.vpc.sg
}