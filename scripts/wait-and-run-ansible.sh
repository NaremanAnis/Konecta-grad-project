#!/bin/bash
set -e

until ping -c1 8.8.8.8 >/dev/null 2>&1; do
  echo "Waiting for network..."
  sleep 5
done

sudo apt-get update -y
sudo apt-get install -y python3 python3-pip git sshpass
pip3 install --user ansible

if [ ! -d "/home/ubuntu/devops-grad-project" ]; then
  git clone https://github.com/YOUR_GITHUB_USERNAME/devops-grad-project.git /home/ubuntu/devops-grad-project
fi

cd /home/ubuntu/devops-grad-project/ansible
ansible-playbook -i "localhost," -c local playbook-jenkins.yml
