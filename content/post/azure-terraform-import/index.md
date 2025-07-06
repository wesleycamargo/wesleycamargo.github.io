---
title: How to Import an Existing Azure Resource into Your Terraform State with Azure Storage Backend
description: Have you ever for any reason didn't had your Azure resource under Terraform and want to starting managing it by the HashCorp Tool? In this step-by-step guide, we'll walk you through the process of importing an existing Azure resource into your Terraform state file, where your backend is configured to use an Azure Storage Account.
slug: azure-terraform-import
date: 2024-02-15T15:41:21.950Z
image: cover.jpg
categories:
    - Azure
    - Terraform
    - Infrastructure as Code
tags:
    - Azure
    - Terraform
    - IaC
    - HashiCorp
    - Cloud
    - DevOps
weight: 1
---

Have you ever for any reason didn't had your Azure resource under Terraform and want to starting managing it by the HashCorp Tool? In this step-by-step guide, we'll walk you through the process of importing an existing Azure resource into your Terraform state file, where your backend is configured to use an Azure Storage Account.

## Preparing the Backend: Creating the Storage Account for State Management

Before we start, we need to set up an Azure Storage Account, which will be the backend for your Terraform state files. This ensures that your state is kept in a secure, centralized location, making it easier to manage, especially when working within a team.

The Azure CLI script below will create a Resource Group and a Storage Account with the container, where the state files will be created later:

```bash
az group create -l uksouth -n rg-tfstate
az storage account create -n sttfstateimport -g rg-tfstate
az storage container create -n tfstate --account-name sttfstateimport
```

## Preparation of the Terraform File

Now that our Azure backend ready, lets configure the Terraform files to use it.

We will first add the `azurerm` backend, to do so, we will need to provide the the details from the storage account created previously, it will be required the storage account name, container name, the resource group, and the key of our workload. After that, we will create a simple resource group:

```hcl
provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    container_name       = "tfstate"
    key                  = "myworkload"
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstateimport"
  }
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "rg-myresourcegroup"
  location = "UKSouth"
}
```

Initialize the Terraform workspace and apply the changes:

```bash
terraform init; 
terraform apply;
```

### Terraform State file

After the creation of this resource, lets check the state file hosted on our storage account. Note that we only have the resource group being managed by Terraform.

```json
{
  "version": 4,
  "terraform_version": "1.6.5",
  "serial": 5,
  "lineage": "f5c71b49-ac3a-e0ec-2529-b017b3c3965f",
  "outputs": {},
  "resources": [
    {
      "mode": "managed",
      "type": "azurerm_resource_group",
      "name": "example",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "/subscriptions/337ba254-3aa0-4551-ba8e-89debefaa373/resourceGroups/rg-myresourcegroup",
            "location": "uksouth",
            "managed_by": "",
            "name": "rg-myresourcegroup",
            "tags": {},
            "timeouts": null
          },
          "sensitive_attributes": [],
          "private": "xxxx"
        }
      ]
    }
  ],
  "check_results": null
}
```

## Creation of Resource Outside Terraform Using Azure CLI

Sometimes, resources are created outside of Terraform, maybe manually or through scripts, or they might even be there before we start to adopt an Infra as Code strategy. In our case we will simulate it using Azure CLI. Create the Azure resource you want to manage with Terraform. For example, you can create a storage account, VM, or any other resource.

```bash
az storage account create -n sttoimport -g rg-myresourcegroup
```

After the resource creation, note the id of the resource. It will be needed later for the import process.

## The Import Process on Terraform

Now that we have our resource and the Terraform backend is ready, we can import the existing resource into the Terraform state

Write a Terraform resource block in your configuration file that corresponds to the resource you created. Make sure the name and type match the Azure resource.

```hcl
resource "azurerm_storage_account" "example" {
  name                     = "sttoimport"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
```

If you try to apply, an error message will appear, stating that the resource already existis and must be imported

The simplest way to achieve this is by adding the `import` block of code into your tf file. You will need to specify the id of the resource (that one we noted before) and `to` which resource it should be imported.

```hcl
import {
  to = azurerm_storage_account.example
  id = "/subscriptions/<subscription id>/resourceGroups/myResourceGroup/providers/Microsoft.Storage/storageAccounts/stportalcreated"
}

# # Create a storage account
resource "azurerm_storage_account" "example" {
  name                     = "sttoimport"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
```

After adding it, run `terraform apply` once again.

### Terraform State file

Now we can check once again our Terraform state file. We can note that it's much more extense, and has not only the resource group as in the first deployment, but the storage account as well.

```json
{
  "version": 4,
  "terraform_version": "1.6.5",
  "serial": 6,
  "lineage": "f5c71b49-ac3a-e0ec-2529-b017b3c3965f",
  "outputs": {},
  "resources": [
    {
      "mode": "managed",
      "type": "azurerm_resource_group",
      "name": "example",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "/subscriptions/337ba254-3aa0-4551-ba8e-89debefaa373/resourceGroups/rg-myresourcegroup",
            "location": "uksouth",
            "managed_by": "",
            "name": "rg-myresourcegroup",
            "tags": {},
            "timeouts": null
          },
          "sensitive_attributes": [],
          "private": "xxxx"
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_storage_account",
      "name": "example",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 4,
          "attributes": {
            "access_tier": "Hot",
            "account_kind": "StorageV2",
            "account_replication_type": "LRS",
            "account_tier": "Standard",
            "allow_nested_items_to_be_public": true,
            "allowed_copy_scope": "",
            "azure_files_authentication": [],
            "blob_properties": [
              {
                "change_feed_enabled": false,
                "change_feed_retention_in_days": 0,
                "container_delete_retention_policy": [],
                "cors_rule": [],
                "default_service_version": "",
                "delete_retention_policy": [],
                "last_access_time_enabled": false,
                "restore_policy": [],
                "versioning_enabled": false
              }
            ],
            "cross_tenant_replication_enabled": true,
            "custom_domain": [],
            "customer_managed_key": [],
            "default_to_oauth_authentication": false,
            "edge_zone": "",
            "enable_https_traffic_only": true,
            "id": "/subscriptions/337ba254-3aa0-4551-ba8e-89debefaa373/resourceGroups/rg-myresourcegroup/providers/Microsoft.Storage/storageAccounts/sttoimport",
            "identity": [],
            "immutability_policy": [],
            "infrastructure_encryption_enabled": false,
            "is_hns_enabled": false,
            "large_file_share_enabled": null,
            "local_user_enabled": true,
            "location": "uksouth",
            "min_tls_version": "TLS1_2",
            "name": "sttoimport",
            "network_rules": [
              {
                "bypass": [
                  "AzureServices"
                ],
                "default_action": "Allow",
                "ip_rules": [],
                "private_link_access": [],
                "virtual_network_subnet_ids": []
              }
            ],
            "nfsv3_enabled": false,
            // ... additional attributes truncated for brevity
            "tags": {},
            "timeouts": null
          },
          "sensitive_attributes": [],
          "private": "xxxx",
          "dependencies": [
            "azurerm_resource_group.example"
          ]
        }
      ]
    }
  ],
  "check_results": null
}
```

## Conclusion

Integrating existing Azure resources into Terraform doesn't have to be complex. By following the steps described in this guide, you can quickly and efficiently bring your Azure infrastructure under Terraform's infrastructure-as-code management. Happy coding!
