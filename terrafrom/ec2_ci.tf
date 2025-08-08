resource "aws_instance" "jenkins" {
  ami           = var.ubuntu_ami
  instance_type = "t3.medium"
  subnet_id     = module.vpc.public_subnets[0]
  key_name      = var.ssh_key_name

  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  provisioner "file" {
    source      = "${path.module}/../scripts/wait-and-run-ansible.sh"
    destination = "/home/ubuntu/wait-and-run-ansible.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/wait-and-run-ansible.sh",
      "/home/ubuntu/wait-and-run-ansible.sh"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.ssh_private_key_path)
      host        = self.public_ip
    }
  }
}
