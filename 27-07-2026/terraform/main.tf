resource "aws_dynamodb_table" "pathnex_table" {
  name         = "pathnex-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}