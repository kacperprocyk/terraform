data "aws_vpc" "prod_vpc" {
  tags = {
    Env = "NonProd"
  }
}

output "prod_vpc_id" {
  value = data.aws_vpc.prod_vpc.id
}