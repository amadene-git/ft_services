#!/bin/bash


#start minikube

minikube stop
minikube delete
minikube start --vm-driver=docker

export IP_EXT=$(minikube ip)

#MetalLB

kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

cat <<EOF | kubectl create -f -
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - ${IP_EXT}/32
EOF

chmod +x srcs/*/*.sh

#build
eval $(minikube docker-env)
docker build -t nginx-img 		srcs/nginx/ --network=host
docker build -t mysql-img 		srcs/mysql/ --network=host
docker build -t phpmyadmin-img 	srcs/phpmyadmin/ --network=host
docker build -t wordpress-img	srcs/wordpress/ --network=host
docker build -t influxdb-img	srcs/influxdb/ --network=host
#docker build -t grafana-img		srcs/grafana/ --network=host

#apply
envsubst '$IP_EXT' < srcs/nginx/nginx.yaml 				> srcs/yamlfiles/nginx.yaml
envsubst '$IP_EXT' < srcs/mysql/mysql.yaml 				> srcs/yamlfiles/mysql.yaml
envsubst '$IP_EXT' < srcs/phpmyadmin/phpmyadmin.yaml 	> srcs/yamlfiles/phpmyadmin.yaml
envsubst '$IP_EXT' < srcs/wordpress/wordpress.yaml 		> srcs/yamlfiles/wordpress.yaml
envsubst '$IP_EXT' < srcs/influxdb/influxdb.yaml 		> srcs/yamlfiles/influxdb.yaml
#envsubst '$IP_EXT' < srcs/grafana/grafana.yaml			> srcs/yamlfiles/grafana.yaml

kubectl apply -f srcs/yamlfiles/nginx.yaml
kubectl apply -f srcs/yamlfiles/mysql.yaml
kubectl apply -f srcs/yamlfiles/phpmyadmin.yaml
kubectl apply -f srcs/yamlfiles/wordpress.yaml
kubectl apply -f srcs/yamlfiles/influxdb.yaml
#kubectl apply -f srcs/yamlfiles/grafana.yaml





