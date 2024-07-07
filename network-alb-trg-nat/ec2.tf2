resource "aws_instance" "ec2_example" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = var.INSTANCE_TYPE
  vpc_security_group_ids = ["aws_security_group.publicEC2Security.id", "aws_security_group.albSecurityGroup.id"]
  subnet_id              = var.myPublicSubnet

  # 2. Key Name
  # Specify the key name and it should match with key_name from the resource "terraform_keypair"
  key_name = var.terraform_keypair.key_name
  user_data = file("${path.module}/userdata.tpl")
  tags     = {
    Name = "Terraform EC2 - using tls_private_key module"
  }
  depends_on = [var.terraform_keypair]
  #3. Connection Block-
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"

    # Mention the exact private key name which will be generated
    private_key = file("terraform_keypair.pem")
    timeout     = "4m"
  }
}