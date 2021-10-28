#Install elasticsearch
kubectl create namespace elastic-system
helm upgrade --install elastic-operator -n observability elastic/eck-operator -n elastic-system


##Install Jaeger
kubectl create namespace observability
helm upgrade --install  jaeger jaegertracing/jaeger-operator -n observability --set  rbac.clusterRole=true


#Install Loki
kubectl create namespace loki
helm upgrade --install loki loki/loki-stack -n loki
#helm upgrade --install loki loki/loki-stack --set grafana.enabled=true


#Install Grafana and Prometheus
kubectl create namespace monitoring
helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring


kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
