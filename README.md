# $${\color{red} ITI CI/CD Task}$$
> About the Task:

*Task contains the Terraform code to build priavte EKS and bastionhost on aws, The infra includes creating a VPC with public and private subnets, launching bastion instance in the public subnet, and creating Private EKS Cluster .

###                    ______________________________________________________________________________________________

# *Project - Structure*

![image](https://github.com/ahmedgamalbakr/Infra/assets/106693415/1ad1487e-8ad8-4d18-9ee1-07d80e1c0420)

## Overview

This project uses Terraform to create the following AWS resources:

- VPC
- Internet Gateway
- Public Route Table
- Private Route Table
- Public EC2 instance
- NatGateway with ElasticIP 
- Security Groups 
- Node group
- EKS role and policy 
- Node Group role and policy 
- EKS Cluster



###                ______________________________________________________________________________________________

# *Prerequisites *

- AWS account
- Terraform installed on your local machine
- AWS credentials configured on your local machine
- ssh on your local machine to connect to BastionHost to access from it the private cluster
- A Secret Manager in AWS to store aws credentials stored                                   (aws_access_key_id aws_secret_access_key) to but them in bastion host to connect to cluster by it 
- A S3 bucket to store the Terraform state file. 

###                    ______________________________________________________________________________________________


## Build infrastructure

![image](https://github.com/ahmedgamalbakr/Infra/assets/106693415/66b8e788-c113-4f94-8c04-45e81b8c8e87)

![image](https://github.com/ahmedgamalbakr/Infra/assets/106693415/97740041-dce1-42c9-b030-9c2dbeeb8c3d)

![image](https://github.com/ahmedgamalbakr/Infra/assets/106693415/fa6cfd94-c42f-43f0-a711-eef8d7c8b523)


## Ansible configuration
 
 1. Install Packages like `awscli` to use it to update kubeconfig file and `kubectl` to able to connect to the Cluster .
 2. Move Jenkins Deployment manifest files to BastionHost by ansible and then apply it by k8s ansible module to deploy jenkins in cluster in jenkins namespace .
 3. Configure the bastion host machine to act in the same time as a slave for jenkins server to run pipeline from it 


![image](https://github.com/ahmedgamalbakr/Infra/assets/106693415/ff1dff73-d586-4bbf-b8ce-423a8ea9e11f)

![image](https://github.com/ahmedgamalbakr/Infra/assets/106693415/87a7ecb8-646e-4723-864b-390747ef5dd8)

![image](https://github.com/ahmedgamalbakr/Infra/assets/106693415/bcf0e6a8-23c4-4972-a3b9-23517d0b7ef4)








