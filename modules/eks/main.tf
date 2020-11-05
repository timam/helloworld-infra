resource "aws_eks_cluster" "eks" {
  depends_on = [aws_iam_role.eks-role]
  name = var.name
  role_arn = aws_iam_role.eks-role.arn
  version = var.eksVersion
  vpc_config {
    subnet_ids = var.subnet_ids
    security_group_ids = var.security_group_ids
    endpoint_private_access = true
    endpoint_public_access = false
  }
  enabled_cluster_log_types = ["api", "audit"]
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_iam_role" "eks-role" {
  name = var.name
  tags = var.tags
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-role.name
}
resource "aws_iam_role_policy_attachment" "AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.eks-role.name
}
resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role = aws_iam_role.eks-role.name
}
