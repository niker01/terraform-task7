resource "aws_instance" "main" {
  ami           = "ami-0df368112825f8d8f"
  instance_type = "t3.micro"

  subnet_id = data.terraform_remote_state.base_infra.outputs.public_subnet_id

  vpc_security_group_ids = [
    data.terraform_remote_state.base_infra.outputs.security_group_id
  ]

  tags = {
    Terraform = "true"
    Project   = var.project_id
  }
}