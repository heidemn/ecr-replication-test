#!/bin/bash
set -eux

ACCOUNT_ID="$(aws sts get-caller-identity --query "Account" --output text)"

for version in 15.10; do
    docker pull ubuntu:$version
    docker tag ubuntu:$version $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/ubuntu:$version
    docker tag ubuntu:$version $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/ubuntu:$version

    docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/ubuntu:$version
    sleep 4
    docker push $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/ubuntu:$version
done
