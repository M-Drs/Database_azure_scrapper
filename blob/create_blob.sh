# execute: bash create_blob.sh

# Load environment variables from .env file
set -o allexport
source .env
set +o allexport

# echo $RESOURCE_GROUP

# Create a new resource group
az group create --name $RESOURCE_GROUP --location $LOCATION

# Créer un Storage Account
az storage account create \
    --name $STORAGE_ACCOUNT \
    --resource-group $RESOURCE_GROUP \
    --location $LOCATION \
    --access-tier Cool \
    --sku Standard_LRS

# Récupérer la clé de stockage
STORAGE_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP \
                --account-name $STORAGE_ACCOUNT \
                --query '[0].value' \
                --output tsv \
                )

# Créer un conteneur
az storage container create \
    --name $CONTAINER_NAME \
    --account-name $STORAGE_ACCOUNT \
    --account-key $STORAGE_KEY

# # Ecrire la clé de stockage dans le fichier .env
echo "\nSTORAGE_KEY='$STORAGE_KEY'" >> .env

echo "Storage key: $STORAGE_KEY"