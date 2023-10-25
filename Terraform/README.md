# Terraform AWS EKS Cluster with Karpenter Provisioner

This repository contains Terraform configurations for deploying an Amazon EKS cluster with the Karpenter provisioner on AWS. The setup includes an Amazon EKS cluster, managed node groups, VPC configurations, security groups, and the Karpenter provisioner for optimal auto-scaling capabilities.

## Files and Configuration Details

### eks.tf

The `eks.tf` file contains the Terraform module for creating the Amazon EKS cluster. It includes configurations for the EKS cluster, managed node groups, cluster addons, and networking settings. Key configurations include cluster name, worker group instance types, and auto-scaling settings.

### karpenter.tf

The `karpenter.tf` file includes the Terraform module for provisioning the Karpenter provisioner on the EKS cluster. It configures Karpenter's IAM roles, tags, and sets up the necessary permissions for the provisioner to function correctly.

### network.tf

The `network.tf` file defines the AWS networking resources, including the VPC, subnets, internet gateway, route tables, and security groups. It sets up the networking infrastructure required for the EKS cluster and its components.

### policy.tf

The `policy.tf` file contains configurations for AWS IAM policies and role attachments. It grants necessary permissions for Amazon EBS usage within the EKS cluster. The policy allows actions such as volume creation, deletion, attachment, and tagging.

### variables.tf

The `variables.tf` file defines input variables used across the Terraform configurations. These variables allow customization of the EKS cluster, networking settings, and IAM policies. Modify these variables according to your requirements.

### Helm Configuration

The Helm configurations in `provider "helm"` and `resource "helm_release" "karpenter"` enable the installation and configuration of Karpenter provisioner using Helm. Helm is used to deploy Karpenter into the EKS cluster and set up various parameters such as cluster name, instance profiles, and webhook configurations.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS CLI configured with appropriate permissions.
- AWS account and an existing VPC (or configure the VPC settings in `variables.tf`).
- Knowledge of your AWS region (default: `us-east-1`).

## Usage

### Modify Variables (Optional):
Update the variables in variables.tf according to your requirements, such as cluster name, instance types, and networking settings.

### Terraform Initialization:
```bash
terraform init
```

### Terraform Plan:
Review the plan to ensure everything is set up correctly:

```bash
terraform plan
```
### Terraform Apply:
Apply the Terraform configurations to create the EKS cluster and provision Karpenter:
```bash
terraform apply
```

### Cleaning Up:
When you're done testing, remember to destroy the resources to avoid incurring charges:
```bash
terraform destroy
```

## Important Notes
* Ensure that your AWS credentials are correctly set up and have necessary permissions.
* Review and customize the variables in variables.tf according to your requirements.
* Review and customize the variables in variables.tf according to your requirements.