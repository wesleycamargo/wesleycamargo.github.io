+++
title = "Pushing your code to GitHub and Azure Repos at the same time"
date = 2020-05-22T06:33:08+02:00
draft = false
categories = ["Technology", "Development", "Azure"]
tags = ["blog", "medium-import", "azure"]
image = "/img/pushing-your-code-to-github-and-azure-repos-at-the-same-time/1_T1XtTzfeztcxintWQDAMyA.png"
+++

### Pushing your code to GitHub and Azure Repos at the same time

If you have an existing repository hosted by an Azure Repos or in GitHub, you can add new remotes easily. Let’s see how we can do it!

#### Creating and versioning a local project

Let’s create our project. In an empty directory type the CLI commands below:

It will create a new .net core web application, with a gitignore file and versioned in a local git.

![Image](/img/pushing-your-code-to-github-and-azure-repos-at-the-same-time/1_T1XtTzfeztcxintWQDAMyA.png)

#### Creating an Azure Repos repository and pushing your code

In your Azure DevOps account, follow these steps:

![Image](/img/pushing-your-code-to-github-and-azure-repos-at-the-same-time/1_2-w6QFXI1BKNjpfsFA4j6A.png)

In the next screen disable the ‘Add a README’ option and enter your repo name:

![Image](/img/pushing-your-code-to-github-and-azure-repos-at-the-same-time/1_6Ac2s4pAuPtWqdJ83iZEFQ.png)

In the empty repository created you have some options to push your code, we’ll push from an existing repository, so copy the command as the figure:

![Image](/img/pushing-your-code-to-github-and-azure-repos-at-the-same-time/1_-o92AzdgasXkufQXiH8yBA.png)

In your terminal paste the command, remember to check if you’re in your project directory. The highlighted log will confirm if your push was successful:

![Image](/img/pushing-your-code-to-github-and-azure-repos-at-the-same-time/1_uCQXpknv5LfF8haIA44_Vg.png)

Refresh your Azure Repos page and your code was pushed!
