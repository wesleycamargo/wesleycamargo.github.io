+++
title = "DataOps Automation — Deploying Databricks notebooks with Azure DevOps YAML Pipelines"
date = 2021-06-15T18:54:07+02:00
draft = false
categories = ["Technology", "Development", "Azure", "DevOps"]
tags = ["blog", "medium-import", "azure", "devops"]
image = "/img/dataops-automation-e-deploying-databricks-notebooks-with-azure-devops-yaml-pipelines/1_7aLnpcc0eKFY3hptjG5W4Q.png"
+++

### DataOps Automation — Deploying Databricks notebooks with Azure DevOps YAML Pipelines

In this post, I will show an easy way how to deploy your Databricks notebooks using Azure DevOps and YAML pipelines.

This will be the first of a series of posts, showing how to deploy code and infrastructure of Data Platform tools. I created GitHub repo to keep the examples, so if you want you can check that here: [wesleycamargo/DataOps (github.com)](https://github.com/wesleycamargo/DataOps) 🙂

![Image](/img/dataops-automation-e-deploying-databricks-notebooks-with-azure-devops-yaml-pipelines/1_7aLnpcc0eKFY3hptjG5W4Q.png)
Image prepared by author

#### Project structure

The organization of this repo is based on components, so I’ll keep everything necessary to deploy some kind of component together. If you have a different structure, remember to update the yaml templates with your paths.

For databricks we have a `/databricks` and a `/src` folder, in the future it will be important to segregate from IaC code. You can have your project folders on this level, in my example, I have two notebooks inside a `calculator` folder`.

![Image](/img/dataops-automation-e-deploying-databricks-notebooks-with-azure-devops-yaml-pipelines/1_v-4dZZgIV3rrRXiZe6jcOA.png)
Project structure — Image prepared by author

#### Preparing artifacts

In the build stage, we will create a copy of our notebooks into a staging folder, and then publish them as build artifacts to be consumed later in the process.

We will copy all folders under `/src` folder, so when we deploy that into databricks workspace all folders will be created into the workspace as well.

If you run the pipeline now you already can see the artifacts and the structure:

![Image](/img/dataops-automation-e-deploying-databricks-notebooks-with-azure-devops-yaml-pipelines/1_zBile6BF8zXBHNK78lqPRQ.png)
Image prepared by author

#### Setting variables

In the deployment stage, we will need to consume some sensitive information like your databricks Personal Access Token. To avoid hard coding this information and to keep this example simple, let's create some variables in the pipeline.

![Image](/img/dataops-automation-e-deploying-databricks-notebooks-with-azure-devops-yaml-pipelines/1_YZkUdlCrfAwCZKOyL_Wo_g.png)
Image prepared by author

![Image](/img/dataops-automation-e-deploying-databricks-notebooks-with-azure-devops-yaml-pipelines/1_igdByvqLq-3bKW2Pvnl7JA.png)
Image prepared by author

#### Deploy

To deploy we will use a special kind of job called `deployment `🙂, there are some advantages to use this instead of the regular job, but I’ll do not explore them now.

In the first step, we are setting up the python version to 3.x, to that we are using a task to abstract this activity.

In the second one, we are setting app our databricks workspace. Basically, we are creating a `.databrickscfg` file with your token and databricks URL. To populate this file we need to consume the variables created before. So be sure that you have `databricks.host` and `databricks.token` create. We are also installing the databricks CLI to run on the next step.

And finally, in the last step we are importing the artifacts generated before using databricks CLI.

Below you can see the complete YAML template.

Hope that post can help you and see you in the next post! 😃
