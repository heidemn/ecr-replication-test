#!/bin/bash
set -ux

ACCOUNT_ID="$(aws sts get-caller-identity --query "Account" --output text)"

docker pull busybox:1-glibc
docker pull busybox:1

docker tag busybox:1-glibc $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-src:1st
docker tag busybox:1       $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-src:2nd

docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-src:1st
docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-src:2nd


docker tag busybox:1-glibc $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-src:latest
docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-src:latest
sleep 5
docker tag busybox:1       $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-src:latest
docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-src:latest

# RESULT: as expected:
# eu-west-1 (immutable): latest = 1st
# us-east-1 (immutable): latest = 1st

exit 0




docker pull busybox:1-glibc
docker pull busybox:1

docker tag busybox:1-glibc $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-both:1st
docker tag busybox:1       $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-both:2nd

docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-both:1st
docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-both:2nd


docker tag busybox:1-glibc $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-both:latest
docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-both:latest
sleep 5
docker tag busybox:1       $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-both:latest
docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-both:latest

# RESULT: as expected:
# eu-west-1 (immutable): latest = 1st
# us-east-1 (immutable): latest = 1st

exit 0




docker pull busybox:1-glibc
docker pull busybox:1

docker tag busybox:1-glibc $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-dest:1st
docker tag busybox:1       $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-dest:2nd

docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-dest:1st
docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-dest:2nd


docker tag busybox:1-glibc $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-dest:latest
docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-dest:latest
sleep 5
docker tag busybox:1       $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-dest:latest
docker push $ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/busybox-imm-dest:latest

# RESULT: as expected:
# eu-west-1 (mutable):   latest = 2nd
# us-east-1 (immutable): latest = 1st
