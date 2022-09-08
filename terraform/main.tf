module "ecr" {
  source = "./modules/ecr"
  name = "tom-digital-cv"
  providers = {
    // ECR public only available in us-east-1
    aws = aws.us_east_1
  }
}
