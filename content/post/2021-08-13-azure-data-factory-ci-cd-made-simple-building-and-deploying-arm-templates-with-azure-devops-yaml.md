+++
title = "Azure Data Factory CI-CD made simple: Building and deploying ARM templates with Azure DevOps YAML…"
date = 2021-08-13T18:24:55+02:00
draft = false
categories = ["Technology", "Development", "Azure", "DevOps"]
tags = ["blog", "medium-import", "azure", "devops"]
image = "/img/azure-data-factory-ci-cd-made-simple-building-and-deploying-arm-templates-with-azure-devops-yaml/0_UxUKOY8oNniMGGHd.png"
+++

### Azure Data Factory CI-CD made simple: Building and deploying ARM templates with Azure DevOps YAML Pipelines

#### The easiest way to publish/deploy Azure Data Factory artifacts

### How to Create Azure Data Factory using IaC

#### Infrastructure as Code

There are tons of reasons to use IaC in your projects, as you can check [here](https://docs.microsoft.com/en-us/devops/deliver/what-is-infrastructure-as-code#:~:text=Infrastructure%20as%20Code%20enables%20DevOps,to%20prevent%20common%20deployment%20issues.). One of them is that Infrastructure as Code is the easiest and fast way to implement your environment. So, as we want to keep our ADF deployment simple, why not use it :)?

In this example, I will use [Bicep ](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview)templates to deploy our Data Factory. If Bicep is new to you, it is basically a DSL (Domain Specific Language) to make things easier for ARM Templates users.

![Image](/img/azure-data-factory-ci-cd-made-simple-building-and-deploying-arm-templates-with-azure-devops-yaml/0_UxUKOY8oNniMGGHd.png)
Bicep is has a good extension for VS Code— Image from [Microsoft Docs](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/install#development-environment)

In this [post](https://camargo-wes.medium.com/dataops-automation-creating-azure-data-factory-with-git-integration-using-bicep-376fd3b5bc81), you can check how to create the Bicep file for Data Factory with git integration that will be used to deploy the ADF.

It will create a link between your Azure Data Factory and your git repo (it works on Azure DevOps and GitHub), so when you create a pipeline in your Data Factory, it will also be versioned into the git repo.

### Git Repository

#### Repository Structure

The repo structure will depend on each project. One of the best practices is to keep all necessary code to deploy a project in the same repo. Due to that, I like to create a structure where I have the name of the component, and always an “src” folder underneath. In this case, we will make the src folder as “Root folder” in the git integration process.

![Image](/img/azure-data-factory-ci-cd-made-simple-building-and-deploying-arm-templates-with-azure-devops-yaml/1_YtAqSUP9bqM4NyrMgs3UIw.png)
Repository Structure — Image by author

#### Required files to build ARM Templates

Some files are necessary to have in our repo to generate the templates. These files need to be added to the src folder, and they will be referenced during the build stage.

In the src folder create the file package.json. It contains the metadata of the package that will be used to build the ADF Artifacts.

In the same folder also create the file publish_config.json with the content below. It will not impact the generation of the ARM Templates, but it’s necessary to run the build:

The last file is arm-template-parameters-definition.json. This contains the definitions of your ARM Parameters. I won’t go into details, as it requires a dedicated post for it. For the initial version, you can just create the content below:

After create git integrate and all necessary files this is how your repo will look like:

![Image](/img/azure-data-factory-ci-cd-made-simple-building-and-deploying-arm-templates-with-azure-devops-yaml/1_xesC9GvPVvyOeHafv6EvXg.png)
Repository structure for Azure Data Factory — Image by author

### How to create Build YAML Pipelines for Azure Data Factory

No doubt that pipeline as code will be the future of pipeline definitions, with the capacity to be under version control and reusability.

#### Variables

The first configuration that is necessary is the variables. They will be used both for build and release later on.

The most important variables during the build stage are:

- workingDir - This is the src directory. There must be the required files mentioned above.
- dataFactoryResourceId - Fill this with the resource Id of your ADF. It’s a good idea to make it parametrizable to work in different environments

![Image](/img/azure-data-factory-ci-cd-made-simple-building-and-deploying-arm-templates-with-azure-devops-yaml/1_Y8FG1YgQAtQCCysOutYifw.png)
Build and Deployment Variables — Image by author

#### Building Data Factory

As mentioned above, we need to consume the [ADFUtilities NPM package](https://www.npmjs.com/package/@microsoft/azure-data-factory-utilities) in the build process.

In the first two tasks, NodeJS is configured in the build agent. Pay attention to workingDir variable that we mentioned in the Variables section.

In the latest two tasks, we are calling the NPM package to Validate and “Build” our Data Factory and Generate the ARM Templates. In the last task “artifacts” is the relative output directory. It means that it will be the output directory to the ARM Templates.

![Image](/img/azure-data-factory-ci-cd-made-simple-building-and-deploying-arm-templates-with-azure-devops-yaml/1_hxff1a4SfxpSRAKGjak-7A.png)
Build tasks for Azure Data Factory — Image by author

In the next tasks, we are copying the ARM Templates from the output to the staging directory, and “building“ the bicep files into ARM Templates. These ones will be used to create the Azure Data Factory Workspace.

![Image](/img/azure-data-factory-ci-cd-made-simple-building-and-deploying-arm-templates-with-azure-devops-yaml/1_FzU20QATViUliVFKaujdlw.png)
Build tasks for Azure Data Factory — Image by author

After running the build pipeline, you will have the artifacts that will be consumed during the deployment stage:

![Image](/img/azure-data-factory-ci-cd-made-simple-building-and-deploying-arm-templates-with-azure-devops-yaml/1_xLM1sqP0zF8ToLhmWy84bA.png)
Azure Data Factory artifacts — Image by author

![Image](/img/azure-data-factory-ci-cd-made-simple-building-and-deploying-arm-templates-with-azure-devops-yaml/1_KokLuIz66bVH_C8D9MqvGA.png)
Azure Data Factory ARM Templates — Image by author

### How to create Release YAML Pipelines for Azure Data Factory

To deploy Data Factory we are using the run Once strategy. It will consume the artifacts created on the build stage

#### Development

When the git integration is enabled in development environment, as the code is produced in the workspace, there is no need to publish in this environment. It will deploy only the environment using the Infrastructure as Code templates. It also contains a dependency for the build stage.

![Image](/img/azure-data-factory-ci-cd-made-simple-building-and-deploying-arm-templates-with-azure-devops-yaml/1_1CyHziX8HIxTiFKWd1AHJw.png)
Development environment — Image by author

#### UAT and Production

In UAT we have a dependency on the development environment. In Production, the dependency is on UAT. As in these stages, we need to deploy both, infrastructure and code, we will use a preDeploy and deploy job:

![Image](/img/azure-data-factory-ci-cd-made-simple-building-and-deploying-arm-templates-with-azure-devops-yaml/1_H7fXBNZIabhKW5BEoxT2Lw.png)
preDeploy stage — Image by author

![Image](/img/azure-data-factory-ci-cd-made-simple-building-and-deploying-arm-templates-with-azure-devops-yaml/1_TK9afdqzBDdiE2m1791joQ.png)
deploy stage — Image by Author

When run it will first create the Infrastructure using the Bicep files in the preDeploy Stage, and then deploy the artifacts generated on the build stage. And this is the final result:

![Image](/img/azure-data-factory-ci-cd-made-simple-building-and-deploying-arm-templates-with-azure-devops-yaml/1_D1TW--IjWUMr1c-TR5CNYQ.png)
Deployment Pipeline — Image by Author

### Key Takeaways

There is more than one strategy to deploy Azure Data Factory, I have tried most of them and they work very well, but this one from my point of view is the simplest and clean way to achieve fully automated deployments.

Below you can check the complete YAML used to deploy it. You can also check other Azure DevOps YAML Templates examples in my GitHub repo: [devopsnights/azuredevops-yaml-quickstart-templates (github.com)](https://github.com/devopsnights/azuredevops-yaml-quickstart-templates)

I hope it can be useful!
