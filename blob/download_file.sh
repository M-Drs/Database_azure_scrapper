# Load environment variables from .env file
set -o allexport
source .env
set +o allexport

# Variables
BLOB_NAME="script.py"

# Télécharger le fichier
az storage blob download \
    --account-name $STORAGE_ACCOUNT \
    --account-key $STORAGE_KEY \
    --container-name $CONTAINER_NAME \
    --name $BLOB_NAME \
    --file "blob/downloaded_script.py"