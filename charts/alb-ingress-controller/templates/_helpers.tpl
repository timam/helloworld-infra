{{- define "aws-load-balancer-controller.gen-certs" -}}
{{- $namePrefix := "aws-load-balancer" -}}
{{- $altNames := list ( printf "%s-%s.%s" $namePrefix "webhook-service" "kube-system" ) ( printf "%s-%s.%s.svc" $namePrefix "webhook-service" "kube-system" ) -}}
{{- $ca := genCA "aws-load-balancer-controller-ca" 3650 -}}
{{- $cert := genSignedCert "aws-load-balancer-controller"  nil $altNames 3650 $ca -}}
caCert: {{ $ca.Cert | b64enc }}
clientCert: {{ $cert.Cert | b64enc }}
clientKey: {{ $cert.Key | b64enc }}
{{- end -}}