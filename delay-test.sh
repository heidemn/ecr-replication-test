#!/bin/bash
set -eux

ACCOUNT_ID="$(aws sts get-caller-identity --query "Account" --output text)"

for version in 16.04 18.04 20.04; do
    docker pull ubuntu:$version
    docker tag ubuntu:$version $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/ubuntu:$version
    docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/ubuntu:$version

    while ! docker pull $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/ubuntu:$version; do
        sleep 1
    done
done
