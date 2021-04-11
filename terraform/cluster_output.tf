locals {
  config_map_aws_auth = <<CONFIGMAPAWSAUTH
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: ${module.eks-worker-role.role-arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
CONFIGMAPAWSAUTH

  kubeconfig = <<KUBECONFIG
apiVersion: v1
clusters:
- cluster:
    server: ${module.eks-cluster.eks_endpoint}
    certificate-authority-data: ${module.eks-cluster.certificate_authority.0.data}
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: aws
  name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - "${module.eks-cluster.cluster_name}"
KUBECONFIG

}

resource "null_resource" "kubeconfig" {
  provisioner "local-exec" {
    command = <<BASH

FILE=$HOME/.kube/config
if test -f "$FILE"; then
    echo "kubeconfig is ok"
else
    mkdir $HOME/.kube/
    echo "${local.kubeconfig}" > $HOME/.kube/config
fi

BASH
  }
}


resource "null_resource" "config-map-auth" {
  provisioner "local-exec" {
    command = <<BASH
echo "${local.config_map_aws_auth}" > config-map-auth
kubectl apply -f config-map-auth
BASH
  }
}