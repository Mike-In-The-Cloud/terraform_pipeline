#region output
output "AWS_Region" {
  value = data.aws_region.current.name
}

#outputs for S3 Module
output "s3_id" {
  value = module.casestudy_s3.s3_id
  
 }