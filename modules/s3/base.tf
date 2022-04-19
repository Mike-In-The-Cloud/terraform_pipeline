resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = var.bucket_name

  tags = {
    Name = "${terraform.workspace}-S3-Artifact-Bucket"
  }
} 