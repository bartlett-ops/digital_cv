data "aws_iam_policy_document" "terraform_executor" {
  statement {
    sid = "ECRPublic"
    actions = [
      "ecr-public:*"
    ]
    resources = [
      module.ecr.public_repository.arn
    ]
  }
}

data "aws_iam_policy_document" "github_actions" {
  statement {
    sid = "AuthenticatToECR"
    actions = [
      "ecr-public:GetAuthorizationToken",
      "sts:GetServiceBearerToken",
    ]
    resources = ["*"]
  }
}

