# Terrafom-EKS-Jenkins-EFK

## Overview
This project provides infrastructure as code (IaC) components for deploying an Amazon EKS cluster, Jenkins, and an EFK stack (Elasticsearch, Fluentd, Kibana) on AWS. These components are designed to streamline the deployment process and ensure a consistent and manageable infrastructure setup.

## Components
This project contains three major component:

1. **Terraform:** This component contains Terraform configurations for deploying an Amazon EKS cluster with the Karpenter provisioner on AWS. The setup includes an Amazon EKS cluster, managed node groups, VPC configurations, security groups, and the Karpenter provisioner for optimal auto-scaling capabilities.

2. **Jenkins:** This component contains configurations and a Jenkinsfile for deploying Jenkins on Kubernetes using Helm and managing the deployment with an automated pipeline.

3. **efk:** This component contains configurations for deploying the ElasticSearch-Fluentd-Kibana (EFK) stack on Kubernetes for log aggregation and visualization. The setup includes three main components: Elasticsearch, Fluentd, and Kibana, along with a demo pod for testing purposes.

4. **karpenter:** This component contains Karpenter AWS Provisioner configuration automates the process of provisioning AWS EC2 instances in a Kubernetes cluster using spot instances. Spot instances are spare Amazon EC2 instances that are available at a lower price compared to on-demand instances. Karpenter manages these spot instances, ensuring optimal utilization and cost savings for your Kubernetes cluster.

## Prerequisites

Before you begin, make sure you have the following prerequisites:

- **AWS Credentials:** Ensure that your AWS credentials are correctly set up and have the necessary permissions for creating and managing resources on AWS.
- **Terraform:** Install Terraform on your local machine. You can download it from [terraform.io](https://www.terraform.io/downloads.html).
- **Kubernetes and kubectl:** If you plan to interact with the EKS cluster, ensure you have `kubectl` installed and configured to work with your EKS cluster.
## Deployment Steps
To create and deploy an EKS cluster, Jenkins, EFK stack, Karpenter provisioner, and CPU autoscaling using Terraform, follow these steps:

### 1. Create EKS Cluster
Create the EKS cluster using Terraform component.

### 2. Deploy Jenkins
Deploy the Jenkins using the Jenkins component.

### 3. Deploy EFK Stack
Deploy the EFK stack using the efk component.

### 4. Deploy Karpenter
Deploy Karpenter provisioner using the Karpenter component.