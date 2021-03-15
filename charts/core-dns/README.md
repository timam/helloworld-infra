# Core DNS 

EKS comes with Core DNS support. However, to resolve private domains form containers we need to modify corefile of coredns. 
This chart simply helps us to deploy changes in corefile. 

> This helm chart updates core DNS ConfigMap


### Required Parameters:

| Parameter | Description | Default | Example |
| ------ | ------ | ------ | ------ | 
| dns_resolver | DNS Resolver IP | "" | 10.10.10.10 |
| cps_domain | Route53 private domain  | "" | gw.bkash.com |
| release_name|||
| release_namespace|||

>TODO: Check if helm is adding following annotation or not
> ```
>  annotations:
>   meta.helm.sh/release_name: {{ .Values.release_name }}
>   meta.helm.sh/release-namespace: {{ .Values.release_namespace }
> ```


### Add a new Domain

To add a new domain, please modify corefile with your new domain. 
```
---
    {{ .Values.new_domain }}:53 {
        errors
        cache 10
        forward . {{ .Values.dns_resolver }}
    }
---
```

### ** You must update chart version if you make any change in templates
