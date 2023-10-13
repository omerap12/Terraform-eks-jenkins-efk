
#!/bin/bash

# Install keda helm charts
helm repo add kedacore https://kedacore.github.io/charts
helm repo update
helm install keda kedacore/keda --namespace default

# deploy keda
kubectl apply -f keda-deployment.yml