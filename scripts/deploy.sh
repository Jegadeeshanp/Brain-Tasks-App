#!/bin/bash
set -euo pipefail

# Expected env vars:
# AWS_REGION - ap-south-1
# EKS_CLUSTER - guviproject-eks-cluster
# AWS_ACCOUNT_ID - your account id
# ECR_REPO - brain-tasks-app
# IMAGE_TAG - tag to deploy 

: "${AWS_REGION:?Please set AWS_REGION}"
: "${EKS_CLUSTER:?Please set EKS_CLUSTER}"
: "${AWS_ACCOUNT_ID:?Please set AWS_ACCOUNT_ID}"
: "${ECR_REPO:?Please set ECR_REPO}"

if [ -z "${IMAGE_TAG:-}" ]; then
  IMAGE_TAG="${CODEBUILD_RESOLVED_SOURCE_VERSION:-latest}"
  IMAGE_TAG=$(echo "$IMAGE_TAG" | cut -c1-7)
fi

IMAGE_URI="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:${IMAGE_TAG}"

echo "Updating kubeconfig for cluster ${EKS_CLUSTER} in ${AWS_REGION}..."
aws eks update-kubeconfig --region "${AWS_REGION}" --name "${EKS_CLUSTER}"

echo "Setting image for deployment/brain-tasks-app to ${IMAGE_URI}..."
kubectl set image deployment/brain-tasks-app brain-tasks-container="${IMAGE_URI}" --record

echo "Waiting for rollout to complete..."
kubectl rollout status deployment/brain-tasks-app --timeout=120s

echo "Deployment updated to ${IMAGE_URI} successfully."

