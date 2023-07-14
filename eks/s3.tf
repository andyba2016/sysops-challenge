# resource "aws_s3_bucket" "state_bucket" {
#   bucket = "marfeel-challenge-state-bucket" # Update with your desired bucket name
#   # Enable versioning for the bucket (optional)
#   versioning {
#     enabled = true
#   }

#   # Enable server-side encryption for the bucket (optional)
#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }

# }
