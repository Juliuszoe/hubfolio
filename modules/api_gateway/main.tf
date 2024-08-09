# Example setup for API Gateway, adjust according to your needs
resource "aws_api_gateway_rest_api" "example_api" {
  name        = var.api_name
  description = var.api_description
}

resource "aws_api_gateway_resource" "example_resource" {
  rest_api_id = aws_api_gateway_rest_api.example_api.id
  parent_id   = aws_api_gateway_rest_api.example_api.root_resource_id
  path_part   = var.api_resource
}

resource "aws_api_gateway_method" "example_method" {
  rest_api_id   = aws_api_gateway_rest_api.example_api.id
  resource_id   = aws_api_gateway_resource.example_resource.id
  http_method   = "GET"
  authorization = "NONE"
}
