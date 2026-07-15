data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

output "aws_caller_identity" {
  value = data.aws_caller_identity.current
}

output "aws_region" {
  value = data.aws_region.current
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_id" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}