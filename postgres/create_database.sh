# Load environment variables from .env file
set -o allexport
source .env
set +o allexport


az postgres flexible-server create \
    --resource-group $RESOURCE_GROUP \
    --name $SQL_SERVER_NAME \
    --location $LOCATION \
    --admin-user $SQL_SERVER_USER \
    --admin-password $SQL_SERVER_PASSWORD \
    --public all\
    --sku-name Standard_B1ms \
    --tier Burstable \
    --storage-size 32 \
    --version 13 \

# Create a new SQL database
az postgres flexible-server db create \
    --resource-group $RESOURCE_GROUP \
    --server $SQL_SERVER_NAME \
    --database-name $DATABASE 

# az postgres flexible-server show --name $SQL_SERVER_NAME --resource-group $RESOURCE_GROUP
