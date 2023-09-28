# Deploy microservices application on Aws EKS cluster

The idea of the project is to create pipeline to provision K8s EKS cluster on AWS 
then create another pipeline to Deploy a microservices application on the Aws EKS cluster


## Step 1: Prerequisites

- `I customed jenkins image with terraform, ansible, docker client and kubectl installed in it,Cause we will need these tools in our pipelines`
- `Image Docerfile is in`  `jenkins-Dockerfile`

## Step 2: Run container from the customed image to create the pipelines

![1](https://github.com/0xZe/F.S-Assessment/assets/81789671/cfb3398b-24a8-4afd-b271-76968d4d8b02)

## Step 3: Create a pipeline to provision the infrastructure

- `EKS cluster and infrastructure are provisioned through a parameterized jenkins pipeline to facilitate build and destroy the infrastructure`
- `Infrastructure files is 3 modules` `vpc-network module` `bastion module` `eks module`
- `modules Iac files is in` `modules` 
- `Infrastructure Jenkinsfile is in` `modules-Jenkinsfile`

![2](https://github.com/0xZe/F.S-Assessment/assets/81789671/4c5ea2c2-2508-44f3-a40f-c374e0dce9c2)

- `Infrastructure is provisioned and resources are created`

![3](https://github.com/0xZe/F.S-Assessment/assets/81789671/ec445cda-55da-4dec-ac25-73eccf680eee)

## Step 4: Install docker on EKS worker nodes

- `We will need docker on our cluster worker nodes so we can run kubectl commands and deploy our application on the cluster`
  
### A) Configure bastion

- `Because of our cluster is private, we can't connect to the nodes directly and install docker on it`
- `So we must first configure a bastion or jump host to act as a proxy to run our commands on the nodes through that bastion`
- `We will do that through creating a` `~/.ssh/config file` `in our master machine and put connection information in it`

![4](https://github.com/0xZe/F.S-Assessment/assets/81789671/5c0fc80d-aedf-4904-9814-5ad4713e7a17)
![5](https://github.com/0xZe/F.S-Assessment/assets/81789671/ad8b6b9b-e3e3-448f-9746-cc91835d9da0)

- `Now We can run any commands in cluster worker nodes through the bastion`

### b) Install docker

- `I made ansible playbook to install docker on cluster worker nodes`
- `inventory file contains private ips of worker nodes`
- `install-docker.yml` `is in` `Ansible-Playbooks`

![6](https://github.com/0xZe/F.S-Assessment/assets/81789671/dea5c541-567d-491e-81de-0e18ea2dade1)

![7](https://github.com/0xZe/F.S-Assessment/assets/81789671/2be7e76e-c743-4c50-bda4-c20f1f5e0fc9)
![8](https://github.com/0xZe/F.S-Assessment/assets/81789671/e1759dc4-0590-4695-8a2a-f1e57d2eefef)





  







  






