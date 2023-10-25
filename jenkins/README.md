# Jenkins Deployment Pipeline with Kubernetes and Helm

This repository contains configurations and a Jenkinsfile for deploying Jenkins on Kubernetes using Helm and managing the deployment with an automated pipeline.

## Files Overview

### 1. `jenkins-deployment.yml`

This Kubernetes YAML file defines the deployment and service for Jenkins in the `jenkins` namespace. It creates a Deployment with one replica and exposes it via a Service with a LoadBalancer type. Jenkins is deployed using the `jenkins/jenkins:lts` Docker image.

### 2. `Jenkinsfile`

The Jenkinsfile is a declarative pipeline script for Jenkins. It performs the following tasks:

- Installs Helm and AWS CLI on the Jenkins agent.
- Connects to AWS with provided credentials.
- Connects to an EKS cluster named 'omer-cluster'.
- Installs `kubectl` and deploys an NGINX chart using Helm.
- Deploys the Kubernetes Metrics Server and checks its deployment.
- Installs KEDA and sets up CPU and Cron-based autoscaling for the deployed NGINX.

### 3. `values.yml`

This YAML file contains Helm values for configuring the NGINX deployment. It specifies CPU resource requests and limits and sets the service type to LoadBalancer.

## Prerequisites

- Jenkins installed and configured with appropriate plugins (for running the pipeline).
- Kubernetes cluster with `kubectl` configured.
- AWS CLI installed on the Jenkins agent.
- AWS credentials set up in Jenkins credentials store.
- EKS cluster named 'omer-cluster' available.
- Helm installed on the Jenkins agent.

## How to Use

1. **Create a Jenkins Job:**
   - Create a new Jenkins job and configure it to use the provided `Jenkinsfile` as the pipeline script.
   - Ensure the necessary plugins and credentials are set up in your Jenkins instance.

2. **Deploy Jenkins:**
   - Apply the `jenkins-deployment.yml` file to your Kubernetes cluster:
     ```bash
     kubectl apply -f jenkins-deployment.yml
     ```
   - This will create a Jenkins deployment and service in the `jenkins` namespace.

3. **Run the Jenkins Pipeline:**
   - Trigger the Jenkins job to run the pipeline.
   - The pipeline will automatically install Helm, deploy NGINX, set up metrics server, install KEDA, and configure CPU and Cron-based autoscaling.

4. **Clean Up:**
   - After testing, remove the deployed resources using `kubectl delete` commands or appropriate Jenkins job stages for cleanup.

## Important Notes

- Ensure proper access control and security measures are in place, especially when dealing with AWS credentials and cluster access.
- Review and customize the configurations and scripts according to your specific requirements and security guidelines.

Feel free to modify and extend the provided configurations and pipeline according to your project needs.