module "eks_managed_node_group" {
  source  = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "19.0.0"

  cluster_name    = module.eks.cluster_name
  cluster_version = module.eks.cluster_version
  subnet_ids      = module.vpc.private_subnets

  name            = "default"
  instance_types  = ["t3.medium"]

  scaling_config = {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  tags = var.common_tags
}
