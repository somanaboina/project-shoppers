terraform {
  backend "s3" {
    bucket         = "soman-ed-eos-terraform-state"
    key            = "eos/eks/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "eos_table"
  }
}
