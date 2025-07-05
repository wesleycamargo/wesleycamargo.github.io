+++
title = "DataOps Automation — Creating Azure Data Factory with git integration using Bicep"
date = 2021-07-25T00:48:52+02:00
draft = false
categories = ["Technology", "Development", "Azure"]
tags = ["blog", "medium-import", "azure"]
image = "/img/dataops-automation-e-creating-azure-data-factory-with-git-integration-using-bicep/1_HzDcdeTCGa9vVDuUQulXAQ.png"
+++

### DataOps Automation — Creating Azure Data Factory with git integration using Bicep

An important feature available in Azure Data Factory is the git integration, which allows us to keep Azure Data Factory artifacts under Source Control. This is a mandatory step to achieve Continuous Integration and Delivery later on, so why not configure this using Infrastructure as Code with Bicep in a fully automated way?

![Image](/img/dataops-automation-e-creating-azure-data-factory-with-git-integration-using-bicep/1_HzDcdeTCGa9vVDuUQulXAQ.png)
Image prepared by author

In the [official Microsoft documentation](https://docs.microsoft.com/en-us/azure/data-factory/source-control#advantages-of-git-integration) there is a good topic explaining how to integrate Azure Data Factory with git, but through the Azure Portal. In this post, I will explain how to do that using Bicep, the new IaC language for Azure, to make it possible to include this step into your CI/CD process, and also how to deploy only on needed environments.

### Azure Data Factory Git integration

Okay, but why do I need to use git on my ADF? To explain this, I’ll list some advantages that the git integration offers, taken from [Microsoft’s documentation](https://docs.microsoft.com/en-us/azure/data-factory/source-control#advantages-of-git-integration):

#### **Source control**

As your data factory workloads become crucial, you would want to integrate your factory with Git to leverage several source control benefits like the following:

- Ability to track/audit changes.
- Ability to revert changes that introduced bugs.

#### **Partial saves**

When authoring against the data factory service, you can’t save changes as a draft and all publish must pass data factory validation. Whether your pipelines are not finished or you simply don’t want to lose changes if your computer crashes, git integration allows for incremental changes of data factory resources regardless of what state they are in. Configuring a git repository allows you to save changes, letting you only publish when you have tested your changes to your satisfaction.

#### Collaboration and control

If you have multiple team members contributing to the same factory, you may want to let your teammates collaborate with each other via a code review process. You can also set up your factory such that not every contributor has equal permissions. Some team members may only be allowed to make changes via Git and only certain people in the team are allowed to publish the changes to the factory.

#### Better CI/CD

If you are deploying to multiple environments with a [continuous delivery process](https://docs.microsoft.com/en-us/azure/data-factory/continuous-integration-deployment), git integration makes certain actions easier. Some of these actions include:

- Configure your release pipeline to trigger automatically as soon as there are any changes made to your ‘dev’ factory.
- Customize the properties in your factory that are available as parameters in the Resource Manager template. It can be useful to keep only the required set of properties as parameters and have everything else hardcoded.

#### Better Performance

An average factory with git integration loads 10 times faster than one authoring against the data factory service. This performance improvement is because resources are downloaded via Git.

### Git Integration is only for Development Environment

There are two flows recommended by Microsoft to perform CI/CD on ADF, (you can check it on [this post](https://towardsdatascience.com/azure-data-factory-ci-cd-made-simple-building-and-deploying-your-arm-templates-with-azure-devops-30c30595afa5)), in both cases the development happens in the Development Data Factory workspace only, and the artifacts are promoted through CI/CD deployments. It means that we should not create this integration for non-dev environments like UAT or Production. I will also cover how to identify the environment and create the integration only for your development environment :)

### Creating Bicep templates for Azure Data Factory step by step

To keep the explanation simple, I’ll show each stage of the bicep file. Each stage is a deployable file that you can execute individually with the command

*az deployment group create -f <your file>.bicep -g <your resource group>*In the end, we will have the complete file ready to use.

#### Creating Data Factory Workspace

In the first stage, we are creating only the workspace with the most basic configurations. You can see that for the location we are using the location of the Resource Group where we are executing this deployment.

#### Linking GitHub with Azure Data Factory

In this stage we achieve the first goal of this post: create the **git integration. **I include the parameters necessary to connect with a GitHub repo, and then a section into “properties”. Now lets check the parameters:

- **accountName **-** **This is your GitHub/Azure DevOps account name.
- **repositoryName **- Name of your repository, pay attention that you don’t need your account name at the beginning.
- **collaborationBranc **- The branch that will be used to integrate your feature branches. It will depend on your branch stratety. For git flow, it should be developed branch, for GitHub Flow, master/main.
- **rootFolder **- The folder in your repo where the databricks artifacts will be versioned.
- **projectName** - This parameter is only used for Azure DevOps. It’s the Team Project name of your repo.
- **type **- This parameter defines if your repo is hosted on GitHub or Azure DevOps. For GitHub, the value must be:

FactoryGitHubConfigurationFor Azure Devops the value is:

`ash
FactoryVSTSConfiguration
`

![Image](/img/dataops-automation-e-creating-azure-data-factory-with-git-integration-using-bicep/1_kPiiBIbO9dRU8xDRdSdOmg.png)
Image prepared by author

#### Checking the environments

As was explained above, we must create git integration in the development environment only. If you are using only GitHub or only Azure DevOps, this stage should be enough for your scenario. To check that, we need the following steps:

- An environment parameter.
- Extract the content of **repoConfiguration** to an external variable.
- Use a ternary if to check if the environment provided is development. If it is, then use the variable, if not, use an empty group.

![Image](/img/dataops-automation-e-creating-azure-data-factory-with-git-integration-using-bicep/1_sR-iArVHnrubuSbaaH4a4A.png)
Image prepared by author

The bicep file of this stage:

#### Linking GitHub or Azure DevOps to Azure Data Factory

In case that in your scenario you have both Azure DevOps and GitHub, you can prepare your template to support that. This template is more flexible and can be used in more situations. Let’s check the differences from the previous one:

- Included a “User Friendly” parameter to indicate the type of the repo.
- Check the type parameter and create a variable with the expected value.
- Create two configurations, one for GitHub and one for Azure DevOps.
- Include another ternary if nested into the first one

![Image](/img/dataops-automation-e-creating-azure-data-factory-with-git-integration-using-bicep/1_axZ5TeO8PChLhDkzhOEbhA.png)
Image prepared by author

Below you can check the final bicep template:

### Real life example

To check these examples in more realistic situations, I have been working in a repository in GitHub with examples of pipelines configured and working. You can check that in the DevOps Nights GitHub here: [devopsnights/azuredevops-yaml-quickstart-templates (github.com)](https://github.com/devopsnights/azuredevops-yaml-quickstart-templates)

In [this post](https://towardsdatascience.com/azure-data-factory-ci-cd-made-simple-building-and-deploying-your-arm-templates-with-azure-devops-30c30595afa5), I am showing how to consume this Bicep Template into an Azure DevOps Pipeline.

I hope this post can help you to create your ADF in a more automated way, and see you in the next post!

#### References

[Source control — Azure Data Factory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/data-factory/source-control#advantages-of-git-integration)

[Factories — Configure Factory Repo — REST API (Azure Data Factory) | Microsoft Docs](https://docs.microsoft.com/en-us/rest/api/datafactory/factories/configure-factory-repo#factoryvstsconfiguration)

[Microsoft.DataFactory/factories 2018–06–01 — ARM template reference | Microsoft Docs](https://docs.microsoft.com/en-us/azure/templates/microsoft.datafactory/factories?tabs=json)
