#!/bin/bash

NEW_IMAGE=$(cat ../image-builder/new-image.txt)

echo "🚀 Deploying secured image: $NEW_IMAGE"

sed -i "s|IMAGE_PLACEHOLDER|$NEW_IMAGE|g" k8s/deployment.yaml

kubectl apply -f k8s/deployment.yaml
kubectl rollout restart deployment/myapp

echo "✔ Deployment done"

