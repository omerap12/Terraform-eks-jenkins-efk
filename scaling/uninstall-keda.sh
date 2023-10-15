kubectl delete $(kubectl get scaledobjects.keda.sh,scaledjobs.keda.sh -A \
  -o jsonpath='{"-n "}{.items[*].metadata.namespace}{" "}{.items[*].kind}{"/"}{.items[*].metadata.name}{"\n"}')
kubectl delete -f https://github.com/kedacore/keda/releases/download/v2.12.0/keda-2.12.0-core.yaml