+++
title = "Creating Azure Databricks with Bicep and Azure DevOps YAML Pipelines"
date = 2021-08-20T19:45:12+02:00
draft = false
categories = ["Technology", "Development", "Azure", "DevOps"]
tags = ["blog", "medium-import", "azure", "devops"]
image = "/img/creating-azure-databricks-with-bicep-and-azure-devops-yaml-pipelines/1_q45YY42etgKPognuoFZJmA.jpeg"
+++

### Creating Azure Databricks with Bicep and Azure DevOps YAML Pipelines

#### Continuing the DataOps Automation series, in this post I will demonstrate how to create your Databricks workspace using Infrastructure as Code with Bicep and Azure DevOps YAML Pipelines to deploy it in Azure. Let’s check it out!

![Image](/img/creating-azure-databricks-with-bicep-and-azure-devops-yaml-pipelines/1_q45YY42etgKPognuoFZJmA.jpeg)
Photo by [Benjamin Jopen](https://unsplash.com/@benjopen?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/brick-construction?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

In the previous articles, you can check how to[ create an Azure Data Factory with git integration using Bicep](https://towardsdatascience.com/dataops-automation-creating-azure-data-factory-with-git-integration-using-bicep-376fd3b5bc81) and also the [easiest way to create a CI/CD pipeline for Azure Data Factory](https://towardsdatascience.com/azure-data-factory-ci-cd-made-simple-building-and-deploying-your-arm-templates-with-azure-devops-30c30595afa5)

At the end of the post, you can check a complete YAML pipeline read to be used!

### What is a Bicep template?

If you are not familiar with Bicep, this is a DSL for the ARM Templates, that has a cleaner syntax, better support to modules, and other great features. It also has a nice [Visual Studio Code extension ](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/quickstart-create-bicep-use-visual-studio-code?tabs=CLI&WT.mc_id=devops-34401-jagord)that helps a lot in building templates from scratch.

![Image](/img/creating-azure-databricks-with-bicep-and-azure-devops-yaml-pipelines/0_FsceF8fsND7cZ2BM.png)
Nice extension for Visual Studio Code! — Image from [Microsoft Docs](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/install#development-environment)

When you run a deployment using a bicep template, it transpile the file and generates a native ARM Template, similar to what happens between Typescript and Javascript.

If you want to learn more about it, check the official documentation [here](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview).

### Creating the Infrastructure as Code for Azure Databricks

#### Creating a Resource Group with Azure CLI

To deploy our Databricks workspace we need to have a Resource Group created in your Azure Subscription. The easiest way to do that is through Azure CLI. To do that you need to log in with the command `az login` and then run the following command:

az group create -name RG-Databricks -location northeuropeReplace the parameters name and location for those that best suit your needs.

#### Creating Bicep templates for Azure Databricks

The Bicep template for Azure Databricks it’s quite simple and has 4 main sections:

**Parameters:**

- Workspace Name: If you do not provide a value, it uses a `uniqueString` function, which ensures that it will always be the same, as this is based on the resource group id.
- Location: By default, this is using the resource group location
- SKU: The default value is trial, so be sure to replace it in your real-life scenario ;).

**Variables: **The template also has the variable `managedResourceGroupName` . This resource group will be managed by Azure Databricks to create your clusters later on.

**Resources: **Here we have only one resource that is the Databrics Workspace. This is consuming the API version `2018–04–01` .

**Output: **This section contains the variables that you need to expose. It means that they can be accessed by other processes later on in your deployment process.

### Deploying Bicep with Azure DevOps YAML Pipelines

#### Building Bicep Template

As I said before, it is possible to “build” the Bicep template transpiling it into an ARM Template. So to ensure that our template is valid, let’s do it!

To build it, you will also use the Azure CLI. The command is also quite simple:

az bicep build --file <your file> --outdir <your directory>To create an Azure DevOps YAML Pipeline, we will run the command above in an AzureCLI task:

After transpile the Bicep into ARM Template, it will deploy as a Deployment Artefact read to be consumed:

![Image](/img/creating-azure-databricks-with-bicep-and-azure-devops-yaml-pipelines/1_GhTEFX4p8uW0MOolGJJRsQ.png)
Image prepared by author

![Image](/img/creating-azure-databricks-with-bicep-and-azure-devops-yaml-pipelines/1_GsfTVy6oBm0Deal_YVFUcw.png)
Image prepared by author

Build your Bicep is a good practice, as you can validate that there is no error in it and gather all necessary files to be deployed.

#### Deploying Bicep with YAML Pipelines

With the artifacts generated in the build step, now we are ready to deploy them in our environment. For that it is necessary to add one more stage into the build YAML, with the instruction to run the ARM Template:

It consumes the task `AzureResourceManagerTemplateDeployment@3` that is responsible to run the ARM Template into Azure Subscription. You can have more information about this task [here](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/deploy/azure-resource-group-deployment?view=azure-devops).

This stage represents the development stage. To deploy it in other environments, you just need to copy it and replace the values according to your environments :)

### Real life example

To check these examples in more realistic situations, I have been working in a GitHub repository with examples of pipelines configured and working. You can check that in the DevOps Nights GitHub here: [devopsnights/azuredevops-yaml-quickstart-templates (github.com)](https://github.com/devopsnights/azuredevops-yaml-quickstart-templates)

### Databricks YAML Pipeline

As promised below you can check a full Azure DevOps YAML Pipeline configured and working:

### Conclusion

Bicep has become a very relevant tool for Azure and has a good potential to be the default tool for Infrastructure as Code in Azure. So start to be familiar with it now, will be very relevant in the future :)

I hope this post could help you, and see you in the next post!
