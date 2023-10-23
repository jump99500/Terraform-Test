module "node" {
  source = "../../module/node"

  create_lc          = true
  create_asg         = true
  name               = "k8s-infra"
  eks_name           = data.terraform_remote_state.cluster.outputs.eks_id
  security_group_ids = [data.terraform_remote_state.sg.outputs.node_sg_id]
  key_name           = "aws_k8s_test"
  ami_id             = var.ami_id
  instance_type      = var.instance_type

  cluster_ca         = data.terraform_remote_state.cluster.outputs.eks_ca_certificate
  apiserver_endpoint = data.terraform_remote_state.cluster.outputs.eks_endpoint

  volume_encrypted = true
  volume_size      = var.volume_size
  volume_type      = var.volume_type

  min_size          = 0
  max_size          = 0
  desired_capacity  = 0
  subnet_ids        = [data.terraform_remote_state.vpc.outputs.subnet_ids[0], data.terraform_remote_state.vpc.outputs.subnet_ids[1]]
  health_check_type = var.health_check_type
}
