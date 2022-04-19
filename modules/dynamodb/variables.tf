variable dynamodb_name {
  type = string
  description = "Name of DynamoDB table"
}
variable dynamodb_hash_key {
  type = string
  description = "Hash key for DynamoDB"
}
variable dynamodb_read_capacity{
  type = number
  description = "Dynaomodb read capacity"
}
variable dynamodb_write_capacity{
  type = number
  description = "DynamoDB write capactiy"
}
variable "dynamodb_attribute_name" {
  type = string
  description = "DynamoDB attribute name"
}
variable dynamodb_attribute_type {
  type = string
  description = "DynamoDB Attribute type"
}
