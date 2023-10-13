#! /bin/bash
kubectl delete service/metrics-server -n  kube-system
kubectl delete deployment.apps/metrics-server  -n  kube-system
kubectl delete apiservices.apiregistration.k8s.io v1beta1.metrics.k8s.io
kubectl delete clusterroles.rbac.authorization.k8s.io system:aggregated-metrics-reader
kubectl delete clusterroles.rbac.authorization.k8s.io system:metrics-server 
kubectl delete clusterrolebinding metrics-server:system:auth-delegator
kubectl delete clusterrolebinding system:metrics-server          
kubectl delete rolebinding metrics-server-auth-reader -n kube-system 
kubectl delete serviceaccount metrics-server -n kube-system