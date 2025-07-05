+++
title = "Enviando pacotes Nuget .Net Core para o Azure Artifacts"
date = 2020-05-08T00:40:29+02:00
draft = false
categories = ["Technology", "Development", "Azure"]
tags = ["blog", "medium-import", "azure"]
image = "/img/enviando-pacotes-nugetanet-core-para-o-azure-artifacts/1_IBa82AI5wwkn7GyNuVf4lw.png"
+++

### Enviando pacotes Nuget .Net Core para o Azure Artifacts

Aprenda como publicar packages nuget no Azure Artifacts!

Para podermos ter maior reusabilidade dentro de nossa empresa, é interessante a utilização de pacotes compartilhados. No caso do .net, tanto core como standart utilizam o Nuget como Gerenciador de pacotes.

Nesse post irei ensinar passo a passo para realizar a publicação manual de um pacote nuget.

Ao longo do post irei detalhar cada um deles, mas abaixo estão todos os comandos executados no terminal:

Agora vamos botar a mão na massa!

#### Criando e configurando a aplicação

Vamos iniciar criando uma aplicação do tipo class library no .net core. Para isso digite no terminal (se você não tem familiaridade com o .net core [nesse post](https://medium.com/@camargo.wes/criando-um-pipeline-de-ci-cd-usando-github-actions-645a5199f650) ensino como criar uma aplicação web no VS Code):

dotnet new classlibO projeto criado é bem básico, possuindo apenas um .csproj e uma classe. Renomeie a classe para Math e adicione o código abaixo:

Vamos empacotar o projeto em um nuget package executando o comando:

dotnet packSerá criado um arquivo nupkg na pasta bin. Usaremos ele mais tarde.

![Image](/img/enviando-pacotes-nugetanet-core-para-o-azure-artifacts/1_IBa82AI5wwkn7GyNuVf4lw.png)

Para enviar novos pacotes precisamos realizar a conexão da nossa aplicação com o feed que vamos criar. Vamos então adicionar um arquivo nuget.config em nosso projeto. No terminal digite:

dotnet new nugetconfigSerá criado um arquivo em nosso projeto como este:

![Image](/img/enviando-pacotes-nugetanet-core-para-o-azure-artifacts/1_WmvMZY1rk6UHFa3sTIp-dQ.png)

O feed configurado é o padrão, para adicionar as configurações do nosso feed, vamos criá-lo e obter as conexões.

#### Criando o feed de artefatos no Azure Artifacts

Acesse sua conta do Azure DevOps e siga os passos abaixo:

![Image](/img/enviando-pacotes-nugetanet-core-para-o-azure-artifacts/1_pqzB4BtIR_fJZXV3Guv6BA.png)

![Image](/img/enviando-pacotes-nugetanet-core-para-o-azure-artifacts/1_FDgHA8bxqbOuQvbLXAIOOg.png)

Na tela que irá aparecer clique em Connect to feed:

![Image](/img/enviando-pacotes-nugetanet-core-para-o-azure-artifacts/1_59mH-OrThLhu6a8MZe3SDQ.png)

![Image](/img/enviando-pacotes-nugetanet-core-para-o-azure-artifacts/1_srWBBdJZy5XlebE27MuQyA.png)

Aqui estão as informações de conexão que iremos utilizar. Copie o conteúdo de Project setup e substitua o valor do arquivo nuget.config que criamos.

![Image](/img/enviando-pacotes-nugetanet-core-para-o-azure-artifacts/1_dQIXu0zg95Qtpn2EfuEMyA.png)

#### Conectando ao feed

Para realizar a conexão, precisamos baixar um provider. Para isso abre uma nova janela no VS Code e copie o conteúdo do arquivo abaixo salvando como CredentialProvider.ps1 e execute:

Agora que foi instalado o Credential Provider vamos conseguir autenticar no Azure DevOps. Na seção anterior em Publish packages é disponibilizado um comando copie ele e não se esqueça de adicionar o parâmetro **interactive**. Ele serve para iniciar uma sessão no browser e realizar a autenticação. Sem ele o comando não irá funcionar.

dotnet nuget push .\bin\Debug\NugetPackage.1.0.0.nupkg --source "MeuFeed" --api-key teste --interactiveCopie e abra no browser a URL que será fornecida e copie o código:
