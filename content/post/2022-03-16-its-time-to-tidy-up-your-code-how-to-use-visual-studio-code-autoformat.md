+++
title = "It’s time to tidy up your code: How to use Visual Studio Code Autoformat"
date = 2022-03-16T12:25:13+01:00
draft = false
categories = ["Technology", "Development"]
tags = ["blog", "medium-import"]
image = "/img/its-time-to-tidy-up-your-code-how-to-use-visual-studio-code-autoformat/1_N_tA9AjjjsJm1w_h2pPghQ.jpeg"
+++

### It’s time to tidy up your code: How to use Visual Studio Code Autoformat

![Image](/img/its-time-to-tidy-up-your-code-how-to-use-visual-studio-code-autoformat/1_N_tA9AjjjsJm1w_h2pPghQ.jpeg)
Photo by [Jozsef Hocza](https://unsplash.com/@hocza?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/broom?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

If you are like me and like to have consistency in formatting your code, this is definitely a must to have configuration.

By default, you can use VS code formatters with the shortcut `Alt+Shift+F` but, you can also configure it to format every time you save your file, like this:

![Image](/img/its-time-to-tidy-up-your-code-how-to-use-visual-studio-code-autoformat/1_BGAaZ9S8L34Ju1fHOxV56Q.gif)

### How to enable autoformat on Visual Studio Code

There are two options to enable autoformat by UI and editing settings.json file, let’s check both:

#### How to edit autoformat option on VS Code User Interface

Open the menu `File->Preferences->Settings` and under Text Editor look for `Formating` and enable the option `Format On Save` choosing which option is better on `Format On Save Mode` .

If you’re using version control, you can choose to format changes only, this is particularly useful if you’re working on legacy code and don’t want to change a large file at once. For this option choose `modificationsIfAvailable` .

![Image](/img/its-time-to-tidy-up-your-code-how-to-use-visual-studio-code-autoformat/1_wet4EZdGEKs4L2FqZathyg.png)

#### How to edit autoformat option on VS Code settings.json

To find settings.json file, open your Visual Studio Code and press F1:

![Image](/img/its-time-to-tidy-up-your-code-how-to-use-visual-studio-code-autoformat/1_6e0UH_No8bBsxSamdTcy2A.png)

Now type `settings.json `, open the file and add the section:

For the configuration`Format On Save Mode` you can pick of the of the options below:

- file
- modifications
- modificationsIfAvailable

This is how your file should look like:

![Image](/img/its-time-to-tidy-up-your-code-how-to-use-visual-studio-code-autoformat/1_NFY7b7pWnYaRY68q3Tsheg.png)

This configuration applies to most part of the supported languages, like PowerShell, JSON, C#, and others.

### How to autoformat Terraform files on Visual Studio Code

Although the configuration above works for most languages if you are using terraform you need additional configurations. The plugin also doesn’t have a UI for it, so we need to add the configuration manually in the file settings.json.

To do it, open again the `settings.json` file and add the following sections:

Pay attention that you must add one section for Terraform, and one more for terraform-vars.

This is the final file:

![Image](/img/its-time-to-tidy-up-your-code-how-to-use-visual-studio-code-autoformat/1_61hu0VbbIpGNiVOXYJz29w.png)

### Conclusion

Autoformatting is an easy and helpful option that will for sure help your team to have consistency and keep your codebase tidy and clean.

See you in the next post!
[

![Image](/img/its-time-to-tidy-up-your-code-how-to-use-visual-studio-code-autoformat/1_BCiLLad3dvZLwBa-B5cAVQ.png)
](https://faun.to/bP1m5)

Join FAUN: [**Website**](https://faun.to/i9Pt9)** **💻**|**[**Podcast**](https://faun.dev/podcast)** **🎙️**|**[**Twitter**](https://twitter.com/joinfaun)** **🐦**|**[**Facebook**](https://www.facebook.com/faun.dev/)** **👥**|**[**Instagram**](https://instagram.com/fauncommunity/)** **📷|[**Facebook Group**](https://www.facebook.com/groups/364904580892967/)** **🗣️**|**[**Linkedin Group**](https://www.linkedin.com/company/faundev)** **💬**|** [**Slack**](https://faun.dev/chat) 📱**|**[**Cloud Native** **News**](https://thechief.io)** **📰**|**[**More**](https://linktr.ee/faun.dev/)**.**

**If this post was helpful, please click the clap 👏 button below a few times to show your support for the author 👇**
