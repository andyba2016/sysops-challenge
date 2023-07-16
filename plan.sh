#!/bin/bash

environments=("production" "stage" "dev")

# Prompt user to select an environment
PS3="Select an environment: "
select environment in "${environments[@]}"
do
  if [[ " ${environments[@]} " =~ " ${environment} " ]]; then
    break
  else
    echo "Invalid selection. Please try again."
  fi
done

cd eks &&
echo "Planning workspace ${environment}..." &&
terraform init &&
terraform workspace select -or-create ${environment} && 
terraform plan -var-file=environments/${environment}/main.tfvars &&
cd .. &&
