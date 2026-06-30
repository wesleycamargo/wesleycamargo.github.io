+++
title = "Improving the quality of your Azure environment with PowerShell PSRule"
date = 2026-01-03T18:02:22+00:00
draft = true
categories = ["Technology", "Development", "Azure"]
tags = ["blog", "azure", "powershell", "psrule", "devops"]
+++

## You are Testing in production and I can prove it: Testing your infrastructure with PowerShell PSRule 

Software development practices were already mature when I was a Developer, a looong time ago. Since when I moved to DevOps area, I have been advocating in applying the same principes to grow the maturity of infrastructure as well. 

Pester is definitely an excellent tool to achieve that, but recently I have started to work with PSRule, and I would like you to know the potential of it 🙂.

### What's is PSRule

In a very short explanation: PSRule is a policy-as-code open-source tool created by Microsoft. 

Ok, but how does it differs from traditional Azure Policies that can be deployed as code as well?

The main difference, and the main advantage in my opinion, is that you can use PSRule to validate if your infrastructure code is compliant with your organization definitions before you try to deploy it, instead of figuring out that your definitions are failing during the deployment. 

It doesn't replace Azure Policies, but complement it, with even the possibility to use your deployed policies to assert the code being validated.

In other words, you can shift left governance!


### How to install?

### Evaluating Azure Bicep files with PSRule


