output "bucket_id" {
  description = "valor do id do bucket"
  value       = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  description = "valor do arn do bucket"
  value       = aws_s3_bucket.bucket.arn

}