#!/bin/bash
#
SERVICE="app"
APP_NAME="weblate"
ENVIRONMENT="prod"

# Get Infrastructure deployment number
GET_NUMBER=$(ls terraform-states/ |grep -Eo '[0-9]'+ |sort -n |tail -1)
if [[ $GET_NUMBER == "" ]]; then
    GET_NUMBER=0
fi

COUNTER=$(($GET_NUMBER + 1))

# Announcement
printf "\n\n*************************************\n"
echo "DEPLOYMENT INFO"
printf "*************************************\n"
echo "Application       | $APP_NAME"
echo "Service           | $SERVICE"
echo "Environment       | $ENVIRONMENT"
echo "Infra version     | $COUNTER"
printf "***************************************\n\n"

sed -i "s/DEPLOYMENT_NUMBER/$COUNTER/g" variables.tf
sed -i "s/DEPLOYMENT_NUMBER/$COUNTER/g" bootstrap.sh

terraform init

# Execute deployment
if [[ $Environment == "prod" ]]; then
    terraform apply --auto-approve
else
    terraform apply -lock=false --auto-approve
fi

# Keeping terraform state
mkdir terraform-states/v$COUNTER
mv terraform.tfstate terraform-states/v$COUNTER/
