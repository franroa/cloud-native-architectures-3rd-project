/usr/local/bin/k3s-uninstall.sh
./k3s.sh

cp /etc/rancher/k3s/k3s.yaml ~/.kube/config

./manifests/install.sh
./manifests/app/install.sh
./manifests/fran/install.sh