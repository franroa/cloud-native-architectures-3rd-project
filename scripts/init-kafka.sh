helm upgrade --install -n confluent confluent-operator confluentinc/confluent-for-kubernetes

echo "Install all Confluent Platform components."
kubectl apply -n confluent -f https://raw.githubusercontent.com/confluentinc/confluent-kubernetes-examples/master/quickstart-deploy/confluent-platform.yaml

#echo "Install a sample producer app and topic."
#kubectl apply -n confluent -f https://raw.githubusercontent.com/confluentinc/confluent-kubernetes-examples/master/quickstart-deploy/producer-app-data.yaml
#
