data "aws_s3_bucket_object" "lambda_code" {
  bucket = var.code_bucket
  key = var.code_key
}

module "main" {
  source = "telia-oss/lambda/aws"
  version = "3.1.0"

  name_prefix = "${var.environment}-hello-world"
  policy = data.aws_iam_policy_document.main.json

  s3_bucket = data.aws_s3_bucket_object.lambda_code.bucket
  s3_key = data.aws_s3_bucket_object.lambda_code.key

  handler = var.handler
  runtime = var.runtime

  environment = {}
}

data "aws_iam_policy_document" "main" {
  statement {
    # Allow logging to CloudWatch
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "*",
    ]
  }
}

//resource "aws_lambda_permission" "main" {
//  statement_id = "AllowExecutionFrom${aws_apigatewayv2_api.main.name}"
//  action = "lambda:InvokeFunction"
//  function_name = module.main.name
//  principal = "apigateway.amazonaws.com"
//  source_arn = "${aws_apigatewayv2_api.main.execution_arn}/*/*/*"
//}
//
//resource "aws_apigatewayv2_api" "main" {
//  name = "${module.main.name}_http_api"
//  protocol_type = "HTTP"
//}
//
//resource "aws_apigatewayv2_integration" "main" {
//  api_id = aws_apigatewayv2_api.main.id
//  integration_type = "AWS_PROXY"
//  integration_method = "POST"
//  integration_uri = module.main.invoke_arn
//}
//
//resource "aws_apigatewayv2_stage" "main" {
//  api_id = aws_apigatewayv2_api.main.id
//  name = "default"
//  auto_deploy = true
//}
//
//resource "aws_apigatewayv2_route" "main" {
//  api_id = aws_apigatewayv2_api.main.id
//  route_key = "$default"
//  target = "integrations/${aws_apigatewayv2_integration.main.id}"
//}