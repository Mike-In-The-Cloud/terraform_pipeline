module "casestudy_s3"{
  source                  = "./modules/s3"
  bucket_name             = var.bucket_name
}

module "casestudy_dynamodb"{
    source = "./modules/dynamodb"

    dynamodb_name           = var.dynamodb_name
    dynamodb_hash_key       = var.dynamodb_hash_key
    dynamodb_read_capacity  = var.dynamodb_read_capacity
    dynamodb_write_capacity = var.dynamodb_write_capacity
    dynamodb_attribute_name = var.dynamodb_attribute_name
    dynamodb_attribute_type = var.dynamodb_attribute_type
}

module "casestudy_codepipeline"{
  source                          = "./modules/pipeline"

  s3_id                           = module.casestudy_s3.s3_id

  codestar_connector_credentials  = var.codestar_connector_credentials
  build_project_plan_name         = var.build_project_plan_name
  build_project_plan_description  = var.build_project_plan_description
  build_project_apply_name        = var.build_project_apply_name
  build_project_apply_description = var.build_project_apply_description
  build_project_destroy_name      = var.build_project_destroy_name
  build_project_destroy_description = var. build_project_destroy_description

  pl_artifacts_type               = var.pl_artifacts_type
  pl_environment_compute_type     = var.pl_environment_compute_type
  pl_environment_image            = var.pl_environment_image
  pl_environment_type             = var.pl_environment_type

  buildspec_plan                  = var.buildspec_plan
  buildspec_apply                 = var.buildspec_apply
  buildspec_destroy               = var.buildspec_destroy

  codepipeline_name               = var.codepipeline_name
  pipeline_artifact_store         = var.pipeline_artifact_store
  repository_id                   = var.repository_id
  repository_branch               = var.repository_branch
  pl_owner                        = var.pl_owner
  pl_version                      = var.pl_version
  pl_source_name                  = var.pl_source_name
  pl_source_category              = var.pl_source_category
  pl_source_provider              = var.pl_source_provider
  pl_source_output                = var.pl_source_output
  pl_source_output_format         = var.pl_source_output_format
  pl_plan_name                    = var.pl_plan_name
  pl_plan_action_projectname      = var.pl_plan_action_projectname
  pl_plan_action_output           = var.pl_plan_action_output
  pl_apply_name                   = var.pl_apply_name
  pl_apply_action_projectname     = var.pl_apply_action_projectname
  pl_destroy_name                 = var.pl_destroy_name
  pl_destroy_action_projectname   = var.pl_destroy_action_projectname
  pl_action_category              = var.pl_action_category
  pl_provider                     = var.pl_provider
  pl_manual_build_approval_name   = var.pl_manual_build_approval_name
  pl_manual_destroy_name          = var.pl_manual_destroy_name
  pl_manual_action_name           = var.pl_manual_action_name
  pl_manual_action_category       = var.pl_manual_action_category
  pl_manual_action_provider       = var.pl_manual_action_provider
  }
