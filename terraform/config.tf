locals {
  stack_name             = "digital_cv"
  github_repository_name = "digital_cv"
  aws_iam_user_configs = {
    github_actions = {
      policy_document = data.aws_iam_policy_document.github_actions
    }
    terraform_executor = {
      policy_document = data.aws_iam_policy_document.terraform_executor
    }
  }
}
