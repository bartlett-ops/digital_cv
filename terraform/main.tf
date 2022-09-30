module "ecr" {
  source                 = "./modules/ecr"
  github_repository_name = "digital_cv"
  providers = {
    // ECR public only available in us-east-1
    aws = aws.us_east_1
  }
}
