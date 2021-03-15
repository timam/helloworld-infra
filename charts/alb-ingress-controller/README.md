# ALB Ingress Controller

ALB Controller manages AWS Application Load Balancers for a Kubernetes cluster

> This helm chart deploys alb ingress controller with
> - ServiceAccount
> - ClusterRole
> - ClusterRoleBinding

### Required Parameters:

| Parameter | Description | Default | Example |
| ------ | ------ | ------ | ------ | 
| region | AWS region for EKS Cluster and ALB | "" | ap-southeast-1 |
| cluster_name | Name of your EKS Cluster  | "" | sit-project-eks-cluster |


### ** You must update chart version if you make any change in templates
