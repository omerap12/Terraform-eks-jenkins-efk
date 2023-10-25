# EFK Stack Deployment on Kubernetes

This repository contains configurations for deploying the ElasticSearch-Fluentd-Kibana (EFK) stack on Kubernetes for log aggregation and visualization. The setup includes three main components: Elasticsearch, Fluentd, and Kibana, along with a demo pod for testing purposes.

## 1. Elasticsearch

### 1.1 `01_aws-pvc.yml`

Defines a StorageClass for dynamically provisioning AWS EBS volumes for Elasticsearch pods.

### 1.2 `02_es-svc.yml`

Creates a headless service for Elasticsearch to facilitate internal communication between pods.

### 1.3 `03_es-sts.yml`

Deploys Elasticsearch as a StatefulSet with three replicas and configures necessary settings.

## 2. Fluentd

### 2.1 `01_fluentd-role.yml`

Creates a ClusterRole for Fluentd to access Kubernetes API and pods.

### 2.2 `02_fluentd-sa.yml`

Defines a ServiceAccount for Fluentd to run with restricted permissions.

### 2.3 `03_fluentd-rb.yml`

Creates a ClusterRoleBinding to bind the ClusterRole to the ServiceAccount.

### 2.4 `04_fluentd-ds.yml`

Deploys Fluentd as a DaemonSet to collect and forward logs from containers to Elasticsearch.

## 3. Kibana

### 3.1 `01_kibana-svc.yml`

Creates a service for Kibana, exposing it on port 5601.

### 3.2 `02_kibana-deployment.yml`

Deploys Kibana as a single replica Deployment, connecting it to the Elasticsearch backend.

## Demo Application

### `demo-app.yml`

Deploys a simple demo application as a Kubernetes Pod named `counter` using the BusyBox image. This pod continuously prints logs to test the EFK stack setup.

## Prerequisites

- A Kubernetes cluster up and running.
- `kubectl` configured to connect to the cluster.

## How to Deploy

**Apply Elasticsearch Configurations:**
   ```bash
   kubectl apply -f elasticsearch/
   kubectl apply -f fluentd/
   kubectl apply -f kibana/
   kubectl apply -f demo-app.yml
```

## Accessing Kibana Dashboard
Once deployed, you can access the Kibana dashboard at http://<your-cluster-ip>:5601.