# Hello World infrastructure 

This repo contains IaaC and Deployment files for helloworld microservices


How to build middleware artifcats?

```$  ansible-playbook ansible/artifacts_build.yaml  -e workspace=/home/alamin/helloworld-infra -e helloworldMW=helloworld-spring -e module=backend -e env=sit ```


How to build Docker Images?

```$  ansible-playbook ansible/image_build.yaml -e workspace=/home/alamin/helloworld-infra -e helloworldMW=helloworld-spring -e module=backend -e env=sit```

How to copy artifacts?

```$ ansible-playbook ansible/copy_artifacts.yaml -e workspace=/home/alamin/helloworld-infra -e helloworldMW=helloworld-spring -e module=frontend -e env=sit```