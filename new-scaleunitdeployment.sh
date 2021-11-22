templateFile="../linked/sof-exchangerate.json"
devParameterFile="../linked/sof-exchangerate-dit-parameters.json"
resource_group="sof-case-we-dit"
resource_group_location="westeurope"

echo "Creating resource group $resource_group"
az group create \
  --name $resource_group \
  --location $resource_group_location

echo "Resource group created."

echo "Starting deployment..."
az deployment group create \
  --name "templates_deployment_test" \
  --resource-group $resource_group \
  --template-file $templateFile \
  --parameters $devParameterFile

  echo "Deployment finished!"