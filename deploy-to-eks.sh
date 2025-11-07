#!/bin/bash
set -e

# Variables - update if needed
EKS_CLUSTER="guviproject-eks-cluster"
AWS_REGION="ap-south-1"

echo "Updating kubeconfig for EKS cluster $EKS_CLUSTER in region $AWS_REGION..."
aws eks update-kubeconfig --region "$AWS_REGION" --name "$EKS_CLUSTER"

echo "Deploying application to EKS..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Checking pod status..."
kubectl get pods

echo "Checking service status..."
kubectl get svc

