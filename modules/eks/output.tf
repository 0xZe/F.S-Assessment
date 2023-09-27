
output "endpoint" {
  value = aws_eks_cluster.eks-cluster.endpoint
}

output "eks-cluster-name" {
  value = aws_eks_cluster.eks-cluster.name
}