## the steps to follow for creation of service account to the pod to get access to the external services

1. make sure oidc provider exist

eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster expense \
    --approve


# ----------

create policy manually by going to the aws account and create policy to get the read access for secret manager

# ----------

 we need to map sa with IAM policy  ( if your wants to connect to the internal resources, then role, rolebinding should be added to the  service account, but for external resource access we should add IAM policy to the service account )

eksctl create iamserviceaccount \
--cluster=expense \
--namespace=expense \
--name=expense-mysql-secret \
--attach-policy-arn=arn:aws:iam::445567090602:policy/eks-secretmanager \
--override-existing-serviceaccounts \
--region us-east-1 \
--approve

this command will create IAM role with policy ExpenseMySQLSecretRead and integrate with EKS SA

then run below command then you will get service account details:
kubectl get sa <sa-name> -n expense -o yaml

