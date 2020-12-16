#!/bin/bash
#
COUNTER="1"
SERVICE="app"
APP_NAME="weblate"
ENVIRONMENT="prod"

# Change directory
cp terraform-states/v$COUNTER/* .

# Announce attribute & values
printf "\n\n*************************************\n"
echo "DESTROYER INFO"
printf "*************************************\n"
echo "Application       | $APP_NAME"
echo "Service           | $SERVICE"
echo "Environment       | $ENVIRONMENT"
echo "Infra version     | $COUNTER"
printf "***************************************\n\n"

# Initialize terraform provider
terraform init

# Destroy project
if [[ $Environment == "prod" ]]; then
    terraform destroy --auto-approve
else
    terraform destroy -lock=false --auto-approve
fi

rm -rf terraform.tfstate*

