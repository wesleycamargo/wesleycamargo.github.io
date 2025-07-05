+++
title = "How to send .Net Core NuGet packages to Azure Artifacts"
date = 2020-05-09T04:49:34+02:00
draft = false
categories = ["Technology", "Development", "Azure"]
tags = ["blog", "medium-import", "azure"]
image = "/img/how-to-sendanet-core-nuget-packages-to-azure-artifacts/0_oywzs4eXdLxxWk5u.png"
+++

### How to send .Net Core NuGet packages to Azure Artifacts

Learn how you can send .net core NuGet packages to Azure Artifacts.

To increase reusability in our company, an interesting thing that we can consider is to share our packages. Using .net, both core or standard, you can consider NuGet as a package manager. The Azure DevOps has an implementation for a **NuGet as a Service** named **Azure Artifacts**.

In this post, I’ll show you how to deploy manually a NuGet package step by step.

Below are all commands used in this tutorial, but I’ll explain each one.

Let’s get the hands dirty!

#### Creating and configuring an application

To start, we need a .net core class library application. To do this, type on terminal:

dotnet new classlibIt will create a basic project with a .csproj and one class. Rename the class to Math and put the code below on this:

To send new packages, first, we need to configure a connection between our app and the feed that will be created. For now, we’ll add a nuget.config file in our project. On terminal type:

dotnet new nugetconfigA file like this will be created:

![Image](/img/how-to-sendanet-core-nuget-packages-to-azure-artifacts/0_oywzs4eXdLxxWk5u.png)

This is the standard NuGet feed, after create ours we will update this file.

Now let’s package the project in a NuGet package using this command:

dotnet packIt will create a nupkg file in the bin directory. We’ll use this later.

![Image](/img/how-to-sendanet-core-nuget-packages-to-azure-artifacts/0_83XEvUyH0uDKcUWR.png)

The project it’s done, now let’s create the feed.

#### Creating a new artifact feed with Azure Artifacts

Access your Azure DevOps account and follow the steps:

![Image](/img/how-to-sendanet-core-nuget-packages-to-azure-artifacts/0_EXzq8-qaE0Ac_ts2.png)

![Image](/img/how-to-sendanet-core-nuget-packages-to-azure-artifacts/0_vkeAqTVvYmVduEBd.png)

On the next screen click on Connect to feed:

![Image](/img/how-to-sendanet-core-nuget-packages-to-azure-artifacts/0_9izcpWYFJoem9d1H.png)

![Image](/img/how-to-sendanet-core-nuget-packages-to-azure-artifacts/0_v8PKHzfxVPp0xt3g.png)

Here is the connection information necessary to connect our app with the feed. Copy the Project setup content and update the value of the nuget.config created before.

![Image](/img/how-to-sendanet-core-nuget-packages-to-azure-artifacts/0_egn74caQQW8ObuXS.png)

#### Connecting to feed

To make the connection, we need to download and install a connection provider. Save the content below in a file and run:

After installing the credential provider, we can authenticate with Azure DevOps. In the previous section in Publish packages, it’s given to you command with your connection information, add the parameter **interactive**. It will be used to start a new browser session and do the authentication. Without this parameter, the command won’t work.

dotnet nuget push .\bin\Debug\NugetPackage.1.0.0.nupkg --source "MeuFeed" --api-key teste --interactiveIt will be provided a URL and code, open the URL in the browser, and paste the code there.
