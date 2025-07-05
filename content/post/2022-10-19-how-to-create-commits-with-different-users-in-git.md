+++
title = "How to create commits with different users in git"
date = 2022-10-19T23:12:09+02:00
draft = false
categories = ["Technology", "Development"]
tags = ["blog", "medium-import"]
image = "/img/how-to-create-commits-with-different-users-in-git/1_fLG0WrzYU-ZuAkqAKqT__A.jpeg"
+++

### How to create commits with different users in git

In my previous [post](https://faun.pub/how-to-setup-your-environment-with-git-and-vs-code-with-choco-23d90f598d24), I showed among other stuff how to configure your git credentials. But in case you need to use different users in different projects or repositories, you need to be sure that your commits are using the correct credentials. Check on this post how to configure it properly and stop messing up your repos ;)

![Image](/img/how-to-create-commits-with-different-users-in-git/1_fLG0WrzYU-ZuAkqAKqT__A.jpeg)
Photo by [Yancy Min](https://unsplash.com/@yancymin?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/@yancymin?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

I know a lot of people that already made a commit using the wrong credentials in either work or personal repos. Having to remember to configure this in every new repository is not the best way to do that.

For this, we can use [Conditional Includes](https://git-scm.com/docs/git-config#_conditional_includes) when creating our config file. This is a bit more complex than just setting the user and email, but it will help you to avoid a lot of work, in case you need to rewrite your commit history later :).

### Understanding the git configuration

The git configuration is used to introduce customized behaviors on git and it has three different scopes of settings:

- **System **— In this scope, the settings are applied to all users and all repositories. To edit this scope use the parameter `--system` . To verify which configurations are in the system scope, type the command `git config --system -l`
- **Global **— This is the user scope, where it is possible to customize settings using the parameter `--global` , and it is applied to all repositories of that user. The global configuration file sits in the user directory on your computer.
- **Local**— Each repository can also have its own customized settings. It is possible to find the configuration file in the git directory inside each repository `./.git/config` , or it is also possible to check with the parameter`--local` .

The lower the scope, the higher the priority, so it means that the local scope overrides the global scope, and the global overrides the system scope. With that said, the precedence is in the following order: **System**> **Global **> **Local**

It is possible to trace back from where the configuration is coming from: `git config -l --show-origin`

![Image](/img/how-to-create-commits-with-different-users-in-git/1_Y_rGL86RNTws8Z7qeAD59Q.png)
Different scopes of configuration — Image by author

In our case, we will play around with the user's configurations. These configurations are stored in a file `.gitconfig` that sits in your user directory, as mentioned above. To easily access it, you can type `~/.gitconfig` in your terminal and you will be able to see something similar to this:

### Creating the conditional includes in gitconfig

For each user we want to use, it is necessary to create a separate folder, where the repositories will sit. This is because we will use the directory that git specifies in its configuration to identify where we are. In my example, I will configure my global email, which will be used for all repositories, except those under the folder `c:\repos\work` .

![Image](/img/how-to-create-commits-with-different-users-in-git/1_rW4Zp3L7W8fYOY94dmpV5w.png)

With our work repositories under the correct folder, we need to create a specific configuration file for that “profile”. You can type the command `echo [user] > ~/work.gitconfig`to create it under your user directory. After creation, populate with needed information for the profile, as per below:

After creating the `work.gitconfig` file, in your main file (`.gitconfig`), include the `[includeIf]` session. The command `gitdir/i` will return the directory of your repository, and if it matches the directory that you specified, it will load the `work.gitconfig` .

### Concluding…

This configuration is quite simple, but can be very helpful if you work in many projects simultaneously . I hope it can help somehow and see you in the next post!

![Image](/img/how-to-create-commits-with-different-users-in-git/0_nTpwFrWVp057bnqw.png)

If you find this helpful, please click the clap 👏 button below a few times to show your support for the author 👇

### 🚀[Join FAUN & get similar stories in your inbox each week](http://from.faun.to/r/8zxxd)
