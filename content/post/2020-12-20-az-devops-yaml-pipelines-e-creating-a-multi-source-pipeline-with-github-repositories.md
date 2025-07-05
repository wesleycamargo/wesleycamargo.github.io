+++
title = "Az DevOps YAML Pipelines — Creating a Multi Source pipeline with GitHub Repositories"
date = 2020-12-20T01:21:03+01:00
draft = false
categories = ["Technology", "Development", "DevOps"]
tags = ["blog", "medium-import", "devops"]
+++

### Az DevOps YAML Pipelines — Creating a Multi Source pipeline with GitHub Repositories

Sometimes should be necessary to use more than one repository in our deployment pipelines. Maybe you are deploying resources from different repositories together, or maybe you have a script repo with some reusable tools.

But when we create a YAML pipeline, by default it just checkout the repo on what our YAML is versioned, so it´s necessary to add a second repo, and below we will see how to do it =).

If you don´t know how to create a basic YAML pipeline, you can learn this here: [Create your first pipeline — Azure Pipelines | Microsoft Docs](https://docs.microsoft.com/en-us/azure/devops/pipelines/create-first-pipeline?view=azure-devops&tabs=net%2Ctfs-2018-2%2Cbrowser)

In this example, I´ll use two GitHub repositories, the first one has my App Code and the YAML pipeline, and the second one has some PowerShell scripts.

We can see the initial build YAML below:

During the build execution of this pipeline, we can see that we have an “auto checkout”, that is not required any additional configuration.
