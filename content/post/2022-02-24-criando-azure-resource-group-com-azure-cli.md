+++
title = "Criando Azure Resource Group com Azure CLI"
date = 2022-02-24T18:26:54+01:00
draft = false
categories = ["Technology", "Development", "Azure"]
tags = ["blog", "medium-import", "azure"]
image = "/img/criando-azure-resource-group-com-azure-cli/1_cilM3e42GLTP7Tod8bXeQg.jpeg"
+++

### Criando Azure Resource Group com Azure CLI

O Azure CLI é uma interface de linha de comando para o Azure. Ele pode ser usado com PowerShell ou em bash, com ele é possível criar recursos, resource groups, executar ações no Azure entre outras coisas. Aqui vou mostrar os comandos básicos para conectar ao Azure utilizando o Azure CLI e como criar um resource group.

![Image](/img/criando-azure-resource-group-com-azure-cli/1_cilM3e42GLTP7Tod8bXeQg.jpeg)
Photo by [Milad Fakurian](https://unsplash.com/@fakurian?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

No vídeo abaixo é possível acompanhar todo o processe de conexão ao Azure e criação do Resource Group usando Azure CLI. Após o vídeo estão os comandos utilizados e um breve resumo sobre seu uso.

### Como conectar ao Azure com Azure CLI

#### Azure CLI - comandos para Account

Abaixo estão todos os comandos utilizados para realizar login e configurar a Azure Subscription para ser utilizada

Agora vamos ver os detalhes de execuçao dos comandos:

`az -h` — Lista os comandos disponíveis no Azure CLI

![Image](/img/criando-azure-resource-group-com-azure-cli/1_xtFjXLBbgrQw6IOTLT5HZA.png)

`az login`- Abre a página de login no browser para selecionar a conta que será conectada

![Image](/img/criando-azure-resource-group-com-azure-cli/1_cFaJ-sa-gDYIgWNEKGGXOA.png)

`az account list` - Lista as subscription disponíveis
`az account set -subscription` - Seleciona a subscription que será usada
`az account show` - Exibe as informações da subscription atual

![Image](/img/criando-azure-resource-group-com-azure-cli/1_UXnIG5vzHh8dZ51X44rqtw.png)

### Como criar um Azure Resource Group com Azure CLI

#### Azure CLI — comandos para Resource Group

`az group -h` - Lista os comandos disponíveis para Resource Groups
`az group create -h` - Lista os argumentos necessários para criar um Resource Group

![Image](/img/criando-azure-resource-group-com-azure-cli/1_q9u4264fwYxWQQ2l2ieLEA.png)

`az group create --location -–name` - Cria um Resource Group

![Image](/img/criando-azure-resource-group-com-azure-cli/1_ZKz9LJWr6lrBvZFPGKMJjA.png)

`az group list --output table` - Lista Resource Groups da subscription em formato de tabela

![Image](/img/criando-azure-resource-group-com-azure-cli/1_ru6Eh_JTfYgz9ooYcZqZ6w.png)

`az group delete --name`- Apaga o Resource Group
