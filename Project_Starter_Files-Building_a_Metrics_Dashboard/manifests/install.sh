kubectl create namespace elastic-system
helm upgrade --install elastic-operator -n observability elastic/eck-operator -n elastic-system

#Copy k3s config
#/etc/rancher/k3s/k3s.yaml

#Install Loki
kubectl create namespace loki
helm upgrade --install loki loki/loki-stack -n loki
#helm upgrade --install loki loki/loki-stack --set grafana.enabled=true


##Install Jaeger
kubectl create namespace observability
helm upgrade --install  jaeger jaegertracing/jaeger-operator -n observability --set  rbac.clusterRole=true
#kubectl create -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/crds/jaegertracing.io_jaegers_crd.yaml # <2>
#kubectl create -n observability -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/service_account.yaml
#kubectl create -n observability -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/role.yaml
#kubectl create -n observability -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/role_binding.yaml
#kubectl create -n observability -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/operator.yaml
##Make Jaeger cluster wide
#kubectl create -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/cluster_role.yaml
#kubectl create -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/cluster_role_binding.yaml


#Install Grafana and Prometheus
kubectl create namespace monitoring
helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring


#kubectl apply -f ./app
#kubectl apply -f ./other

kubectl create secret generic jaeger-secret --from-literal=ES_PASSWORD=$(kubectl get secret quickstart-es-elastic-user -o go-template='{{.data.elastic | base64decode}}') --from-literal=ES_USERNAME=elastic