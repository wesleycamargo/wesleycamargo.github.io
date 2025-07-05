+++
title = "From Terraform to Azure Bicep: What You Need to Know about syntax"
date = 2023-02-17T18:31:38+01:00
draft = false
categories = ["Technology", "Development", "Azure", "Infrastructure"]
tags = ["blog", "medium-import", "azure", "terraform", "infrastructure-as-code"]
image = "/img/from-terraform-to-azure-bicep-what-you-need-to-know-about-syntax/1_TaDCxnnAcZb53Fi-ToztNg.jpeg"
+++

### From Terraform to Azure Bicep: What You Need to Know about syntax

![Image](/img/from-terraform-to-azure-bicep-what-you-need-to-know-about-syntax/1_TaDCxnnAcZb53Fi-ToztNg.jpeg)
Photo by Botond Czapp: [https://www.pexels.com/photo/birds-flying-on-blue-sky-7255793/](https://www.pexels.com/photo/birds-flying-on-blue-sky-7255793/)

Hey there Terraform experts! I am confident that you know the power of infrastructure as Code in managing and provisioning IT infrastructure and have been applying it with the famous HashiCorp tool. But have you heard about Azure Bicep, the newer Microsoft IaC language for managing Azure resources? If you’re curious about the differences between Terraform and Bicep, and how Bicep can help you better manage your Azure resources, you’ve come to the right place. Let’s dive in and explore the world of Infra as Code with Azure Bicep! In this first post, I’m going to break down the basic differences between Terraform and Bicep file structures. These infrastructure-as-code tools have their own unique syntax and components, so it’s important to know what sets them apart. By the end of this post, you’ll have a solid grasp of what makes them tick.

### Introducing Terraform and Bicep

Terraform and Azure Bicep are two popular Infra as Code (IaC) tools that allow developers and operations teams to manage and provision cloud infrastructure using development practices.

Terraform is a tool developed by HashiCorp that supports multiple cloud platforms, including Azure, while Azure Bicep is a newer tool developed by Microsoft specifically for managing Azure resources. Both tools have their own syntax and language for defining Infrastructure as Code and offer benefits such as consistency, scalability, and version control. However, there are also some differences between the two, such as how they handle state management and the availability of community-built providers. In the following sessions, we’ll explore the similarities and differences between Terraform and Azure Bicep, and help you decide which tool is best for your infrastructure management needs.

### Language and Syntax

Terraform and Bicep has a lot in common. Both use their own domain-specific languages, with a declarative approach, support modularization, and are designed to be human-friendly(I am looking at you, ARM Templates 🙃). Terraform uses HashiCorp Configuration Language, also known as HCL, developed by HashiCorp and has several providers, supporting not only Azure, but AWS, GCP, and even VMWare. Bicep is developed by Microsoft with the intention to abstract the usage of ARM Templates and was developed specifically for Azure, which gave a great integration.

The structure of both languages is similar, within the same building blocks, with the main components being resources, inputs, and outputs, and as I said above, quite easy to read. Below we can see a comparison of the creation of an Azure Storage Account:

![Image](/img/from-terraform-to-azure-bicep-what-you-need-to-know-about-syntax/1_StyddfWR0evZ6TjZ4MKRNQ.png)
Image prepared by the author

Now let’s analyze the main differences:

#### Provider

The first and biggest difference that note is that in the Terraform example, we have a section called “provider”. As Terraform supports not only Azure but also other providers, it is required to declare the provider that we want to use.

As Bicep is designed specifically for Azure, the provider statement is not required.

#### Input

Another difference is that the input parameters have different reserved words. In Terraform it’s called `variable`, the default values are declared with a `default` statement and its syntax require curly brackets.

Bicep, in turn, declares the inputs by the reserved word `param` , the attribution of a default value can be done with the equals sign and it’s not required any brackets. Bicep also has a `variable` reserved world, but it’s used not for inputs, below we can see more about it.

#### Local variables

Local variables in Terraform have a special section called `locals`. All necessary variables must be declared in this section and must be accessed by the syntax `local.<variable name>` and can be used to create combinations and complex operations.

locals {
  resource_group_name = "myTerraformResourceGroup"
  location            = "West Europe"
}On Bicep, it is not necessary to have a specific session, being possible to declare anywhere in the file (although is recommended to do in the beginning to make it more readable). It also makes the syntax a little simpler than in terraform `var location = ‘westeurope’`

#### Resources

Finally something in common! For both, Terraform and Bicep, the resource is declared by the reserved word… `resource`! And there is more in common, in both cases, when declaring the resource you need to declare which resource is desired and you also need to create an alias to this resource, so it will be possible to access information from it, even in the case that you have several resources of the same type. The internal properties will be different depending on each resource type, but in general, you need to provide the resource name, SKU, location, and so on.

Although the concepts are quite the same, the syntax is slightly different as we can see below:

**Terraform resource:**

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}**Bicep resource:**

``
resource storage &#x27;Microsoft.Storage/storageAccounts@2022-09-01&#x27; = {
  kind: &#x27;StorageV2&#x27;
  location: location
  name: storageAccountName
  sku: {
    name: &#x27;Standard_LRS&#x27;
  }
}
``n

#### Output

The outputs follow a similar logic as the inputs. Terraform requires curly brackets, Bicep no. In terraform, it is necessary to specify the resource type first, then the alias, and finally the property. It is also important to highlight that is not possible to assign a type to an output in Terraform.

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}Bicep is again, slightly simple. No brackets and you can reference by the alias directly, without having to declare the resource type. In Bicep is also possible to assign a type in the output, which is useful in some cases.

``
output storageName string = storage.name
``n

#### Terraform storage account example

#### Bicep storage account example

### Conclusion

In conclusion, while Terraform and Bicep share some similarities in their purpose and functionality, they have significant differences in syntax, which can affect the user experience and overall efficiency in deploying infrastructure as code. Understanding these syntax differences is crucial for developers to effectively utilize the benefits of each tool and to determine which one is the best fit for a particular project or organization.

In the upcoming posts, we will dive deeper into other differences between both tools, exploring their impact on various aspects of infrastructure deployment and management, and offering practical tips and solutions to common challenges. Stay tuned to learn more about how to optimize your infrastructure as code with Terraform and Bicep!

![Image](/img/from-terraform-to-azure-bicep-what-you-need-to-know-about-syntax/0_XC6gJ9HR_xbxqqSp.png)

#### 👋 If you find this helpful, please click the clap 👏 button below a few times to show your support for the author 👇

#### 🚀[Join FAUN Developer Community & Get Similar Stories in your Inbox Each Week](http://from.faun.to/r/8zxxd)
