# DynamoDB variables
dynamodb_name                   = "terraform-state-lock-dynamo"
dynamodb_hash_key               = "LockID"
dynamodb_read_capacity          = 20
dynamodb_write_capacity         = 20
dynamodb_attribute_name         = "LockID"
dynamodb_attribute_type         = "S"

# S3 variables
bucket_name     = "pipeline-artifacts-casestudy-cicd"


#Pipeline variables
codestar_connector_credentials  = "arn:aws:codestar-connections:us-east-1:878915726377:connection/acae1ec3-3f96-4268-9358-370a730d385d"
s3_id                           = " "

build_project_plan_name         = "tf-cicd-plan"
build_project_plan_description  = "Plan terraform IaC"
build_project_apply_name        = "tf-cicd-apply"
build_project_apply_description = "Build terraform IaC"
build_project_destroy_name      = "tf-cicd-destroy"
build_project_destroy_description = "Destroy terraform IaC"

pl_artifacts_type               = "CODEPIPELINE"
pl_environment_compute_type     = "BUILD_GENERAL1_SMALL"
pl_environment_image            = "aws/codebuild/standard:4.0"
pl_environment_type             = "LINUX_CONTAINER"

buildspec_plan                  = "buildspec/plan-buildspec.yml"
buildspec_apply                 = "buildspec/apply-buildspec.yml"
buildspec_destroy               = "buildspec/destroy-buildspec.yml"

codepipeline_name               = "tf_cicd"
pipeline_artifact_store         = "S3"

repository_id                   = "Mike-In-The-Cloud/drone_shuttles"
repository_branch               = "dev-code-pipeline"

pl_owner                        = "AWS"
pl_version                      = "1"

pl_source_name                  = "Source"
pl_source_category              = "Source"
pl_source_provider              = "CodeStarSourceConnection"
pl_source_output                = "tf-code"
pl_source_output_format         = "CODE_ZIP"  

pl_plan_name                    = "Plan"
pl_plan_action_projectname      = "tf-cicd-plan"
pl_plan_action_output           = "plan_output"
pl_apply_name                   = "Apply"
pl_apply_action_projectname     = "tf-cicd-apply"
pl_destroy_name                 = "Destroy"
pl_destroy_action_projectname   = "tf-cicd-destory"

pl_action_category              = "Build"
pl_provider                     = "CodeBuild"

pl_manual_build_approval_name   = "Approve_Build"
pl_manual_destroy_name          = "Approve_Destroy"
pl_manual_action_name           = "Approval"
pl_manual_action_category       = "Approval"
pl_manual_action_provider       = "Manual"    
