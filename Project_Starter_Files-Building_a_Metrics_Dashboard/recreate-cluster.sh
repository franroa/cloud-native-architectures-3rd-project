/usr/local/bin/k3s-uninstall.sh
./k3s.sh

cp /etc/rancher/k3s/k3s.yaml ~/.kube/config

./manifests/install.sh
./manifests/app/install.sh
./manifests/fran/install.sh



#kill $(ps aux | grep 'kubectl' | awk '{print $2}')
#
#kubectl port-forward service/prometheus-grafana --address 0.0.0.0 3000:80 -n monitoring &
#kubectl port-forward service/prometheus-kube-prometheus-prometheus --address 0.0.0.0 9090:9090 -n monitoring &
#kubectl port-forward service/simplest-query --address 0.0.0.0 16686:16686 &
#kubectl port-forward service/frontend-service --address 0.0.0.0 8082:8082 &
#kubectl port-forward service/trial-service --address 0.0.0.0 8083:8083 &
#kubectl port-forward service/backend-service --address 0.0.0.0 8081:8081 &