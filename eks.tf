module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.4"

  cluster_name    = local.cluster_name
  cluster_version = "1.32"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"
      instance_types = ["m5.large"]
      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name = "node-group-2"
      instance_types = ["m5.large"]
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }

    three = {
      name = "node-group-3"
      instance_types = ["m5.large"]
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }

    four = {
      name = "node-group-4"
      instance_types = ["m5.large"]
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }

    five = {
      name = "node-group-5"
      instance_types = ["m5.large"]
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }

    six = {
      name = "node-group-6"
      instance_types = ["m5.large"]
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }

    seven = {
      name = "node-group-7"
      instance_types = ["m5.large"]
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }

    eight = {
      name = "node-group-8"
      instance_types = ["m5.large"]
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}