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
    sid = "AuthenticateWithECR"
    actions = [
      "ecr-public:GetAuthorizationToken",
      "sts:GetServiceBearerToken",
    ]
    resources = ["*"]
  }
  statement {
    sid = "ECRPullPush"
    actions = [
      "ecr-public:CompleteLayerUpload",
      "ecr-public:UploadLayerPart",
      "ecr-public:InitiateLayerUpload",
      "ecr-public:BatchCheckLayerAvailability",
      "ecr-public:PutImage"
    ]
    resources = [
      module.ecr.public_repository.arn
    ]
  }
}

