output "cloudfront_access_role_name" {
  value = aws_iam_role.cloudfront_access_role.name
}

output "cloudfront_access_policy_arn_permission" {
  value = aws_iam_policy.cloudfront_access_policy.arn
}