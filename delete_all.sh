#!/bin/bash

# Lister tous les groupes de ressources dans l'abonnement
resource_groups=$(az group list --query "[].name" -o tsv)

# Parcourir chaque groupe de ressources et le supprimer
for rg in $resource_groups
do
  echo "Suppression du groupe de ressources: $rg"
  az group delete --name $rg --yes --no-wait
done