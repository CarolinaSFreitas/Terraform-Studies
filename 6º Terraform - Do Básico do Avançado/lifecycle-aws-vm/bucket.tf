resource "aws_s3_bucket" "meu-bucket" {
  bucket = "carolfreitas-lifecycle-test"

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags
    ]
  }

  tags = {
    test = "vscode"
  }
}