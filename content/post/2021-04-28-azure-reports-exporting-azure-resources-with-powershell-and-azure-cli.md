+++
title = "Azure Reports: Exporting Azure resources with Powershell and Azure CLI"
date = 2021-04-28T17:31:36+02:00
draft = false
categories = ["Technology", "Development", "Azure"]
tags = ["blog", "medium-import", "azure"]
image = "https://cdn-images-1.medium.com/max/800/0*ItDdV0YdZCjm5u5T"
+++

### Azure Reports: Exporting Azure resources with Powershell and Azure CLI

A common scenario when we work with DevOps and cloud is the need to export information about your resources. In this post, I’ll show the simplest way to extract that with the command line.

![Image](https://cdn-images-1.medium.com/max/800/0*ItDdV0YdZCjm5u5T)

The idea of this post is to show the mechanism behind the extraction, I’ll run a simple command to recover the resources and choose some columns to export to a CSV file. You can use this as a base of more complex reports to handle properties, cross with other information, etc.

The first step is to connect in our Azure Account using Azure CLI (you can also do it using Azure Powershell), and recover all resources in our subscription:

Then we create an Array List to populate, iterate on the resources recovered above, and add the needed fields on the array:

Now we create a file name based on date and time to export the populated array. In my case I’m using the Delimiter “;”, as in my favorite regionalization this is the default pattern for CSV files. If this is not your case, you can remove that parameter.

This is the complete script, including the outputPath parameter:

And this is the file exported:

![Image](/img/azure-reports-exporting-azure-resources-with-powershell-and-azure-cli/1_s2J6kTWmfhRKG0O86hqaHg.png)

This is the link for my GitHub repository, and the intention is to fill it with more complex reports :)

[https://github.com/wesleycamargo/AzureReports](https://github.com/wesleycamargo/AzureReports)

See you in the next post!
