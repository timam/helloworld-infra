# EKS Dashboard


Resources : 
  - https://docs.aws.amazon.com/eks/latest/userguide/dashboard-tutorial.html


Get Token : ```kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')```
