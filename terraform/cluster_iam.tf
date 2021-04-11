module "eks-worker-role" {
  source = "../modules/iam"
  name = "${local.env}-${local.project}-worker-role"
  tags = merge(map("Name",join("-",[local.env,local.project,"eks-woker"])),map("ResourceType","iam"),local.common_tags)
}
resource "aws_iam_role_policy_attachment" "eks-worker-role-nodeplicy" {
  role = module.eks-worker-role.role-name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}
resource "aws_iam_role_policy_attachment" "eks-worker-role-cnipolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role = module.eks-worker-role.role-name
}
resource "aws_iam_role_policy_attachment" "eks-worker-role-servicepolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role = module.eks-worker-role.role-name
}
resource "aws_iam_role_policy_attachment" "eks-worker-role-dynamodb" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  role = module.eks-worker-role.role-name
}
resource "aws_iam_role_policy_attachment" "eks-worker-role-s3" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role = module.eks-worker-role.role-name
}
resource "aws_iam_role_policy_attachment" "eks-worker-role-containerregistry" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role = module.eks-worker-role.role-name
}
resource "aws_iam_role_policy_attachment" "eks-worker-role-CloudWatchAgentServerPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role = module.eks-worker-role.role-name
}
resource "aws_iam_role_policy_attachment" "eks-worker-role-EC2FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role = module.eks-worker-role.role-name
}
resource "aws_iam_role_policy_attachment" "eks-worker-role-WAFFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AWSWAFFullAccess"
  role = module.eks-worker-role.role-name
}
