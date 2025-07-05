+++
title = "This is what you should do to make your CI/CD more secure"
date = 2023-06-14T18:04:59+02:00
draft = false
categories = ["Technology", "Development", "DevOps"]
tags = ["blog", "medium-import", "devops"]
image = "https://cdn-images-1.medium.com/max/800/0*HQSrqlfb4u0sFQe6"
+++

### This is what you should do to make your CI/CD more secure

Security is now a trending topic in the IT industry, with data leaks and breaches happening left and right, so it’s super important to tackle any risks in our environments. One of these risks is the management of Service Principal secrets to connect to workloads running outside Azure, such as other clouds or external CI/CD tools. In this post, we will learn how to use Workload Identity Federation to tackle this and make our DevOps process more secure and efficient.

### Making your CI/CD more secure with Passwordless Authentication on Azure

![Image](https://cdn-images-1.medium.com/max/800/0*HQSrqlfb4u0sFQe6)
Photo by [regularguy.eth](https://unsplash.com/@moneyphotos?utm_source=medium&utm_medium=referral) on [Unsplash](https://unsplash.com?utm_source=medium&utm_medium=referral)

### Pre-requisites

- Azure Service Principal Name or Azure Managed Identity
- GitLab repository

### What is Workload Identity Federation?

WIF (Windows Identity Foundation) enables passwordless authentication, granting access to Azure AD and Azure Resources without the need to manage secrets or certificates.

Once configured, you establish trust with an external OpenID Connect (OIDC) identity provider such as GitHub, GitLab, Kubernetes, Google, and AWS, also known as **Issuer. **It is also necessary to provide the **Subject Identifier**, so Azure AD will be able to identify the resource when attempting to log in and establish a connection with the external application.

### How to setup Workload Identity Federation on Azure

The process to set up is quite simple but requires permissions to manipulate Azure AD identities. It consists of appending an existing AAD, which can be a Service Principal or a Managed Identity with a Federated Credential.

In our example, I will configure it in a GitLab pipeline.

To do so, it is necessary to inform

- Issuer: The Identity Provider, in our case `[https://gitlab.com](https://gitlab.com)`
- Subject Identifier: In the case of a GitLab pipeline, the repository name `project_path:<project>/<repo name>:ref_type:branch:ref:main`
- Audience: Service account tokens `[https://gitlab.com](https://gitlab.com)`

#### Creating an Azure User Managed Identity

If you don’t have a Service Principal or Managed Identity in place yet, you can run the Azure CLI script below. It creates the MI and sets Contributor permission in the current subscription.

The script will also print out the TenantId a ClientID that will be necessary to connect on the GitLab pipeline.

#### Setting up an Azure Federated Credential

The script below creates the Federated Credential in an existing Manage Identity. It can also be replaced by a Service Principal.

### Configuring GitLab CI/CD Settings

On the GitLab side, you just need to inform the TenantId and ClientId that were prompted in the creation of the Managed Identity.

The pipeline below demonstrates how to connect and create a resource group in an Azure Subscription:

After running the pipeline, you can see that the connection was successful:

![Image](/img/this-is-what-you-should-do-to-make-your-cicd-more-secure/1_iwJ-Vzmm0Nti_Ju2R_rykw.png)

![Image](/img/this-is-what-you-should-do-to-make-your-cicd-more-secure/0_NDaQ7lVOrIQVhEGs.png)

#### 👋 If you find this helpful, please click the clap 👏 button below a few times to show your support for the author 👇

#### 🚀[Join FAUN Developer Community & Get Similar Stories in your Inbox Each Week](http://from.faun.to/r/8zxxd)
