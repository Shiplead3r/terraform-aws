#!/bin/bash
# Author : Mohamed Sherby
# Download and Install Terraform
wget https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_amd64.zip
sudo yum install -y unzip
unzip terraform_1.1.7_linux_amd64.zip
sudo mv terraform /usr/local/bin
# Download and Install aws-cli
pip3 install awscli --user
pip3 install setuptools_rust --user
sudo pip3 install --upgrade pip
pip3 install ansible --user
