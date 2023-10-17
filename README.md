# Deploy microservices application on Aws EKS cluster

The idea of the project is to create pipeline to provision K8s EKS cluster on AWS 
then create another pipeline to Deploy a microservices application on the Aws EKS cluster

# Project diagram

![EKS-diagram](https://github.com/0xZe/F.S-Assessment/assets/81789671/8dfc8aae-9762-4642-a730-348e27663a5f)

# Steps:

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

## Step 4: Create another pipeline to Deploy a microservices application on the Aws EKS cluster

- `Our application files is on` `app` `with a Dockerfile to build them`
- `We will create a pipeline to build our application and deploy it on the EKS cluster`
- `Application Jenkins file is` `app-Jenkinsfile`
- `Stages of application pipeline is:`
    - `login to dockerhub to push application image after build it`
    - `cd` `Ansible-Playbooks` `and run` `build-container.yml playbook` `which is an ansible playbook to build application Dockerfile then push it to dockerhub`
    - `Update` `kubeconfig file` `to add EKS cluster context on it so we can deploy our application on it`
    - `cd` `app-k8s` `and run k8s files to deploy our application`
    - `Last stage of the pipeline is return lb URL so we can access our application`
  
![9](https://github.com/0xZe/F.S-Assessment/assets/81789671/f906d5d6-3e05-48b7-b096-f83c82df9517)

![10](https://github.com/0xZe/F.S-Assessment/assets/81789671/14ca5815-8cec-41a7-a473-e6a5770777b1)
![11](https://github.com/0xZe/F.S-Assessment/assets/81789671/3f8a3f66-8016-4197-8090-030435b03905)
