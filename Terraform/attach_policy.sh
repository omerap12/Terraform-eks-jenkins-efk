# Create policy
aws iam create-policy --policy-name attach-ebs --policy-document file://iam_policy.yml

# Get cluster role arm
role_name=$(kubectl -n kube-system describe configmap aws-auth | grep role |  sed 's/.*role\///')
echo $role_name

# Attach the policy
aws iam attach-role-policy --role-name $role_name --policy-arn  arn:aws:iam::760370564012:policy/attach-ebs
