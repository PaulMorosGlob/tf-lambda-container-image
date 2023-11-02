resource "aws_lambda_function" "container_lambda" {
  function_name = "${var.app_name}_${var.environment}_container_lambda"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "app.handler" # Adjust the handler based on your app
  image_uri     = "${aws_ecr_repository.ecr_repository.repository_url}:latest"

  package_type = "Image"
  timeout      = 10
  memory_size  = 256
}