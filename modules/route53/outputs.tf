output "route53_record_name" {
  value = aws_route53_record.www.fqdn
}
