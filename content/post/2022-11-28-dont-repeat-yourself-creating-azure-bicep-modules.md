+++
title = "Don’t repeat yourself! Creating Azure Bicep modules 💪"
date = 2022-11-28T18:34:16+01:00
draft = false
categories = ["Technology", "Development", "Azure"]
tags = ["blog", "medium-import", "azure"]
image = "https://cdn-images-1.medium.com/max/800/0*ZB8clYDcM2jGQj71"
+++

### Don’t repeat yourself! Creating Azure Bicep modules 💪

Since our Infrastructure is Code now, why don’t we leverage the best software development practices? Check out this post on achieving reusability on your IaC templates using Bicep Modules!

![Image](https://cdn-images-1.medium.com/max/800/0*ZB8clYDcM2jGQj71)
Photo by [Prateek Katyal](https://unsplash.com/@prateekkatyal?utm_source=medium&utm_medium=referral) on [Unsplash](https://unsplash.com?utm_source=medium&utm_medium=referral)

### What are Azure Bicep Modules?

Bicep Modules are the application of the **Don’t Repeat Yourself **principle, where a Bicep template calls another Bicep template. As a result, this practice enables the reusability of existing code and can speed up the creation of future resources.

Imagine, for example, that you need to control how infrastructure resources are created. To accomplish this, you can implement rules in the bicep templates that, for example, restrict the size of virtual machines or the regions in which they can be created.

Since the definition has already been created and the rules, will probably remain the same in the next project, it is not necessary to create a new definition. We can create a module that allows us to save valuable time and money by reusing these definitions.

### How to create an Azure Bicep Module?

If you are already familiar with Bicep Templates, creating a Bicep Module is effortless, as a module has exactly the same structure and it is not necessary to add any special configuration. It is possible, inclusive, to reuse existing templates as modules.

### How to consume an Azure Bicep Module?

#### ***Declaring a Bicep Module***

When working with Bicep Modules, the syntax changes compared to resources. Instead of declaring `resource`the declaration is now `module`**. **Additionally, it is necessary to reference the module path, which can be local or remote.

![Image](/img/dont-repeat-yourself-creating-azure-bicep-modules/1_qtbw9GCE45MafTDjuJ_6vg.png)
Image prepared by the author

It is also mandatory to add a symbolic name to the resource. The symbolic name can be used to recover an output from the module to be used in another part of the template.

![Image](/img/dont-repeat-yourself-creating-azure-bicep-modules/1_dvcRYdnC-LfnI9eJGBiCwA.png)
Image prepared by the author

The property `name`** **is mandatory. It will become the nested template name in the final template.

![Image](/img/dont-repeat-yourself-creating-azure-bicep-modules/1_6W6RH47RoNV7GF6CfzRC-w.png)
Image prepared by the author

#### ***Passing parameters to Bicep modules***

The parameters on modules follow the same syntax and contain the same features as regular templates. However, to send the parameters to a module it must be under the `params` node. It must match those declared in the module, including the validations.

![Image](/img/dont-repeat-yourself-creating-azure-bicep-modules/1_QOZF4MK2Y5SfT6AuO2m2jg.png)
Image prepared by the author

### How to deploy an Azure Bicep Module?

Deployment of Bicep Modules works exactly like Bicep Templates. It is possible to use [Azure CLI](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-cli?WT.mc_id=DT-MVP-5004039), [Azure PowerShell](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-powershell?WT.mc_id=DT-MVP-5004039), or even through [Azure API.](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-rest?WT.mc_id=DT-MVP-5004039)

I explain in more detail in [this post](https://medium.com/faun/creating-infrastructure-as-code-for-azure-with-azure-bicep-step-by-step-58f03cee75e1) how to deploy using Azure CLI. Below we can see the script used to deploy the templates and modules created above.

After running it is possible to see in the deployments of Azure Resource Group the main.bicep deployment:

![Image](/img/dont-repeat-yourself-creating-azure-bicep-modules/1_4QSoI-AuLcjYe9zxF6iiiQ.png)
Image prepared by the author

And if we click on the nested storage deployment we can observe the resource storageAccount being deployed :

![Image](/img/dont-repeat-yourself-creating-azure-bicep-modules/1_gqdrDwcLHLaVUXVLbG31_Q.png)
Image prepared by the author

### Conclusion

Reusability is one of the main advantages that we can leverage from modularization in any programming language and with Infrastructure as Code templates, it wouldn’t be different. Another benefit is that it also will ensure that your environment is more stable as your templates will be already tested by others, and most importantly, will also save implementation time.

I hope this helps you, and see you at the next one!

![Image](/img/dont-repeat-yourself-creating-azure-bicep-modules/0_JSaWL5U0fpZZ0xeP.png)

#### 👋 If you find this helpful, please click the clap 👏 button below a few times to show your support for the author 👇

#### 🚀[Join FAUN Developer Community & Get Similar Stories in your Inbox Each Week](http://from.faun.to/r/8zxxd)
