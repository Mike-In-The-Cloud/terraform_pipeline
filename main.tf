module "casestudy_codepipeline"{
  source              = "./modules/pipeline"

  codestar_connector_credentials = var.codestar_connector_credentials
  s3_id               = module.casestudy_s3.s3_id
}

module "casestudy_s3"{
  source              = "./modules/s3"
}

module "casestudy_dynamodb"{
    source = "./modules/dynamodb"
}