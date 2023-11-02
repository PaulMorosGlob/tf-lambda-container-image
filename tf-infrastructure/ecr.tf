resource "aws_ecr_repository" "ecr_repository" {
  name = "${var.app_name}_${var.environment}_ecr_repository"
}

output "ecr_repository_url" {
  value = aws_ecr_repository.ecr_repository.repository_url
}