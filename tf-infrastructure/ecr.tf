resource "aws_ecr_repository" "ecr_repository" {
  name = "${var.app_name}_ecr_repository"
}