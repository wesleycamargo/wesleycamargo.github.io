+++
title = "Delivery as Code with Azure DevOps Release Engine"
date = 2022-01-28T19:05:03+01:00
draft = false
categories = ["Technology", "Development", "Azure", "DevOps"]
tags = ["blog", "medium-import", "azure", "devops"]
image = "/img/delivery-as-code-with-azure-devops-release-engine/1__BNFAVB90d4cdBvFgz7loA.jpeg"
+++

### Delivery as Code with Azure DevOps Release Engine

Delivery as Code is the concept of having all necessary configurations of your delivery defined in a file, which can be kept under source control and have all good practices applied to application development over it. It ensures that your deliveries are consistent and reliable.

![Image](/img/delivery-as-code-with-azure-devops-release-engine/1__BNFAVB90d4cdBvFgz7loA.jpeg)
Photo by [Jackson Hendry](https://unsplash.com/@actionjackson801?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/night-sky?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

### Everything as Code

In the past years, everything is becoming “as Code”. It started with Infrastructure as Code, aka IaC, and today there are many languages supporting it, since the AWS Cloud Formation, passing through Terraform and Pulumi, that are Cloud agnostics, until the Azure ARM Templates and his newborn son Azure Bicep.

But there are also other uses of as Code, such as Database as Code, Pipelines as Code, Monitoring as Code, Security as Code, and so forth, this list is big and still growing.

#### Why have my definitions as code?

One of the reasons behind this is if you have the instructions to create your environment versioned, you can easily reproduce the steps to create it. Imagine that for some reason you lose your infrastructure environment, in some minutes you can spin up a new environment based on the versioned definitions.

Another reason is that as you can easily create a new environment, you can apply development good practices on it. For example, you can deploy a new environment using the versioned scripts, and run Unit Tests against it. With frameworks like Pester this is easy to implement.

### What is Delivery as Code?

The advantages of having definitions under source control are clear, so why do not apply them in the Delivery of the software?

With that in mind and my passion to automate everything that I can, I started to develop an easy way to configure the releases and make them as simple as possible, based on my experience working in the DevOps field.

To configure a new delivery, instead of configuring manually or having scripts of how to implement it, you just need to inform what you need and all the complexity of the implementation will be abstracted. This is the declarative approach very keen on Infrastructure as Code, which allows you have indepotent deployments.

### What is Azure DevOps Release Engine

Azure DevOps Release Engine is an approach developed to support Delivery as Code. It was built on top of Azure DevOps YAML Templates and can be used to deploy any kind of technology, with any kind of tool anywhere.

It means that you can deploy languages such as:

- dotnet Core
- nodeJS
- Java

Using any tool like:

- Azure Bicep
- Terraform
- Cloud Formation
- Pulumi

In any platform:

- Azure
- AWS
- VMWare
- OnPremisses data centers

### How does Azure DevOps Release Engine work?

Azure DevOps Release Engine was created using Azure DevOps YAML Pipelines as a support tool. It consists of a centralized repository where they centralize deployment definitions - the instructions of how to deploy - are versioned and Client/Application repositories which must have the declaration of what should be deployed.

The client application repository must have a YAML pipeline that extends from the main YAML in the centralized repository - [here there is a post explaining how the extended pipelines work](https://towardsdev.com/how-to-extend-an-azure-devops-yaml-pipeline-template-b9d851c5e872). The main file is responsible to parse the instructions provided and deciding which definition must be used.

![Image](/img/delivery-as-code-with-azure-devops-release-engine/1_TdY4HlqI1O_KNVr0Rljknw.png)

#### Centralized Release definitions

The definitions in this repository can be reused, saving time and allowing all deployments of the same kind of component to be deployed in the same way, which leads to more consistent and less problematic releases, as the deployment instructions were well tested.

#### Client/Application repositories

The client repositories are the repos where your applications are versioned. It can have any sort of resource to be deployed and to consume the Release Engine you just need to create a YAML file following the Azure DevOps Release Engine schema.

### How to set up Azure DevOps Release Engine?

#### Importing the repo into Azure DevOps

In the Azure DevOps Release Engine repository at GitHub copy the link to the repository following the sequence below:

![Image](/img/delivery-as-code-with-azure-devops-release-engine/1_uPtLLtDIIbY3RKAgTjMX7A.png)
Copy the repository URL — Image by author

![Image](/img/delivery-as-code-with-azure-devops-release-engine/1_aqO2RG6w41ox4JDYWe8twg.png)
Click in Import repository — Image by author

![Image](/img/delivery-as-code-with-azure-devops-release-engine/1_wvfx90_WRO7LRsbyJ_v-Dw.png)
Paste the link and import — Image by author

After it you should have the repository in your Azure DevOps repos, with the structure below:

![Image](/img/delivery-as-code-with-azure-devops-release-engine/1_-E9yirfM67UbeJjnPi8rVg.png)
Image by author

### How to set up the application to consume the Azure DevOps Release engine?

#### Repository structure

In a dotnet Core application repository add the file azure-pipelines.yml in the root folder, and one file corresponding to each environment that will be deployed in a “variables” directory. I recommend having the source code under a different directory to keep the repository cleaner and tidy, in my case it’s under the `src`directory.

![Image](/img/delivery-as-code-with-azure-devops-release-engine/1_wZ_WvkWKvUAYkNZIJD1R9Q.png)
Image by author

#### Creating the azure-pipelines.yml file

This file contains all instructions on what resources need to be deployed. I will add the complete file in the end so it will be possible to just copy it ;).

![Image](/img/delivery-as-code-with-azure-devops-release-engine/1_4ozkyI8QtFth7UpEaAZQGw.png)
“Importing” a repository in Azure DevOps — Image by author

The beginning of the file contains pipeline configurations that will be the same in most of the pipelines. The declaration of Release Engine as a repository resource is very important, as the templates will be consumed from this resource that will be “imported”.

#### Azure DevOps Release Engine settings

With Release Engine imported, it is necessary now to extend from the main.yml file **(1)**. This file is basically a parser that will read the information provided as parameters and redirect to the correct file. I will deep dive into this file in future posts.

![Image](/img/delivery-as-code-with-azure-devops-release-engine/1_G470hXFe5jMfVuOFv_Stkw.png)
Image by author

The most important section is the **parameters**. This section contains all information that will be provided to the engine. As mentioned above this information will be parsed by the main file, and according to the resource types provided. call the right definition to deploy it.

**Release settings
**Inside parameters, the session **settings (2) **contain the configuration of your release.

**Azure settings
**In the current version, it is possible to enable or disable the deployment of your infrastructure, application, and build **(3)**. Here it is also necessary to provide the directory of your variable files. The variables will be explained later. It is possible to provide the values straight on this file,

**Environments
**It is also necessary to provide information about your Azure environment **(4)**, such as service connection, resource group where the resources will be deployed, and so on. If the parameter **new **under resource group is provided, it will also create the resource group.

Last but not least, you must declare which environments will be deployed. The way that it was built will create exactly the same configuration for all environments, which ensures that the implementation in your production environment will follow the same steps as in the others, increasing the **reliability of the delivery**, as was mentioned at the beginning of this post.

#### Configuring resources to be deployed with Azure DevOps Release Engine

The latest section in the azure-pipelines.yml is the resource. This is a list of resources that will be deployed in this release and its configurations. In this example, we are going to deploy a dotnet Core application into an Azure Web App. Let’s go through the main items in this section:

![Image](/img/delivery-as-code-with-azure-devops-release-engine/1_WWvMG336nyZ1iMQj4kWsPQ.png)
Image by author

**name **- This is the name of the web app that will be created into Azure. This is provided through a parameter that is stored in the respective variable file of the environment that is running. It means that you can deploy in different environments like dev, uat and prd with unique names, avoiding conflicts.

**type **- The type is parsed inside the main.yml file and calls the right deployment definition for the type provided. This example is a dotnet Core application but it is possible to deploy any resource with the deployment definition already implemented on Release Engine.

**runName** - Run name is the name of the Azure DevOps job. This is necessary to make the run unique and have the possibility to link dependent resources.

**enabled** - It is possible to easily disable the deployment of this resource.

**deploy.type** - Inform which type of deployment it is. In this example, the dotnet Core application will be deployed into an Azure Web App.

**deploy.infrastructure.servicePlanName** - Similar to the name, we are informing the name of the service plan that will be used by our Azure Web App.

#### Configuring variables for Azure DevOps Release Engine

As mentioned before, it is necessary one variable file per environment. The variable file allows having resources with unique names in the environments.

![Image](/img/delivery-as-code-with-azure-devops-release-engine/1_aQ7Pc0GTl1tcQViMPWR7Xw.png)

This file will be loaded automatically by the engine, so the only action necessary is to add the file following the patter {env-name}-vars.yml, where env-name is the name defined at azure-pipelines.yml

After being loaded by the engine, the variables will be available like any other variable in Azure DevOps. In azure-pipelines the variables are accessed using the macro syntax $(variable-name).

#### Complete template

Below there is the complete template for dotnet Core and Azure Web Apps. You can also check the repository with more examples and the implementation of the engine on [Azure DevOps Release Engine repository at GitHub](https://github.com/devopsnights/AzureDevOpsReleaseEngine).

### Takeaways

The Azure DevOps Release Engine simplifies the release configuration, abstracting the release definition providing an “as Code” approach for your Delivery.

This is a work in progress but built on top of a very mature process based on real-life experience, solving real-life problems that we face in our day-by-day activities.

I hope it can help, and see you in future posts!
[

![Image](/img/delivery-as-code-with-azure-devops-release-engine/1_BCiLLad3dvZLwBa-B5cAVQ.png)
](https://faun.to/bP1m5)

Join FAUN: [**Website**](https://faun.to/i9Pt9)** **💻**|**[**Podcast**](https://faun.dev/podcast)** **🎙️**|**[**Twitter**](https://twitter.com/joinfaun)** **🐦**|**[**Facebook**](https://www.facebook.com/faun.dev/)** **👥**|**[**Instagram**](https://instagram.com/fauncommunity/)** **📷|[**Facebook Group**](https://www.facebook.com/groups/364904580892967/)** **🗣️**|**[**Linkedin Group**](https://www.linkedin.com/company/faundev)** **💬**|** [**Slack**](https://faun.dev/chat) 📱**|**[**Cloud Native** **News**](https://thechief.io)** **📰**|**[**More**](https://linktr.ee/faun.dev/)**.**

**If this post was helpful, please click the clap 👏 button below a few times to show your support for the author 👇**
