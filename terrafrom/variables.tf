variable "subnets" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "common_tags" {
  description = "Tags for resources"
  type        = map(string)
}

variable "ssh_key_name" {
  description = "EC2 SSH key pair name"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to your private key (.pem)"
  type        = string
}

variable "ubuntu_ami" {
  description = "Ubuntu AMI ID"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}
