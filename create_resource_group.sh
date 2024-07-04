# il faut d'avoir installé Azure CLI
# ensuite taper dans le temrinale: "chmod +x create_resource_group.sh"

# Load environment variables from .env file
set -o allexport
source .env
set +o allexport

# # # Login
# # az login

# # List all subscriptions
## az account list --output table

# Create a new resource group
az group create --name $RESOURCE_GROUP --location $LOCATION
