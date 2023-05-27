resource "aws_iam_role" "eks_cluster" {

  name = "eks-cluster"


  # The role that Amazon EKS will use to create AWS resources for Kubernetes clusters
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

resource "aws_iam_role_policy_attachment" "amazon_eks_cluster_policy" {
    
  # The ARN of the policy you want to apply
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

  # The role the policy should be applied to
  role = aws_iam_role.eks_cluster.name
}


resource "aws_eks_cluster" "eks" {
  # Name of the cluster.
  name = "MY-EKS"

  role_arn = aws_iam_role.eks_cluster.arn

  version = "1.27"

  vpc_config {

    endpoint_private_access = true
    endpoint_public_access = false

    # Must be in at least two different availability zones
    subnet_ids = [
      module.network.private_subnet_id_1,
      module.network.private_subnet_id_2
      
    ]
     security_group_ids = [aws_security_group.eks_cluster_sg.id]

  }

  
  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_cluster_policy
  ]
}