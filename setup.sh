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

#nginx
eval $(minikube docker-env)
docker build -t nginx-svc srcs/nginx/


chmod +x srcs/*/*.sh

#eval $(minikube docker-env)

envsubst '$IP_EXT' < srcs/nginx/nginx.yaml > srcs/yamlfiles/nginx.yaml
kubectl apply -f srcs/yamlfiles/nginx.yaml
