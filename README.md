# Deploy microservices application on Aws EKS cluster

The idea of the project is to create pipeline to provision K8s EKS cluster on AWS 
then create another pipeline to Deploy a microservices application on the Aws EKS cluster


## Step 1: Prerequisites

`I customed jenkins image with terraform, ansible, docker client and kubectl installed in it,Cause we will need these tools in our pipelines`
`Image Docerfile is in`  `jenkins-Dockerfile`

## Step 2: Run container from the customed image to create the pipelines

![1](https://github.com/0xZe/F.S-Assessment/assets/81789671/cfb3398b-24a8-4afd-b271-76968d4d8b02)

## Step 3: Create a pipeline to provision the infrastructure

`EKS cluster and infrastructure are provisioned through a parameterized jenkins pipeline to facilitate build and destroy the infrastructure`
`Infrastructure files is 3 modules` `vpc-network module` `bastion module` `eks module`
`Iac files is in` `modules` 
`Infrastructure Jenkinsfile is in` `modules-Jenkinsfile`

![2](https://github.com/0xZe/F.S-Assessment/assets/81789671/4c5ea2c2-2508-44f3-a40f-c374e0dce9c2)

`Infrastructure is provisioned and resources are created`

![3](https://github.com/0xZe/F.S-Assessment/assets/81789671/ec445cda-55da-4dec-ac25-73eccf680eee)





