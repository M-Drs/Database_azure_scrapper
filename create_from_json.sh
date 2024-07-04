# Load environment variables from .env file
set -o allexport
source .env
set +o allexport
TEMPLATE_FILE="python_pipeline/json/ARMTemplateForFactory.json"
PARAMETER_FILE="python_pipeline/json/ARMTemplateParametersForFactory.json"

az deployment group create \
  --resource-group $RESOURCE_GROUP \
  --template-file $TEMPLATE_FILE \
  --parameters @$PARAMETER_FILE