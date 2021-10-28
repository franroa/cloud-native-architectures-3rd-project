kill $(ps aux | grep 'kubectl' | awk '{print $2}')

kubectl port-forward -n monitoring service/prometheus-grafana --address 0.0.0.0 3000:80 -n monitoring &
kubectl port-forward -n monitoring service/prometheus-kube-prometheus-prometheus --address 0.0.0.0 9090:9090 -n monitoring &
kubectl port-forward -n confluent service/jaeger-query --address 0.0.0.0 16686:16686 &
kubectl port-forward -n confluent controlcenter-0 9021:9021 &