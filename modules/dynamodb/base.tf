resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = var.dynamodb_name
  hash_key = var.dynamodb_hash_key
  read_capacity = var.dynamodb_read_capacity
  write_capacity = var.dynamodb_write_capacity
 
  attribute {
    name = var.dynamodb_attribute_name
    type = var.dynamodb_attribute_type
  }
}