+++
title = "DataOps Automation — Accessing Databricks API with AAD Service Principal Name"
date = 2021-05-29T16:24:43+02:00
draft = false
categories = ["Technology", "Development"]
tags = ["blog", "medium-import"]
image = "/img/dataops-automation-e-accessing-databricks-api-with-aad-service-principal-name/1_r4Rwmx79PqTVP7A3ZlN8LA.png"
+++

### DataOps Automation — Accessing Databricks API with AAD Service Principal Name

Databricks is an Apache Spark tool for data engineering used to process and transform large amounts of data and explore running machine learning models.

In this post I’ll show how to call databricks API’s, an important resource to automate the deployment and resources creation.

![Image](/img/dataops-automation-e-accessing-databricks-api-with-aad-service-principal-name/1_r4Rwmx79PqTVP7A3ZlN8LA.png)

### Preparing Tokens

Yes, you read it right token**s** in the plural, we need more than one token to perform authentication.

Actually, if your SPN is a user in your databricks workspace only the AAD token should be enough, but I believe that in most situations if you want to automate from scratch your workspace it will not be the case.

#### Creating AAD token

To create an AAD token it´s necessary the tenant Id of your subscription, an SPN Id, and SPN secret. If you don’t know how to create a Service Principal Name check it out here [Create an Azure AD app & service principal in the portal — Microsoft identity platform | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal)

For this, I have created the function below, as we will use it more than once.

#### Preparing HTTP header

As I mentioned before, we need two AAD Tokens if our SPN is not added as a user into databricks.

The first token is a databricks token. To create that we need to provide the databricks resource id (2ff814a6–3304–4ab8–85cb-cd0e6f879c1d).

If your SPN is a user in your databricks workspace, only this token should be enough.

The second one is the management endpoint token you also need to provide the resource id, in this case, it should be “[https://management.core.windows.net/](https://management.core.windows.net/)”. Additionally, your SPN must have Contributor or Owner permissions on your databricks.

**Creating the databricks Personal Access Token**

With our header prepared, you just need to call the databricks API, consuming the methods that you need.

**Complete Script**

Below you can find the complete script, including the auxiliar functions :)

I hope it can help you, and see you in next post!
