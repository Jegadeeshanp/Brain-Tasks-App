#!/bin/bash
set -e

# Environment variables:
# AWS_ACCOUNT_ID, AWS_REGION, ECR_REPO, IMAGE_TAG

echo "Creating ECR repository (if not exists)..."
aws ecr create-repository --repository-name $ECR_REPO --region $AWS_REGION || true

echo "Authenticating Docker to ECR..."
aws ecr get-login-password --region $AWS_REGION | \
  docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

echo "Building Docker image..."
docker build -t ${ECR_REPO}:${IMAGE_TAG} .

echo "Tagging image for ECR..."
docker tag ${ECR_REPO}:${IMAGE_TAG} ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:${IMAGE_TAG}

echo "Pushing image to ECR..."
docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:${IMAGE_TAG}

echo "Docker image pushed to ECR successfully."

