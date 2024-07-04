# Load environment variables from .env file
set -o allexport
source .env
set +o allexport

# Créer un groupe de ressources (si ce n'est pas déjà fait)
az group create --name $RESOURCE_GROUP --location $LOCATION

# Créer le service Data Factory
az datafactory create --resource-group $RESOURCE_GROUP --factory-name $DATAFACTORYNAME --location $LOCATION
