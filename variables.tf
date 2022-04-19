# dynamodb variables
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

# S3 variables
variable bucket_name {
  type = string
  description = "S3 bucket name"
}

# # code pipline varaibles 
variable codestar_connector_credentials {
  type = string
  description = "ARN of codestar connection to repository"
}
variable "s3_id" {
  type = string
  description = "S3 ID output from S3 module"
}
variable "build_project_plan_name" {
  type = string
  description = "Build Project planning stage name"
}
variable "build_project_plan_description" {
  type = string
  description = "Build Project plan Description of resource"
}
variable "build_project_apply_name" {
  type = string
  description = "(Build Project apply stage name"
}
variable "build_project_apply_description" {
  type = string
  description = "Build Project apply description of resources"
}
variable "build_project_destroy_name" {
  type = string
  description = "Build Project destroy name"
}
variable "build_project_destroy_description" {
  type = string
  description = "Build Project destroy description"
}
variable "pl_artifacts_type" {
  type = string
  description = "Pipeline artifacts type"
}
variable "pl_environment_compute_type" {
  type = string
  description = "Pipeline compute type"
}
variable "pl_environment_image" {
  type = string
  description = "Pipeline environment image"
}
variable "pl_environment_type" {
  type = string
  description = "Pipeline environemnt type"
}
variable "buildspec_plan" {
  type = string
  description = "Path to plan build spec file"
}
variable "buildspec_apply" {
  type = string
  description = "path tp apply build spec file"
}
variable "buildspec_destroy" {
  type = string
  description = "path to destroy buildspec file"
}
variable "codepipeline_name" {
  type = string
  description = "Name of pipeline"
}
variable "pipeline_artifact_store" {
  type = string
  description = "artifact storage for pipeline"
}
variable "repository_id" {
  type = string
  description = "Name of repository"
}
variable "repository_branch" {
  type = string
  description = "Name of branch within repo"
}
variable "pl_owner" {
  type = string
  description = "pipeline owner"
}
variable "pl_version" {
  type = string
  description = "Versioning identification"
}
variable "pl_source_name" {
  type = string
  description = "Pipeline name for getting source code of the project"
}
variable "pl_source_category" {
  type = string
  description = "pipeline category"
}
variable "pl_source_provider" {
  type = string
  description = "providor of connection to repository"
}
variable "pl_source_output" {
  type = string
  description = "Output name of source"
}
variable "pl_source_output_format" {
  type = string
  description = "Output format of source code"
}
variable "pl_plan_name" {
  type = string
  description = "Pipeline stage name - planning stage"
}
variable "pl_plan_action_projectname" {
  type = string
  description = "Pipeline action project name"
}
variable "pl_plan_action_output" {
  type = string
  description = "Pipleline output name for planning"
}
variable "pl_apply_name" {
  type = string
  description = "Pipeline stage name - apply phase"
}
variable "pl_apply_action_projectname" {
  type = string
  description = "Project name for apply phase"
}
variable "pl_destroy_name" {
  type = string
  description = "Pipeline stage name - Destroy phase"
}
variable "pl_destroy_action_projectname" {
  type = string
  description = "Pipeline project name for destroy phase"
}
variable "pl_action_category" {
  type = string
  description = "Category type for pipeline"
}
variable "pl_provider" {
  type = string
  description = "pipeline provider"
}
variable "pl_manual_build_approval_name" {
  type = string
  description = "Name for manual approval build stage"
}
variable "pl_manual_destroy_name" {
  type = string
  description = "Name for manual approval destroy stage"
}
variable "pl_manual_action_name" {
  type = string
  description = "Action Name"
}
variable "pl_manual_action_category" {
  type = string
  description = "Action category"
}
variable "pl_manual_action_provider" {
  type = string
  description = "Action provider"
}