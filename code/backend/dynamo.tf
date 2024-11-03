resource "aws_dynamodb_table" "terraform-lock" {
  name         = "eos-table"
  read_capacity  = 5
  write_capacity = 5
  hash_key     = "LockID"  # Ensure this matches the attribute name
  
  attribute {
    name = "LockID"       # Consistent with the hash_key
    type = "S"
  }

  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}

