resource "aws_iam_role" "cloudfront_access_role" {
  name = "cloudfront_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Sid       = ""
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_policy" "cloudfront_access_policy" {
  name = "cloudfront_access_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "cloudfront:GetDistribution",
          "cloudfront:GetStreamingDistribution",
          "cloudfront:ListDistributions",
          "cloudfront:ListStreamingDistributions"
        ]
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy_cloudfront" {
  role       = aws_iam_role.cloudfront_access_role.name
  policy_arn = aws_iam_policy.cloudfront_access_policy.arn
}

# output "cloudfront_access_role_name" {
#   value = aws_iam_role.cloudfront_access_role.name
# }
output "cloudfront_access_policy_arn" {
  value = aws_iam_role.cloudfront_access_role
}


# output "cloudfront_access_policy_arn" {
#   value = aws_iam_policy.cloudfront_access_policy.arn
# }