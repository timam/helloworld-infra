# Deployment

This helm chart creates a deployment with service

### Required Parameters:
| Parameter               | Description                                        | Default | Example |
| ------                  | ------                                             | ------  |------ |
| namespace               | Where pods will live                               | "" | bkash |
| microservice_name       | Name of th microservice, will be used in metadata  | "" | sit-bkash-admin|
| health_check_path       | Healthcheck path                                   | "" | admin |  |
| docker_image            | URL of docker image                                | "" | xxxxxxxxxx.dkr.ecr.ap-southeast-1.amazonaws.com/avengers|
| docker_image_tag        | Tag of docker image                                | "" | v1.1.0 |
| container_port          | Port that is being exposed from container          | "" | 80 |
| service_port            | Port that will be exposed for service              | "" | 8001|
| service_type            | Type of the service                                | "" | NodePort |
| replicas                | Number of replicas                                 | "" | 10 |
| memory_request          | Requested memory size                              | "" | 512Mi |
| cpu_request             | Requested CPU size                                 | "" | 250m |
| memory_limit            | Maximum memory limit                               | "" | 4096Mi |
| cpu_limit               | Maximum CPU limit                                  | "" | 500m |
| liveness_prob_delay     |   | "" | 60 (Seconds)|
| liveness_prob_period    |   | "" | 25 (Seconds)|
| readiness_prob_delay    |   | "" | 60 (Seconds)|
| readiness_prob_period   |   | "" | 25 (Seconds)|
| terminate_grace_period  |   | "" | 60 (Seconds)|

### ** You must update chart version if you make any change in templates

>TODO: Add Fluentbit and Pod Priority

