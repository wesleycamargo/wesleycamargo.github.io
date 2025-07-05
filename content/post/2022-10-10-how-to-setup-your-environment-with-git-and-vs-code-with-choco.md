+++
title = "How to setup your environment with git and VS Code with choco"
date = 2022-10-10T15:10:04+02:00
draft = false
categories = ["Technology", "Development"]
tags = ["blog", "medium-import"]
image = "/img/how-to-setup-your-environment-with-git-and-vs-code-with-choco/1_fLG0WrzYU-ZuAkqAKqT__A.jpeg"
+++

### How to setup your environment with git and VS Code with choco

Configuring your git environment is something very important to begin using version control. In this post, I will show you, step by step, how to install and configure git correctly and also how to use Visual Studio Code as a default editor, And at the end of the post, there are the full scripts to help you set up your environment, **with a bonus **in it ;).

![Image](/img/how-to-setup-your-environment-with-git-and-vs-code-with-choco/1_fLG0WrzYU-ZuAkqAKqT__A.jpeg)
Photo by [Yancy Min](https://unsplash.com/@yancymin?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/git?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

### How to install git and Visual Studio Code with PowerShell and Choco

#### How to install Chocolatey with PowerShell

Before we proceed with git and VSCode, first we need to install the Chocolatey. [Chocolatey](https://community.chocolatey.org/), or simply Choco, is a package installer designed for work with PowerShell.

The easiest way to install choco is by running a PowerShell script in your terminal. Below I have prepared a script that calls the official Choco script on its site:

### How to install git on Windows using choco

After installing Choco, we will be able to install the git package available there. To install, the command is very straightforward as we can see below (might be necessary to run the command with administrative privileges):

After the installation, check if git was correctly installed with the command `git -v` :

![Image](/img/how-to-setup-your-environment-with-git-and-vs-code-with-choco/1_n_lAcHewgubjgsb-KeoXLw.png)

If you receive an error saying that git is not installed, close and reopen your terminal, it will reload the environment variables with the correct git path.

### How to install Visual Studio Code with choco and PowerShell

As well we saw to install git, the command to install VSCode with choco and PowerShell is also very simple:

To check the installation, use the command `code -v` . Again, in case of any problem, close and reopen your terminal.

### How to setup git credentials

#### How to setup git username and email

To associate your identity with your commits, it is necessary to define your git user name and email. You can configure it in different scopes, below we can see how to configure it globally:

### How to setup Visual Studio Code as the default git editor

The default editor for git is nano. Personally, I prefer VS Code, as it has several extensions that can improve productivity. In the script below, we are setting up the VSCode as the default tool for the command diff and merge and also as the default editor:

### How to install and configure Git and VS Code with PowerShell Script

#### Installation

To install all necessary tools, you can simply run the script below. Might be necessary to have administrator permissions for that. In the first 6 lines, the script installs choco, and then uses choco to install git and vscode:

#### Configuration

After installing the tools, you may need to reload your terminal, as I said above, so to make it easier I created two different scripts 😉. As a **Bonus,** I also added an alias to a command `git lg`, which is an alias for `git log` , but using prettier options. You can check more about it on this post [Creating a pretty git log](https://faun.pub/creating-a-pretty-git-log-61f312f45201):

### Conclusion

Source control is the basis of any DevOps process, and git is currently the most used tool for it. Using the right configuration together with VS Code will help to start this journey!

### References

[Git — Installing Git (git-scm.com)](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

[Chocolatey Software Docs | Chocolatey — Software Management for Windows](https://docs.chocolatey.org/en-us/)

![Image](/img/how-to-setup-your-environment-with-git-and-vs-code-with-choco/0_3ahp0-lW18WfoBhc.png)

If you find this helpful, please click the clap 👏 button below a few times to show your support for the author 👇

### 🚀[Join FAUN & get similar stories in your inbox each week](http://from.faun.to/r/8zxxd)
