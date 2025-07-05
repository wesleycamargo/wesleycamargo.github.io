+++
title = "How to deploy Management Groups with Azure Bicep and Azure DevOps"
date = 2022-09-26T15:04:40+02:00
draft = false
categories = ["Technology", "Development", "Azure", "DevOps"]
tags = ["blog", "medium-import", "azure", "devops"]
image = "/img/how-to-deploy-management-groups-with-azure-bicep-and-azure-devops/1_dpWnelmmdCalVRtcf1k5fQ.jpeg"
+++

### How to deploy Management Groups with Azure Bicep and Azure DevOps

If you have several Subscriptions on your Azure Tenant, Management Groups can be very handy to organize them. Check in this post, on how to deploy Management Groups using Azure Bicep.

![Image](/img/how-to-deploy-management-groups-with-azure-bicep-and-azure-devops/1_dpWnelmmdCalVRtcf1k5fQ.jpeg)
Photo by [Ian Battaglia](https://unsplash.com/@ianjbattaglia?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/collections/16762197/data-center?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

### What are Azure Scopes?

According to official Microsoft documentation “*Scope* is the set of resources that access applies to.” This is used to have granularity when assigning permission in your Azure resources. The majority of Azure resources are deployed into the Resource Group scope, and when we use Azure bicep, this is the default. But there are four levels of scopes in Azure as we can see in the image below:

![Image](/img/how-to-deploy-management-groups-with-azure-bicep-and-azure-devops/0_7OACaXq6bHYTogMW.png)
Azure Scope levels — Image from [Microsoft Docs](https://learn.microsoft.com/en-us/azure/role-based-access-control/scope-overview?WT.mc_id=DT-MVP-5004039)

With that said, when we are deploying a resource different than those deployed at the resource level, we need to specify against which scope we are running it. For Management groups, the scope must be the **tenant. **In the following sessions, we will see how to set it up.

#### Bicep scope to deploy Azure Management Groups

As said before, the default scope in an Azure Bicep script is the resource group. For most traditional resources such as App Services, or Storage Accounts, it is not necessary to specify it, but to deploy management groups it is necessary to specify the tenant as the target scope:

![Image](/img/how-to-deploy-management-groups-with-azure-bicep-and-azure-devops/1_9ubvxa-Zjx8xk4dz0iucFw.png)
Image prepared by Author

Below it’s possible to see the code necessary for the most basic creation of a Management Group:

#### How to call an Azure Bicep template at the Management Group scope with Azure CLI and Azure DevOps YAML pipelines

To run deployments against tenant scope it is also necessary to specify it in Azure CLI

Below there is an Azure DevOps YAML pipeline with the task configured to deploy the bicep file created above:

### SPN permissions to deploy Azure Management Groups

By default, the Service Principal Name does not have permission to deploy tenant resources. You need to grant it at the root scope “/” to make it work.

In this case, the error below will show up:

`ash
AuthorizationFailed: The client with object id does not have authorization to perform action 'Microsoft.Resources/deployments/validate/action' over scope '/providers/Microsoft.Resources/deployments/main' or the scope is invalid.
`

#### How to elevate user permissions as Azure AD Global Administrator

First, you need to elevate your permissions as user Global Administrator into Azure AD:

#### How to grant Service Principal Name permissions to deploy Azure Management Groups

After setting up your permissions as Global Administrator, you are able to set your SPN with the correct permissions:

### The best Azure Management Groups naming convention

It is also crucial to properly name your Management Groups, making them easy to maintain, especially if you are adopting Infrastructure as Code with automated pipelines. Also, if you have multiple directories, you also need to efficiently identify which directory a particular management group belongs to.

My friend [@DevJevNL](https://twitter.com/DevJevNL) has an excellent proposal to tackle the naming convention in a series of posts, here is his suggestion for [Management Groups.](https://www.devjev.nl/posts/2022/the-ideal-management-group-naming-convention/)

### Conclusion

Although it is a very simple process, there are some tricks to deploying management groups. In this post, I tried to clarify all the necessary steps to deploy it. Below it is possible to visualize the management group deployed in our Azure Tenant.

![Image](/img/how-to-deploy-management-groups-with-azure-bicep-and-azure-devops/1_v7ss3g8wQRZUMN4XuXvs8w.png)
Image prepared by Author

### References

[https://learn.microsoft.com/en-us/azure/role-based-access-control/elevate-access-global-admin](https://learn.microsoft.com/en-us/azure/role-based-access-control/elevate-access-global-admin?WT.mc_id=DT-MVP-5004039)
[**Enterprise-Scale/EnterpriseScale-Setup-azure.md at main · Azure/Enterprise-Scale**
*This article will guide you through the process of configuring permissions in your Azure environment to enable ARM…*github.com](https://github.com/Azure/Enterprise-Scale/blob/main/docs/EnterpriseScale-Setup-azure.md)[](https://github.com/Azure/Enterprise-Scale/blob/main/docs/EnterpriseScale-Setup-azure.md)
