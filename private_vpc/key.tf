resource "aws_key_pair" "aws_key" {
  key_name   = "AWSTFkey"
  public_key = file("~/.ssh/AWSTFkey.pub")
}