#!/bin/bash
set -e -o pipefail

echo "Fetching IAM github-action-user ARN"
userarn="arn:aws:iam::259934284951:user/github-action-user"

# Download tool for manipulating aws-auth
echo "Downloading tool..."
curl -L -o aws-iam-authenticator.exe https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.6.2/aws-iam-authenticator_0.6.2_windows_amd64.exe
chmod +x aws-iam-authenticator.exe

echo "Updating permissions"
./aws-iam-authenticator.exe add user --userarn="${userarn}" --username=github-action-role --groups=system:masters --kubeconfig="$HOME"/.kube/config --prompt=false

echo "Cleaning up"
rm aws-iam-authenticator.exe
echo "Done!"