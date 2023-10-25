# Karpenter AWS Provisioner

Karpenter is a Kubernetes cluster autoscaler that provides efficient, multi-cloud, and spot instance scaling capabilities. This README guide will help you understand what the provided Karpenter AWS Provisioner configuration does and how to deploy it.

## What it Does

The provided Karpenter AWS Provisioner configuration automates the process of provisioning AWS EC2 instances in a Kubernetes cluster using spot instances. Spot instances are spare Amazon EC2 instances that are available at a lower price compared to on-demand instances. Karpenter manages these spot instances, ensuring optimal utilization and cost savings for your Kubernetes cluster.

### Configuration Overview

- **Provisioner Configuration (`Provisioner` Kind):**
  - `requirements`: Defines the requirements for the provisioner. In this case, it specifies that spot instances (`karpenter.sh/capacity-type: spot`) should be used.
  - `limits`: Specifies the resource limits for the provisioned instances (e.g., 1000 CPUs).
  - `providerRef`: Refers to the specific provider configuration to be used (in this case, `default`).
  - `ttlSecondsAfterEmpty`: Specifies the time to live (in seconds) after the instances are empty before they are terminated (e.g., 30 seconds).

- **AWS Node Template Configuration (`AWSNodeTemplate` Kind):**
  - `subnetSelector`: Selects the subnet for the provisioned instances based on a specific discovery key (`karpenter.sh/discovery: omer-cluster`).
  - `securityGroupSelector`: Selects the security group for the provisioned instances based on a specific discovery key (`karpenter.sh/discovery: omer-cluster`).

## How to Deploy

**Apply the Karpenter Provisioner Configuration:**

   Apply the `Provisioner` configuration to your Kubernetes cluster:

   ```bash
   kubectl apply -f karpenter-provisioner-config.yaml
   ```