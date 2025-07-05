+++
title = "Make your deployment faster parallelizing your jobs in Azure DevOps - Classic Editor"
date = 2020-06-05T22:27:53+02:00
draft = false
categories = ["Technology", "Development", "Azure", "DevOps"]
tags = ["blog", "medium-import", "azure", "devops"]
image = "/img/make-your-deployment-faster-parallelizing-your-jobs-in-azure-devops-classic-editor/1_3cUlED971rCD_21ltjnMcQ.png"
+++

### Make your deployment faster parallelizing your jobs in Azure DevOps - Classic Editor

One of the most regular works in clients or companies that I faced, is to improve your existing CI/CD pipelines, reducing errors or the time run. In this post, I’ll show how to configure your jobs using multi-configuration.

#### When do I have to use this?

I’ll use as a didactic example an application with two projects: an API and a Web Site. This maybe can be a simple example, but you can find a better use for this approach in your day-to-day activities, ideally with tasks that take a long time to execute, as creating resources like Virtual Machines, Web Apps, or any other operations. **The greater advantage is that if you have one job or ten, it will take just the time for one execution.**

Below you can see a representation of the process. Notice that we have two Web App deployments serialized. However maybe you can have many processes, and if you have to wait for all of them, it can have a long time-consuming.

![Image](/img/make-your-deployment-faster-parallelizing-your-jobs-in-azure-devops-classic-editor/1_3cUlED971rCD_21ltjnMcQ.png)

Otherwise, create a parallel activity approach, as you can see in the next image, you can save a lot of time just doing a simple configuration.

![Image](/img/make-your-deployment-faster-parallelizing-your-jobs-in-azure-devops-classic-editor/1_oGXCq1fM6O8MzJ5jPqUq8A.png)

#### Configuring the CD pipeline

I’ll use an existing build with two outputs: an API and a WebApp. The names used in the artifacts are important, we will use this later to define our application name. [Here](https://medium.com/@camargo.wes/creating-a-net-core-application-and-pushing-to-github-or-azure-repos-22c115dde3a9), I’ll show you how to create an application and send it to Azure DevOps.

![Image](/img/make-your-deployment-faster-parallelizing-your-jobs-in-azure-devops-classic-editor/1_sTwA07LJk9zKklF2u59tXQ.png)

Create a classic CD pipeline for WebApp:

![Image](/img/make-your-deployment-faster-parallelizing-your-jobs-in-azure-devops-classic-editor/1_u0NLg8-CMJhc2SRj7HGAUw.png)

After creation, open the variables tab and create a new var named **application**.** **In the value enter the name of your artifacts split by a comma:

![Image](/img/make-your-deployment-faster-parallelizing-your-jobs-in-azure-devops-classic-editor/1_88PWuEkqzUz6zjGM0NIM2Q.png)

Go back to the Tasks tab and open the agent options. In item 3, notice that it has the same variable that we created before. Item 4 it’s how many parallel jobs you would like to run.

![Image](/img/make-your-deployment-faster-parallelizing-your-jobs-in-azure-devops-classic-editor/1__FvRmjyzQnPX3iz5EdlPWg.png)

To use the multi-configuration, your WebApps names need some pattern. Here, I created a suffix and the end of the name will be the artifact name (or the split variable):

![Image](/img/make-your-deployment-faster-parallelizing-your-jobs-in-azure-devops-classic-editor/1_aDFsdhjmSy2kkwLAydJ0WA.png)

Now let’s configure the WebApp options. This is easy, just configure according to your pattern using the variable name:

![Image](/img/make-your-deployment-faster-parallelizing-your-jobs-in-azure-devops-classic-editor/1_sgqtmxbEd72BvLqnyvdKGw.png)

Now, check if you have enough parallel jobs available in your account. The default’s it’s one parallel job for self-hosted and one Microsoft hosted agents, but if you have users with MSDN in their accounts, each one increases plus one parallel job. If you don’t have, you need to buy new parallel agents.

![Image](/img/make-your-deployment-faster-parallelizing-your-jobs-in-azure-devops-classic-editor/1_AoqHHoWjq_HnTFCWD3MYag.png)

#### Running and testing :)

After running our pipeline, we can see it’s working running in two parallel agents:

![Image](/img/make-your-deployment-faster-parallelizing-your-jobs-in-azure-devops-classic-editor/1_gg0HhZVjPrZkWtOHQVOokg.png)

After all, processes finished, we can see that’s done!

![Image](/img/make-your-deployment-faster-parallelizing-your-jobs-in-azure-devops-classic-editor/1_-Ari24iWsvnvWoF2hC6iuw.png)
