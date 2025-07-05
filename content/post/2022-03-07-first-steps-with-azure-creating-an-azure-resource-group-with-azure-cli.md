+++
title = "First steps with Azure: Creating an Azure Resource Group with Azure CLI"
date = 2022-03-07T18:25:56+01:00
draft = false
categories = ["Technology", "Development", "Azure"]
tags = ["blog", "medium-import", "azure"]
image = "/img/first-steps-with-azure-creating-an-azure-resource-group-with-azure-cli/1_EERoSBDh5ydWiIxF4MQ_mw.jpeg"
+++

### First steps with Azure: Creating an Azure Resource Group with Azure CLI

An Azure Resource Group is a container that holds related resources for an Azure solution. This is an important resource in Azure and in this post, I will continue the series of Basic commands for Azure CLI and show how it is possible to create Azure Resource Groups using Azure CLI.

![Image](/img/first-steps-with-azure-creating-an-azure-resource-group-with-azure-cli/1_EERoSBDh5ydWiIxF4MQ_mw.jpeg)
Photo by [Simon Infanger](https://unsplash.com/@photosimon?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/baby-steps-sand?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

### What is Az CLI?

Az CLI or Azure CLI is a command line interface with Azure. It can be used in any command line prompt, including PowerShell and Bash, and it allows the creation of resources and resource groups, executing actions, and much more possibilities. In the previous post, I showed the basic commands to connect and configure your Azure Subscription using Azure CLI, if you don’t know how to configure your Azure CLI local environment you can [check it here](https://faun.pub/an-entry-gate-to-azure-configuring-your-azure-subscription-with-azure-cli-22c2c68ce4d9).

### What is an Azure Resource Group

According to Microsoft documentation, this is the definition of an Azure Resource Group:

> A resource group is a container that holds related resources for an Azure solution. The resource group can include all the resources for the solution, or only those resources that you want to manage as a group. You decide how you want to allocate resources to resource groups based on what makes the most sense for your organization. Generally, add resources that share the same lifecycle to the same resource group so you can easily deploy, update, and delete them as a group.

In practice, we can consider it as a “Directory” on Azure where you can group your resources. There are many ways to organize it, the most common is to make them small with resources of the same context.

For more information, you can check the official documentation [here](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal#what-is-a-resource-group).

### Az CLI commands for Azure Resource Group

#### Azure Resource Group - Summary of commands

Below there is a summary of all commands used in this tutorial. You can copy it and replace the values between <> to your own values :)

#### How to use Az CLI Help?

It is also possible to check all commands related to resource groups with the command `az --help` . For more details about how to use the help check[ this post](https://faun.pub/an-entry-gate-to-azure-configuring-your-azure-subscription-with-azure-cli-22c2c68ce4d9) where I also show how to login into Azure Subscription with Azure CLI.

![Image](/img/first-steps-with-azure-creating-an-azure-resource-group-with-azure-cli/1_qzsCZn6P4B_IGE7aNc54Xw.png)
az group help — Image by author

### How to list existing Azure Resource Groups with Az CLI

The command used to list Azure Resource Groups is `az group list` . It will return a JSON by default. To have a more human understandable output you can add `--output table`in front of the command or any other output of your choice. The final command would be`az group list --output table` .

![Image](/img/first-steps-with-azure-creating-an-azure-resource-group-with-azure-cli/1_Jg2D1lp2XIK4jOkssyQKqA.png)
az group list — Image by author

### How to create an Azure Resource Group with Az CLI

To create a new Azure Resource Group, it is necessary to provide two required information:

- **Location**: The Azure Region where your resource group will be created.
- **Name: **The name of your Resource Group

The final command is `az group create --location <location of your resource group> --name <name of your resource group>` . Replace the content between <> with your own values .

![Image](/img/first-steps-with-azure-creating-an-azure-resource-group-with-azure-cli/1_Jyy_7GHOHiTDpqud7hGruw.png)
az group create — Image by author

To check additional options use the command `az group --help` .

After creation, run again the command `az group list --output table`to check if the resource group is shown.

![Image](/img/first-steps-with-azure-creating-an-azure-resource-group-with-azure-cli/1_u805NgHvFi7QjF5qTGfICw.png)
az group list — Image by author

### How to show details of an Azure Resource Group with Az CLI

To check the details of a specific Resource Group, you can run the command `az group show --name <your resource group name>` . This command returns basically the same information after the creation command.

![Image](/img/first-steps-with-azure-creating-an-azure-resource-group-with-azure-cli/1_p_zyDT4xi590b0oXXbIewQ.png)
az group show — Image by author

### How to delete an Azure Resource Group with Az CLI

The delete command will prompt if you are sure about executing the delete operation. This is because all resources created under this resource group will also be deleted, so run this command only when you want to delete them as well.

After the conclusion of the command, after running the list command the created resource group is not listed anymore.

![Image](/img/first-steps-with-azure-creating-an-azure-resource-group-with-azure-cli/1_sXlJmtY762m-Y74U2dVfHw.png)

### Conclusion

The Resource Groups are an important part of Azure and automating its creation is a fundamental part of a DevOps process.

See you in the next post!
[

![Image](/img/first-steps-with-azure-creating-an-azure-resource-group-with-azure-cli/1_BCiLLad3dvZLwBa-B5cAVQ.png)
](https://faun.to/bP1m5)

Join FAUN: [**Website**](https://faun.to/i9Pt9)** **💻**|**[**Podcast**](https://faun.dev/podcast)** **🎙️**|**[**Twitter**](https://twitter.com/joinfaun)** **🐦**|**[**Facebook**](https://www.facebook.com/faun.dev/)** **👥**|**[**Instagram**](https://instagram.com/fauncommunity/)** **📷|[**Facebook Group**](https://www.facebook.com/groups/364904580892967/)** **🗣️**|**[**Linkedin Group**](https://www.linkedin.com/company/faundev)** **💬**|** [**Slack**](https://faun.dev/chat) 📱**|**[**Cloud Native** **News**](https://thechief.io)** **📰**|**[**More**](https://linktr.ee/faun.dev/)**.**

**If this post was helpful, please click the clap 👏 button below a few times to show your support for the author 👇**
