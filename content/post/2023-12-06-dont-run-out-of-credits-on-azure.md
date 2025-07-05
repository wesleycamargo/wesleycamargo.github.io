+++
title = "Don’t run out of credits on Azure!"
date = 2023-12-06T19:01:04+01:00
draft = false
categories = ["Technology", "Development", "Azure"]
tags = ["blog", "medium-import", "azure"]
image = "https://cdn-images-1.medium.com/max/800/0*yQ4GvCZbwp2mH6sc"
+++

### Don’t run out of credits on Azure! How to shutdown Azure Virtual Machines automatically with Terraform

If you are distracted and forgetful like me, you probably already forgot an Azure Virtual Machine running without need and just figured it out when your Azure credits were gone. To avoid this, check a simple tip on how to solve this problem with Terraform.

![Image](https://cdn-images-1.medium.com/max/800/0*yQ4GvCZbwp2mH6sc)
Photo by [Tristan Gassert](https://unsplash.com/@tristangassert?utm_source=medium&utm_medium=referral) on [Unsplash](https://unsplash.com?utm_source=medium&utm_medium=referral)

In my[ previous post](https://medium.com/@camargo-wes/getting-started-with-azure-what-are-azure-virtual-machines-and-how-to-create-it-using-terraform-254c1cb6642b), I have already shown how to create an Azure Virtual Machine using Terraform, now I’m adding this feature, which, for me, is very important and helps me to not spend all my Azure Credits in a forgotten VM 🙃.

### What is Azure VM Auto-Shutdown?

Azure VM Auto-Shutdown is like setting a timer for your Azure VM. Auto-shutdown allows you to set a specific time so your Virtual Machine will turn off. This is a handful when you create VMs for tests, or even in development/QA environments, where you don’t need your VMs running at night when your team is not working.

### Terraform resource for auto-shutdown of an Azure VM

To make it work, we will use the Terraform resource `azurerm_dev_test_global_vm_shutdown_schedule`. This is part of the Azure [Terraform provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dev_test_global_vm_shutdown_schedule). The usage is quite simple, as we can see below:

The most important information required are the VM id, daily_recurrence_time, and timezone. Based on this information your VM will be shut down at the time you have defined.

### Complete Terraform to create an Azure VM with auto-shutdown

To facilitate the understanding of how to integrate it in a real-life scenario, I have implemented the shutdown process in the following complete Terraform file:

### Conclusion

Below it is the link to my GitHub repository where I am creating a library to have all references related to Terraform. I hope that this post despite being simple might be helpful!
[wesleycamargo/terraform (github.com)](https://github.com/wesleycamargo/terraform)

![Image](/img/dont-run-out-of-credits-on-azure/0_0rM_F_9XoS3sP5GW.png)

#### 👋 If you find this helpful, please click the clap 👏 button below a few times to show your support for the author 👇

#### 🚀[Join FAUN Developer Community & Get Similar Stories in your Inbox Each Week](http://from.faun.to/r/8zxxd)
