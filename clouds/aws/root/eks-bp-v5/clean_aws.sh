#!/bin/sh
aws_profile=smartek
#Delete load balancer
LB=`aws elb describe-load-balancers --profile=$aws_profile | jq -r .LoadBalancerDescriptions[].LoadBalancerName`
echo $LB
aws elb delete-load-balancer --load-balancer-name=$LB  --profile=$aws_profile
#delete eks cluster
CLUSTER=`aws eks list-clusters --profile=$aws_profile | jq -r .clusters[]`
aws eks delete-cluster --name=$CLUSTER  --profile=$aws_profile
aws iam delete-role --role-name=managed-node-role --profile=$aws_profile
#delete roles and policies
ARNS=`aws iam list-policies --profile $aws_profile | jq -r '.Policies[] | select(.PolicyName | contains("cloudbees")) | .Arn'`
ROLES=`aws iam list-roles --profile $aws_profile | jq -r '.Roles[] | select(.RoleName | contains("cloudbees")) | .RoleName'`
echo $ROLES
echo $ARNS
for role in $ROLES
do
APS=`aws iam list-attached-role-policies --role-name=$role --profile $aws_profile | jq -r '.AttachedPolicies[].PolicyArn'`
for AP in $APS
do
aws iam detach-role-policy --policy-arn=$AP --role-name=$role --profile $aws_profile
done
done
for arn in $ARNS; do aws iam delete-policy --policy-arn=$arn --profile $aws_profile; done
for role in $ROLES; do echo $role; aws iam delete-role --role-name=$role --profile $aws_profile; done


#delete certificate
CERTS=`aws acm list-certificates --profile smartek | jq -r '.CertificateSummaryList[] | select(.DomainName | contains("cbsmartek.net")) | .CertificateArn'`
for cert in $CERTS; do aws acm delete-certificate --certificate-arn=$cert --profile $aws_profile; done
#remove acm file
rm -Rf /home/houssem/Documents/Cloudbees/Training/terraform-lib/clouds/aws/root/eks-bp-v5/kubeconfig-cloudbeespocsmartek-eks.yaml

#delete s3 backup
#delete profile