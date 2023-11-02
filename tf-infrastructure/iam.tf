resource "aws_iam_policy_attachment" "lambda_ecr_access" {
  name  = "${var.app_name}_${var.environment}_ecr_access"
  roles = [aws_iam_role.lambda_exec_role.name]

  policy_arn = aws_ecr_repository_policy.ecr_repository.policy
}

resource "aws_ecr_repository_policy" "ecr_repository" {
  repository = aws_ecr_repository.ecr_repository.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability"
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_ecr_access_policy" {
  name        = "${var.app_name}_${var.environment}_lambda_ecr_access_policy"
  description = "Policy for Lambda ECR access"
  policy      = aws_ecr_repository_policy.ecr_repository.policy
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "${var.app_name}_${var.environment}_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

