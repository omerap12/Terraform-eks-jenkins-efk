resource "aws_iam_policy" "ebs-policy" {
  name        = "ebs-policy-attachement"
  description = "Policy that allows pvc for eks"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Sid    = "VisualEditor0",
      Effect = "Allow",
      Action = [
        "ec2:CreateVolume",
        "ec2:DeleteVolume",
        "ec2:DetachVolume",
        "ec2:AttachVolume",
        "ec2:DescribeInstances",
        "ec2:CreateTags",
        "ec2:DeleteTags",
        "ec2:DescribeTags",
        "ec2:DescribeVolumes"
      ],
      Resource = "*"
    }]
  })
  depends_on = [module.my-cluster]
}

resource "aws_iam_role_policy_attachment" "ebs-policy-attach" {
  role       = module.my-cluster.eks_managed_node_groups.dev.iam_role_name
  policy_arn = aws_iam_policy.ebs-policy.arn
  depends_on = [aws_iam_policy.ebs-policy]
}