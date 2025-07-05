+++
title = "How to suppress warning and error messages in Azure CLI"
date = 2021-12-20T09:02:01+01:00
draft = false
categories = ["Technology", "Development", "Azure"]
tags = ["blog", "medium-import", "azure"]
image = "/img/how-to-suppress-warning-and-error-messages-in-azure-cli/0_CRHG3CI34LabcOV4.jpeg"
+++

### How to suppress warning and error messages in Azure CLI

#### In Azure CLI some commands can return errors and warning messages, which can cause troubles on your script, so check out how to suppress it

![Image](/img/how-to-suppress-warning-and-error-messages-in-azure-cli/0_CRHG3CI34LabcOV4.jpeg)
Photo by [Muhammad Daudy](https://unsplash.com/@ahsanjaya?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/warning?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

### How to suppress warnings on Azure CLI

#### Command group is in preview and under development

In some cases the CLI used can be under development and show the message: `Command group is in preview and under development. Reference and support levels: [https://aka.ms/CLI_refstatus](https://aka.ms/CLI_refstatus)`

At the moment that I am writing this post, the az devops CLI variable-group for example is always returning the message above, which have been causing troubles and breaking my pester tests :)

![Image](/img/how-to-suppress-warning-and-error-messages-in-azure-cli/0_SHfQUJPYn9MuJ-i3.png)
Photo prepared by author

#### Quiet mode on Azure CLI

For Azure CLI, the simplest way to make the commands “quiet” is by adding the global parameter `--only-show-errors` in your command. **It will suppress only the warnings **and keep the message in case you have any errors during the execution.

So in our example for `az pipelines variable-group` our command will be like this:

`ash
az pipelines variable-group list --org $organization -p $project --only-show-errors
`

### How to suppress errors on Azure CLI

In some cases, you may need to also suppress the errors during your script execution and there is one more option for it. I would recommend this approach only if you really do not care if something went wrong during your script execution.

### Redirecting the console output STDERR

A common scenario to redirect streams is when the symbol `>` is used to write the output of the command in a file. It redirects the standard output - STDOUT - to the file added as a parameter.

In the situation that is necessary to suppress the errors, we need to redirect the output of the error stream — STDERR.

To do it you simply need to add `2>nul` after the CLI command, which means that the second stream (STDERR) will be redirected to `null` .

So in our example for `az pipelines variable-group` the command will be:

`ash
az pipelines variable-group list --org $organization -p $project 2>nul
`

### Conclusion

Although this topic looks simple, sometimes it’s not so easy to find this information in the documentation, especially regarding the error suppressing topic, and also the comparison of both approaches is not documented.

I grouped both, how to suppress warnings and errors in one place, so would be to choose which option suits better in each scenario.

### References

[Redirecting error from Command Prompt — Visual C++ | Microsoft Docs](https://docs.microsoft.com/en-us/troubleshoot/cpp/redirecting-error-command-prompt)

[https://github.com/Azure/azure-cli/issues/13384](https://github.com/Azure/azure-cli/issues/13384)
