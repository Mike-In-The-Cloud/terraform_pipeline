# plan build
resource "aws_codebuild_project" "tf-plan" {
  name          = var.build_project_plan_name
  description   = var.build_project_apply_description
  service_role  = aws_iam_role.tf-codebuild-role.arn

  artifacts {
    type = var.pl_artifacts_type
  }

  environment {
    compute_type    = var.pl_environment_compute_type
    image           = var.pl_environment_image
    type            = var.pl_environment_type 
  }
    
 source {
     type   = var.pl_artifacts_type
     buildspec = file("${path.module}/${var.buildspec_plan}")
 }
}

# apply build
resource "aws_codebuild_project" "tf-apply" {
  name          = var.build_project_apply_name 
  description   = var.build_project_apply_description
  service_role  = aws_iam_role.tf-codebuild-role.arn

  artifacts {
    type = var.pl_artifacts_type
  }

  environment {
    compute_type    = var.pl_environment_compute_type
    image           = var.pl_environment_image
    type            = var.pl_environment_type
  }
    
 source {
     type       = var.pl_artifacts_type
     buildspec  = file("${path.module}/${var.buildspec_apply}")
 }
}

# destroy build
resource "aws_codebuild_project" "tf-destroy" {
  name          = var.build_project_destroy_name
  description   = var.build_project_destroy_description
  service_role  = aws_iam_role.tf-codebuild-role.arn

  artifacts {
    type = var.pl_artifacts_type
  }

  environment {
    compute_type    = var.pl_environment_compute_type
    image           = var.pl_environment_image
    type            = var.pl_environment_type
  }
    
 source {
     type       = var.pl_artifacts_type
     buildspec  = file("${path.module}/${var.buildspec_destroy}")
 }
}

resource "aws_codepipeline" "cicd_pipeline" {

    name        = var.codepipeline_name
    role_arn    = aws_iam_role.tf-codepipeline-role.arn

    artifact_store {
        type        = var.pipeline_artifact_store
        location    = var.s3_id
    }

    stage {
        name = var.pl_source_name
        action{
            name                = var.pl_source_name
            category            = var.pl_source_category
            owner               = var.pl_owner
            provider            = var.pl_source_provider
            version             = var.pl_version 
            output_artifacts    = [var.pl_source_output]
            configuration = {
                FullRepositoryId        = var.repository_id 
                BranchName              = var.repository_branch 
                ConnectionArn           = var.codestar_connector_credentials
                OutputArtifactFormat    = var.pl_source_output_format
            }
        }
    }
# build stage one
    stage {
        name = var.pl_plan_name
        action{
            name                = var.pl_action_category
            category            = var.pl_action_category 
            provider            = var.pl_provider
            version             = var.pl_version
            owner               = var.pl_owner
            input_artifacts     = [var.pl_source_output]
            output_artifacts    = [var.pl_plan_action_output]
            configuration       = {
                ProjectName     = var.pl_plan_action_projectname
            }
        }
    }
# manual approval
    stage {
        name = var.pl_manual_build_approval_name
        action {
            name     = var.pl_manual_action_name
            category = var.pl_manual_action_category 
            owner    = var.pl_owner
            provider = var.pl_manual_action_provider
            version  = var.pl_version

        }
    }   

# build stage 2
    stage {
        name = var.pl_apply_name
        action{
            name            = var.pl_apply_name
            category        = var.pl_action_category
            provider        = var.pl_provider
            version         = var.pl_version
            owner           = var.pl_owner
            input_artifacts = [var.pl_source_output]
            configuration   = {
                ProjectName = var.pl_apply_action_projectname
            }
        }
    }

# manual approval     
    stage {
        name = var.pl_manual_destroy_name
        action {
            name     = var.pl_manual_destroy_name
            category = var.pl_manual_action_category
            owner    = var.pl_owner
            provider = var.pl_manual_action_provider
            version  = var.pl_version

        }
    } 
    # destroy
    stage {
        name = var.pl_destroy_name 
        action{
            name            = var.pl_destroy_name 
            category        = var.pl_action_category
            provider        = var.pl_provider
            version         = var.pl_version
            owner           = var.pl_owner
            input_artifacts = [var.pl_source_output]
            configuration   = {
                ProjectName = var.pl_destroy_action_projectname
            }
        }
    } 


}
    