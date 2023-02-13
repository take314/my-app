#!/bin/bash

if [ $# -lt 1 ]; then
    echo "GitHub token required"
    exit
fi

if [ $# -lt 2 ]; then
    echo "AWS profile required"
    exit
fi

PROFILE_OPTION="${2}"

aws --profile "${PROFILE_OPTION}" cloudformation create-stack \
    --stack-name my-app-stack \
    --template-body file://pipeline_template.yml \
    --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM \
    --parameters ParameterKey=OAuthToken,ParameterValue="${1}"

