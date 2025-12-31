terraform {
  backend "s3" {
    bucket         = "kishan-devops-terraform-state"
    key            = "platform/terraform.tfstate"
    region         = "us-east-1"

    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
