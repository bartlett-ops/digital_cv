// ECR Public is free to use
resource "aws_ecrpublic_repository" "repo" {
  repository_name = var.github_repository_name
  catalog_data {
    about_text        = "Digital CV for Tom Bartlett"
    architectures     = ["x86-64"]
    description       = "Express application for hosting Tom's CV website"
    operating_systems = ["Linux"]
  }
}

#resource "github_actions_secret" "ecr_url" {
#  repository      = var.github_repository_name
#  secret_name     = "DOCKER_REGISTRY"
#  plaintext_value = aws_ecrpublic_repository.repo.repository_uri
#}
