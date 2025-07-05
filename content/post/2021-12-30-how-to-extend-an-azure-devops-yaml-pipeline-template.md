+++
title = "How to extend an Azure DevOps YAML Pipeline Template"
date = 2021-12-30T17:28:36+01:00
draft = false
categories = ["Technology", "Development", "Azure", "DevOps"]
tags = ["blog", "medium-import", "azure", "devops"]
image = "/img/how-to-extend-an-azure-devops-yaml-pipeline-template/1_8JQMH109KuJHKrUubmjxqA.jpeg"
+++

### How to extend an Azure DevOps YAML Pipeline Template

If you need to control what is allowed during your deployment, extending the YAML Templates is the easiest way to know what is being done on your deployments.

![Image](/img/how-to-extend-an-azure-devops-yaml-pipeline-template/1_8JQMH109KuJHKrUubmjxqA.jpeg)
Photo by [Zonduurzaam Deventer](https://unsplash.com/@zonduurzaam?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/power-strip?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

### Azure DevOps YAML Templates

YAML Templates are the smartest way to create your pipelines. It allows you to break down the pipelines into small pieces reusing your logic, which leads to some best practices as *Don't Repeat Yourself *and* Dependency Inversion.*

It’s also possible to use the *Declarative *instead of the *Imperative* approach, therefore who will consume your pipelines does not need to know the details of how to deploy an application, but just say what is necessary to deploy.

With these principles being correctly applied, it is possible to build a reliable and robust way to deploy new applications, but who will consume it doesn’t need to be a DevOps expert.

### Creating an Azure DevOps YAML Templates

#### Parameters on Azure DevOps YAML Templates

On top of the template, the first section is `parameters` . As our goal is to make the templates reusable, makes complete sense to have a way to change values according to which application is consuming the template. To keep it simple in this example, it was parametrized the application name.

`ash
parameters:
  - name: applicationName
    type: string
`

#### Stages on Azure DevOps YAML Templates

To have an extendible template, it must be created on the level of the stages. This example has two of them, one for build and one more for development environment. 
Below you can check the full template script:

### Extending Azure DevOps YAML Templates

#### Configuring triggers on Azure DevOps YAML Templates

On top of the consumer file, in our case `azure-pipelines.yml` , we need to declare the triggers of the pipeline. It is mandatory to include at least one value for branch(it can be * if needed), or `none` . You can also set the path where your files are, and your pipeline will run only when those files change.

`ash
trigger:
  branches:
    include:
      - main
      - develop
  paths:
    include:
      - src/*
`

#### Referencing Azure DevOps YAML Templates

To extend a template, you need to provide the relative path for your template file. In this example, there is a `templates` directory with the file `template.yml` so on the consumer file, it’s necessary to provide the template path in the format `./templates/template.yml` `.`

![Image](/img/how-to-extend-an-azure-devops-yaml-pipeline-template/1_PKHTHZN9K5hkDjgXRZ7mzQ.png)
Image prepared by author

We also need to provide the parameter defined in our template. To this, you just need to add the parameters section right below the template, the name of the parameter, and of course, the value for it. Below there is the complete “consumer” file.

### Conclusion

In this post, I introduced the basic concepts of how to extend Azure DevOps YAML Pipelines. This is easy to implement but can yield good fruits in future implementations.

In future articles, I will deep dive into this subject and show the full potential of this approach :).
