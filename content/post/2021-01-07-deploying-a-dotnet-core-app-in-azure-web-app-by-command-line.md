+++
title = "Deploying a DotNet Core app in Azure Web App by command line"
date = 2021-01-07T09:01:16+01:00
draft = false
categories = ["Technology", "Development", "Azure"]
tags = ["blog", "medium-import", "azure"]
+++

### Deploying a DotNet Core app in Azure Web App by command line

If you need to fast deploy your dotnet core App in Azure, but don’t want to configure an entire CI/CD Pipeline, check in this post on how to deploy it!

To deploy the web app we will use a simple DotNet Core MVC application.

First of all, let´s create some parameters to prepare our resources. We are using a random id to avoid create the resources with some existing name:

To create the app, we will use an MVC Sample in the dotnet core templates. If you already have an existing project to deploy, skip the first line. We will prepare the publishing package with the dotnet core publish command and then zip it in a file:

In Azure, we will create a resource group and an app service plan, that are pre reqs to run a WebApp.

And finally, execute the deployment in the WebApp created above.
