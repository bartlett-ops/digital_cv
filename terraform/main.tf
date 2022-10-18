module "ecr" {
  source                 = "./modules/ecr"
  github_repository_name = local.github_repository_name
  providers = {
    // ECR public only available in us-east-1
    aws = aws.us_east_1
  }
}

module "aws_iam_users" {
  source               = "./modules/aws_iam_users"
  name_prefix          = local.stack_name
  aws_iam_user_configs = local.aws_iam_user_configs
}

locals {
  iam_credentials = merge([for key, value in module.aws_iam_users.credentials :
    {
      "user_${key}__AWS_ACCESS_KEY_ID"     = value.aws_access_key_id,
      "user_${key}__AWS_SECRET_ACCESS_KEY" = value.aws_secret_access_key
    }
  ]...)

  actions_secrets = merge(
    {
      DOCKER_REGISTRY = module.ecr.public_repository.repository_uri
    },
    local.iam_credentials
  )
}


resource "github_actions_secret" "secrets" {
  for_each        = nonsensitive(sensitive(local.actions_secrets))
  repository      = local.github_repository_name
  secret_name     = each.key
  plaintext_value = each.value
}


