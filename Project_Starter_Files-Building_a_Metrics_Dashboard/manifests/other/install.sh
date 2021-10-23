kubectl apply -f .
kubectl create secret generic jaeger-secret --from-literal=ES_PASSWORD=$(kubectl get secret quickstart-es-elastic-user -o go-template='{{.data.elastic | base64decode}}') --from-literal=ES_USERNAME=elastic
