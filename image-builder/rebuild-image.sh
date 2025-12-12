#!/bin/bash
BASE_IMAGE="$1"

DATE=$(date +%F-%H%M)
NEW_TAG="secure-$DATE"

echo "🔧 Rebuilding image: $BASE_IMAGE → $NEW_TAG"

cp Dockerfile.template Dockerfile

docker build -t $BASE_IMAGE:$NEW_TAG .

echo "📤 Pushing image to registry..."
docker push $BASE_IMAGE:$NEW_TAG

echo $BASE_IMAGE:$NEW_TAG > new-image.txt

echo "✔ Rebuild complete"

