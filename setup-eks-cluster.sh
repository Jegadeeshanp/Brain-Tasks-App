#!/bin/bash
set -e

# Configurable variables
CLUSTER_NAME="guviproject-eks-cluster"
REGION="ap-south-1"
NODEGROUP_NAME="standard-workers"
NODE_TYPE="t3.small"
NODES=2
NODES_MIN=1
NODES_MAX=3

echo "Creating EKS cluster: $CLUSTER_NAME in region: $REGION ..."

# Create EKS cluster
eksctl create cluster \
  --name "$CLUSTER_NAME" \
  --region "$REGION" \
  --with-oidc \
  --managed \
  --nodegroup-name "$NODEGROUP_NAME" \
  --node-type "$NODE_TYPE" \
  --nodes "$NODES" \
  --nodes-min "$NODES_MIN" \
  --nodes-max "$NODES_MAX"

echo "EKS cluster '$CLUSTER_NAME' created successfully!"

# Verify cluster
echo "Verifying cluster status..."
kubectl get nodes

echo "Setup complete!"

