# External DNS

External DNS is a pod running in your EKS cluster which watches over all your ingresses. \
When it detects an ingress with a host specified, it automatically picks up the hostname as well as the endpoint and creates a record for that resource in Route53.


> This Helm Chart deploys external dns on eks cluster with
> - ClusterRole
> - ClusterRoleBinding
> - Service Account

### Dependencies

- EKS cluster
- IAM Role attached with worker
- Hosted Zone in Route53


### Required Parameters:

| Parameter | Description | Default
| ------ | ------ | ------ |
| domain_name | Route53 domain that will be managed by external dns  | "" |
| hosted_zone_id | Route53 ZoneID for domain | "" |

### ** You must update chart version if you make any change in templates
