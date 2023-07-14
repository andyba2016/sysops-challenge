# terraform {
#   backend "s3" {
#     bucket               = "marfeel-challenge-state-bucket"
#     key                  = "terraform-cluster.tfstate"
#     region               = "us-west-2"
#     workspace_key_prefix = "workspaces"
#     dynamodb_table       = "terraform-state-lock-dynamo"
#   }
#   depends_on = [aws_s3_bucket.state_bucket]
# }