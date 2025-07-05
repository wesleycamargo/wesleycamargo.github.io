+++
title = "Stop breaking your environment: How to get started with Azure DevOps Pipelines"
date = 2022-11-07T15:17:27+01:00
draft = false
categories = ["Technology", "Development", "Azure", "DevOps"]
tags = ["blog", "medium-import", "azure", "devops"]
image = "https://cdn-images-1.medium.com/max/800/0*EkiWY-eBH6JhvNEU"
+++

### Stop breaking your environment: How to get started with Azure DevOps Pipelines

Have you ever had problems with manual deployments? It is not about if but when an error will happen. I even saw entire sites being replaced wrongly! It is scary, isn’t it? Azure DevOps Pipelines will help you to avoid such mistakes, so check on this post how to deploy your application in minutes, taking advantage of all benefits that automated pipelines can bring to you!

![Image](https://cdn-images-1.medium.com/max/800/0*EkiWY-eBH6JhvNEU)
Photo by [Louis Hansel](https://unsplash.com/@louishansel?utm_source=medium&utm_medium=referral) on [Unsplash](https://unsplash.com?utm_source=medium&utm_medium=referral)

### What is Azure DevOps Pipelines?

A Deployment Pipeline is an automated process that combines Continuous Integration (CI) and Continuous Delivery (CD), deploying your application in a given environment. In other words, it automatically builds, tests, and deploys your code to make them available to other people.

### Prerequisites

Before we start creating the pipelines, there are configurations that we need to prepare in advance. My friend [Jev Suchoi](https://www.devjev.nl/) and I have already created a series of posts covering all these topics:

- [**How to create an Azure DevOps organization**](https://www.devjev.nl/posts/2022/how-to-create-an-organization-in-azure-devops/)
- **How to configure your Azure DevOps project**
- [**Basic git commands you need to know**](http://Git Basic commands in a nutshell)
- [**Pushing code to git**](https://camargo-wes.medium.com/git-basic-commands-in-a-nutshell-fc911c9f350a)
- **Connecting Azure DevOps with Azure**
- **Creating a variable group on Azure DevOps**

### How to create an Azure DevOps pipeline

Azure DevOps Pipelines are an implementation of deployment pipelines that supports multiple programming languages and clouds. Basically, everything can be deployed using this tool.

So let’s create our first pipeline!

First of all, we need our application under a Version Control System. In [**this post**](https://camargo-wes.medium.com/git-basic-commands-in-a-nutshell-fc911c9f350a), I showed how to create a local repository for a dotnet core application, and [**here **](https://medium.com/@camargo-wes/azure-devops-remote-repositories-in-a-nutshell-how-to-create-and-push-your-code-to-git-219d3e1df71)I show how to push the code to a remote repository on Azure Repos.

With the repo in place, go to Pipelines on the left menu, and then click on **New pipeline**:

![Image](/img/stop-breaking-your-environment-how-to-get-started-with-azure-devops-pipelines/1_zW4FBgtDLNby8FJinT8teQ.png)
Image by Author

In the new window, choose your repository. In this example we are using the Azure Repo that we created on the post mentioned above:

![Image](/img/stop-breaking-your-environment-how-to-get-started-with-azure-devops-pipelines/1_M1g7_hmhSaBOQJs6-TzG2w.png)
Image by Author

![Image](/img/stop-breaking-your-environment-how-to-get-started-with-azure-devops-pipelines/1_IJZAmr6glzC5EW9PvB1DOg.png)
Image by Author

Choose the **Starter pipeline. **If you already have your own YAML, you can choose the Existing option.

![Image](/img/stop-breaking-your-environment-how-to-get-started-with-azure-devops-pipelines/1_7dKmLb-LGN8neBcanVm9Eg.png)
Image by Author

#### Azure DevOps Pipeline anatomy

Azure DevOps will create a skeleton of a pipeline. It is quite simple, but enough to start. Let’s see what we have there:

- **Trigger — **This is the configuration about which branch(or branches) our pipeline will be triggered if we have new commits. Normally this is tied to your branch strategy, by default it is created to the default branch in the chosen repository.
- **Pool **— The pools are a set of machines that run our build inside. Azure DevOps has two pools when it’s created. The **Default **is a pool in which you can add your own agents. **Azure Pipelines **on the other hand is a SaaS agent that Microsoft provisions.
- **Steps **— Finally it starts to be fun, we have the steps! They are instructions that we send to agents in order to complete our pipeline. In some cases, they can be simple command-line scripts, but we can also make use of “packaged scripts” in the Microsoft marketplace, also known as **Tasks**.

![Image](/img/stop-breaking-your-environment-how-to-get-started-with-azure-devops-pipelines/1_ioGI-irRd-PRszOq7ZfqOQ.png)
Image by Author

To prepare the pipeline for dotnet core, we will change the pool to **windows-latest**, as I am using a Windows machine, I want to keep the same.

And we will also use a **dotnet core task**, with the publish command. It will prepare all the artifacts necessary to deploy our application.

In the next step, we will use an Azure Web App task, that will deploy in deploy in App Service previously created in Azure. Pay attention that a service connection is required here, so make sure that the name matches yours.

Below there is all you need to create this pipeline. Simply delete the content created automatically and replace it.

### How to create an Azure DevOps pipeline with stages

Now let's make it a bit more complex :). The pipeline above will cover some simple scenarios, mostly for testing and learning. However, if you need something more robust, you will need to organize it in a better way.

There are two resources on Azure Pipelines that will enable it: **Stages** and **jobs.**

#### What are Jobs in Azure DevOps?

In a few words, **Jobs **are sets of **Steps **that run together. Every pipeline has at least one job, even if you do not specify one, by default your steps will be encapsulated in a job.

There are multiple scenarios where the use of multiple jobs is beneficial, as per separate responsibilities, running different jobs in parallel, and so on.

There is one special type of job for deployments. It is recommended to use it as brings some benefits as Deployment history and the possibility to use pre-configured strategies, such as canary, blue-green, etc.

To specify a job, you can simply add this to your pipeline:

#### What are Stages in Azure DevOps?

As we saw above that Jobs are sets of Steps, so guess what? Stages are sets of… Jobs!

To determine the boundaries of your deployment, pausing and validating before moving on, Stages must be used.

I recommend structuring your pipelines in the following manner:

- One stage to gather all artifacts that will be used during the deployment, also known as a “build stage” (in some cases, you don’t need a real build generating binaries, as some languages don’t produce them, as IaC languages or even PHP for example).
- Different deployment stages for different environments, for example, Development, UAT, and Production. It will allow you to validate the quality of your code during the journey toward production.

The stage structure is similar to the job syntax, and contains one or more jobs:

Below we can see the conversion of the simple pipeline to a complete pipeline using **Jobs **and **Stages:**

### Key takeaways

Azure Pipelines is a powerful and very flexible tool that can technically support all programming languages, clouds, and technologies. It is part of Azure DevOps ecosystem, having native integration with with the other tools, do not require external integrations, however it also supports if required, and it makes quite easy to configure and increase productivity from the first moment you start to use it.

I hope this would help you, and see you in the next post!

![Image](/img/stop-breaking-your-environment-how-to-get-started-with-azure-devops-pipelines/0_rbBIrAtLWWmh60Qi.png)

#### 👋 If you find this helpful, please click the clap 👏 button below a few times to show your support for the author 👇

#### 🚀[Join FAUN Developer Community & Get Similar Stories in your Inbox Each Week](http://from.faun.to/r/8zxxd)
