output "credentials" {
  value = { for key, value in aws_iam_access_key.keys :
    key => {
      aws_access_key_id     = value.id
      aws_secret_access_key = value.secret
    }
  }
}
