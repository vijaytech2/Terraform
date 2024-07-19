# module "ec2module" {
#     source = "./modules/EC2"
#     instace_type = "t2.nano"

# }

module "vpc" {
    source = "./modules/vpc" 

}

module "rds" {
    source = "./Modules/db"

  
}