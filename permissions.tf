resource "aws_iam_policy" "s3_policy" {
  name = "s3-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:ListBucket",
          "s3:GetObject"
        ],
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "attach_policy_s3" {
  role       = module.iam.cloudfront_access_role_name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_role_policy_attachment" "attach_policy_cloudfront" {
  role       = module.iam.cloudfront_access_role_name
  policy_arn = module.iam.cloudfront_access_policy_arn_permission
}

# resource "aws_iam_role_policy_attachment" "attach_policy_cloudfront" {
#   role       = module.iam.cloudfront_access_role_name
#   policy_arn = module.iam.cloudfront_access_policy_arn
# }
