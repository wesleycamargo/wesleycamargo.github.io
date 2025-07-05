+++
title = "The entry gate to Azure: Configuring your Azure subscription with Azure CLI"
date = 2022-02-25T16:51:35+01:00
draft = false
categories = ["Technology", "Development", "Azure"]
tags = ["blog", "medium-import", "azure"]
image = "/img/the-entry-gate-to-azure-configuring-your-azure-subscription-with-azure-cli/1_WUN0NX9YOBytDa6iXLB5BQ.jpeg"
+++

### The entry gate to Azure: Configuring your Azure subscription with Azure CLI

Azure CLI is a command line interface with Azure. It can be used in any command line prompt, including PowerShell and Bash, and it allows the creation of resources and resource groups, executing actions like an Azure Data Factory pipeline, and much more possibilities. In this post, I will show the basic commands to connect and configure your Azure Subscription.

![Image](/img/the-entry-gate-to-azure-configuring-your-azure-subscription-with-azure-cli/1_WUN0NX9YOBytDa6iXLB5BQ.jpeg)
Photo by [Jan Tinneberg](https://unsplash.com/@craft_ear?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/door-open?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

### How to set an Azure Subscription with Azure CLI

#### Azure CLI commands for Login and Account

Below is a summary of all commands used

Now let’s see the details of execution for each command.

#### How to know which commands to use in Azure CLI

At least in the beginning until you get familiar with the commands a very useful tip is to make use of the help command. It’s quite simple and you just need to add `--help` or `-h` after the command. The most basic would be to run it after `az` like `az --help` . It will show all subgroups and commands available for the tool.

![Image](/img/the-entry-gate-to-azure-configuring-your-azure-subscription-with-azure-cli/0_Ghwg5Wn9fm0PpMfY.png)
Image by author

#### How to login into Azure with Azure CLI

The easiest way to login into Azure is using the interactive mode. It will open a new tab on your browser with the authentication page.

To do it run the command `az login` and choose your account:

![Image](/img/the-entry-gate-to-azure-configuring-your-azure-subscription-with-azure-cli/1_cFaJ-sa-gDYIgWNEKGGXOA.png)
Image by author

By default, after choosing your account it will prompt a list of available subscriptions on that account. These subscriptions can also be listed with the command az account list, described below.

#### How to set a subscription with Azure CLI

First, we need to see which subscriptions are available. To do it run the command `az account list` , this command will display all subscriptions available in your logged accounts.

![Image](/img/the-entry-gate-to-azure-configuring-your-azure-subscription-with-azure-cli/1_u7pxouSyHjtGeWysTrJMWQ.png)
Image by author

Once you have your subscriptions id, you can connect to it through the command `az account set --subscription` . After this command, you can confirm if the subscription was settled by running the command `az account show`

![Image](/img/the-entry-gate-to-azure-configuring-your-azure-subscription-with-azure-cli/0_GxY7TQADhWhLRz4y.png)
Ìmage by author

### Conclusion

Although the commands are simple, they are very important, as they are an entry gate to interact with Azure.
[

![Image](/img/the-entry-gate-to-azure-configuring-your-azure-subscription-with-azure-cli/1_BCiLLad3dvZLwBa-B5cAVQ.png)
](https://faun.to/bP1m5)

Join FAUN: [**Website**](https://faun.to/i9Pt9)** **💻**|**[**Podcast**](https://faun.dev/podcast)** **🎙️**|**[**Twitter**](https://twitter.com/joinfaun)** **🐦**|**[**Facebook**](https://www.facebook.com/faun.dev/)** **👥**|**[**Instagram**](https://instagram.com/fauncommunity/)** **📷|[**Facebook Group**](https://www.facebook.com/groups/364904580892967/)** **🗣️**|**[**Linkedin Group**](https://www.linkedin.com/company/faundev)** **💬**|** [**Slack**](https://faun.dev/chat) 📱**|**[**Cloud Native** **News**](https://thechief.io)** **📰**|**[**More**](https://linktr.ee/faun.dev/)**.**

**If this post was helpful, please click the clap 👏 button below a few times to show your support for the author 👇**
