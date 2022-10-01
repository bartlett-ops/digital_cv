resource "aws_iam_user" "users" {
  for_each = var.aws_iam_user_configs
  name     = replace("${var.name_prefix}-${each.key}", "/[^a-zA-Z0-9]/", "-")
}

resource "aws_iam_access_key" "keys" {
  for_each = aws_iam_user.users
  user     = each.value.name
}

resource "aws_iam_policy" "policies" {
  for_each    = var.aws_iam_user_configs
  name        = "${aws_iam_user.users[each.key].name}-user-policy"
  description = "${aws_iam_user.users[each.key].name} user policy"
  policy      = each.value.policy_document.json
}

resource "aws_iam_user_policy_attachment" "attachments" {
  for_each   = var.aws_iam_user_configs
  user       = aws_iam_user.users[each.key].name
  policy_arn = aws_iam_policy.policies[each.key].arn
}

