resource "aws_iam_role" "iam-role" {
  name = var.name
  tags = var.tags
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "iam-instances-profile" {
  name = var.name
  role = aws_iam_role.iam-role.name
}