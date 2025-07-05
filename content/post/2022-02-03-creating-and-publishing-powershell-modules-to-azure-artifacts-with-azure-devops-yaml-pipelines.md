+++
title = "Creating and publishing PowerShell Modules to Azure Artifacts with Azure DevOps YAML Pipelines"
date = 2022-02-03T00:02:46+01:00
draft = false
categories = ["Technology", "Development", "Azure", "DevOps"]
tags = ["blog", "medium-import", "azure", "devops"]
image = "/img/creating-and-publishing-powershell-modules-to-azure-artifacts-with-azure-devops-yaml-pipelines/1_fsn7lNWadvhhO4YLZ_YTxQ.jpeg"
+++

### Creating and publishing PowerShell Modules to Azure Artifacts with Azure DevOps YAML Pipelines

PowerShell Modules are very useful and can save a lot of time if well designed and created. Check on this post how to create and pack a basic PowerShell Module, and publish it into Azure Artifact using Azure DevOps YAML Pipelines.

![Image](/img/creating-and-publishing-powershell-modules-to-azure-artifacts-with-azure-devops-yaml-pipelines/1_fsn7lNWadvhhO4YLZ_YTxQ.jpeg)
Photo by [Trnava University](https://unsplash.com/@trnavskauni?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/artifact?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

### Creating PowerShell Module and PowerShell Module Manifest

#### Creating a PowerShell Module - psm1

A PowerShell Module is a way to organize and pack a set of PowerShell components to be reused or shared. The most common components to be shared are functions.

In this example, we will create the module `Example.Module` with the extension `psm1` , and include a PowerShell function.

#### Creating a PowerShell Module Manifest - psd1

To create the Module Manifest, it is possible to run the cmdlet `New-ModuleManifest` . It will generate the `psd1` manifest file with default configurations.

The most important variables are `NestedModules` and `RootModule` which must contain the name of the psm1 file.

#### Creating a nuspec file for the PowerShell Module

To create the nuspec file you need to run the command `nuget spec Example.Module` . It will generate a base file that it is possible to replace with your values.

#### Making the PowerShell Module version dynamic

In both `psm1`(1) and `nuspec` (2) files there is a variable `$(version)` . This variable will be replaced by the version defined in the deployment pipeline. It uses the [Azure DevOps macro syntax](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch#understand-variable-syntax) to consume the variables.

![Image](/img/creating-and-publishing-powershell-modules-to-azure-artifacts-with-azure-devops-yaml-pipelines/1_hC2Fp7Sq3dAcnFCrOSfRSA.png)
Image by author

![Image](/img/creating-and-publishing-powershell-modules-to-azure-artifacts-with-azure-devops-yaml-pipelines/1_TOn6t_70pay-LOgPYJVjAg.png)
Image by author

### Creating an Azure Artifacts Feed

For instructions on how to create a feed, you can check this post where I also show how to push a dotnet Core package to Azure Artifacts:

[How to send .Net Core NuGet packages to Azure Artifacts | by Wesley Camargo | Medium](https://camargo-wes.medium.com/how-to-send-net-core-nuget-packages-to-azure-artifacts-238fa08db6b5)

### Deploying PowerShell Module with Azure DevOps YAML Pipeline into Azure Artifact

#### Version Number to update PowerShell Module

To simplify this example, we will provide the version number of the module by Azure DevOps parameter(1). Then we populate a variable with the value of the parameter using template expression syntax(2). In a future post, I will how to bump this number automatically.

![Image](/img/creating-and-publishing-powershell-modules-to-azure-artifacts-with-azure-devops-yaml-pipelines/1_ntWVJnMc2jpUqLegnE_fkw.png)
Image by author

#### Replacing version number in nuspec and module manifest

The next step is to replace the variable `$(version)` mentioned above with the version number. To do it will be used the [replace token task](https://marketplace.visualstudio.com/items?itemName=qetza.replacetokens). Note that we specify the extensions of the manifest and nuspec files.

![Image](/img/creating-and-publishing-powershell-modules-to-azure-artifacts-with-azure-devops-yaml-pipelines/1_xMkiWFVlx2G_UJ_M6-pinQ.png)
Image by author

#### Packing PowerShell Module with NuGet

To pack the module is used the NuGetCommand task, and specified the nuspec file. After generating the NuGet package it will be published as a pipeline artifact - be careful not to confuse with Azure Artifacts, we are almost there but not yet :) - which will be consumed in the next stage: deployment.

![Image](/img/creating-and-publishing-powershell-modules-to-azure-artifacts-with-azure-devops-yaml-pipelines/1_RNGcd5bStLWiDOzCSIUTpA.png)
Image by author

#### Pushing PowerShell Module to Azure Artifacts

Finally, in the deployment stage, we will push our package into our Azure Artifacts. It will also use the NuGet Command task to push it, sending the `nupkg` generate in the build stage. It is also necessary to provide the name of the Azure Artifacts Feed.

![Image](/img/creating-and-publishing-powershell-modules-to-azure-artifacts-with-azure-devops-yaml-pipelines/1_8L4ufhKDW1GtuEU_gsEPyQ.png)
Image by author

#### Complete azure-pipelines.yml to publish PowerShell Modules to Azure Artifacts
[

![Image](/img/creating-and-publishing-powershell-modules-to-azure-artifacts-with-azure-devops-yaml-pipelines/1_BCiLLad3dvZLwBa-B5cAVQ.png)
](https://faun.to/bP1m5)

Join FAUN: [**Website**](https://faun.to/i9Pt9)** **💻**|**[**Podcast**](https://faun.dev/podcast)** **🎙️**|**[**Twitter**](https://twitter.com/joinfaun)** **🐦**|**[**Facebook**](https://www.facebook.com/faun.dev/)** **👥**|**[**Instagram**](https://instagram.com/fauncommunity/)** **📷|[**Facebook Group**](https://www.facebook.com/groups/364904580892967/)** **🗣️**|**[**Linkedin Group**](https://www.linkedin.com/company/faundev)** **💬**|** [**Slack**](https://faun.dev/chat) 📱**|**[**Cloud Native** **News**](https://thechief.io)** **📰**|**[**More**](https://linktr.ee/faun.dev/)**.**

**If this post was helpful, please click the clap 👏 button below a few times to show your support for the author 👇**
