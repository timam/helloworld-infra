# Private ALB

This helm chart creates a Private Application Load Balancer.


### Dependencies

- ALB Ingress Controller
>  ### How can I add a new service to ALB?
> Add a new host section in Ingress.yaml

### Required Parameters:
| Parameter | Description | Default | Example |
  | ------ | ------ | ------ |------ |
  | public_subnet1   |   | "" | |
  | public_subnet1   |   | "" | |
  | public_subnet1   |   | "" | |
  | certificate_arn  |   | "" | |
  | healthcheck_path |   | "/actuator/health" | |
  | service1_name    |   | "" | |
  | service1_host    |   | "" | |
  | service1_port    |   | "" | |

### ** You must update chart version if you make any change in templates

>TODO: Add ALB with Security Group