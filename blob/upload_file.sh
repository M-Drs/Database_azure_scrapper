# Load environment variables from .env file
set -o allexport
source .env
set +o allexport

# Variables
FILE_PATH="/Users/charles/Documents/pythonProject/azure_introduction/blob/script_hello.py"
BLOB_NAME="script_hello.py"

# Charger le fichier
az storage blob upload \
    --account-name $STORAGE_ACCOUNT \
    --account-key $STORAGE_KEY \
    --container-name $CONTAINER_NAME \
    --name $BLOB_NAME \
    --file $FILE_PATH