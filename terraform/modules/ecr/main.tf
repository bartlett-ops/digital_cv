// ECR Public is free to use
resource "aws_ecrpublic_repository" "repo" {
  repository_name = var.name
  catalog_data {
    about_text        = "Digital CV for Tom Bartlett"
    architectures     = ["x86-64"]
    description       = "Express application for hosting Tom's CV website"
    operating_systems = ["Linux"]
  }

}
