variable "name_prefix" {
  type = string
}

variable "aws_iam_user_configs" {
  type = map(object({
    policy_document = object({
      json = string
    })
  }))
}
