# Load environment variables from .env file
set -o allexport
source .env
set +o allexport

# # # Login
# # az login

az group delete \
--name $RESOURCE_GROUP