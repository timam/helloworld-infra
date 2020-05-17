output "instances-profile" {
  value = aws_iam_instance_profile.iam-instances-profile.arn
}
output "role-name" {
  value = aws_iam_role.iam-role.name
}

output "role-arn" {
  value = aws_iam_role.iam-role.arn
}