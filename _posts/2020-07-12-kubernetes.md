---
layout: post
title: Kubernetes
subtitle: FILL THIS UP
category: [drafts] 
bigimg: 
- "/img/*.jpg" : "draft image"
tags: [drafts]
secret: false
---

DRAFT  

## Table Of Contents
{:.no_toc}
---
- TOC
{:toc}


## K8s

helm list --all -n my-namespace
helm repo list

kubectl get deployments 
kubectl -n monitoring  scale deployment prometheus-operator-grafana --replicas=0
kubectl get all -n my-namespace -o wide
kubectl exec --stdin --tty my-pod -- /bin/sh
kubectl logs --selector app=uat-ms-catalog --container uat-ms-catalog-nginx
kubectl logs --previous YOUR-POD_NAME
kubectl logs -f -l app=uat-ms-catalog --container uat-ms-catalog-nginx --max-log-requests 11 | grep 'HTTP/1.1" 5'
kubectl get pods --selector=app=uat-ms-catalog
kubectl get pods -l app=uat-ms-catalog
kubectl describe pods uat-ms-catalog
kubectl get svc ms-accounts-service
            kubectl get svc --field-selector metadata.name=ms-accounts-service
kubectl logs uat-ms-catalog-xxxxxxxxxxxxxxxx --container uat-ms-catalog

kubectl port-forward service/prometheus-operator-prometheus --namespace monitoring 9090

kubectl describe svc/prometheus-operator-prometheus -n monitoring

kubectl get svc -n monitoring -w -o wide
kubectl edit svc/prometheus-operator-prometheus -n monitoring
kubectl get prometheus -n monitoring

Terminologies

- control plane
- Sidecar container to augment the original container (logs, metrics, etc)


monitoring
- push v pull

How Prometheus Monitoring works | Prometheus Architecture explained
https://www.youtube.com/watch?v=h4Sl21AKiDg


kube-state-metrics


https://medium.com/swlh/kubernetes-services-simply-visually-explained-2d84e58d70e5
