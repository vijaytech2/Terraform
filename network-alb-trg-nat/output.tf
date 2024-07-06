output "terraform_keypair" {
  value = aws_key_pair.generated_key
}
output "vpcid" {
  value = aws_vpc.production-vpc.id
}
output "public-subnet" {
  value = aws_subnet.public-subnet.id
}