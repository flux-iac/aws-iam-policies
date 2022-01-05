variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}

variable "access_key" { }
variable "secret_key" { }


provider "aws" {
  region = "ap-southeast-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_iam_role_policy" "karpenter_controller" {
  name = "karpenter-policy-${var.cluster_name}"
  // role = module.iam_assumable_role_karpenter.iam_role_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:CreateLaunchTemplate",
          "ec2:CreateFleet",
          "ec2:RunInstances",
          "ec2:CreateTags",
          "iam:PassRole",
          "ec2:TerminateInstances",
          "ec2:DescribeLaunchTemplates",
          "ec2:DescribeInstances",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
          "ec2:DescribeInstanceTypes",
          "ec2:DescribeInstanceTypeOfferings",
          "ec2:DescribeAvailabilityZones",
          "ssm:GetParameter"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
