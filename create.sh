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
echo "Creating workspace for ${environment}..." &&
terraform init &&
terraform workspace select -or-create ${environment} && 
terraform apply -var-file=environments/${environment}/main.tfvars -auto-approve &&
cd .. &&

cd argocd &&
echo "Installing argocd workspace for ${environment}..." &&
terraform init &&
terraform workspace select -or-create ${environment} && 
terraform apply -var-file=environments/${environment}/main.tfvars -auto-approve &&
cd .. &&

cd applications &&
echo "Creating workspace for ${environment}..." &&
terraform init &&
terraform workspace select -or-create ${environment} && 
terraform apply -var-file=environments/${environment}/main.tfvars -auto-approve &&
cd ..
