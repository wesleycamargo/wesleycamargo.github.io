+++
title = "Criando um pipeline de CI/CD usando GitHub Actions"
date = 2020-05-02T02:02:18+02:00
draft = false
categories = ["Technology", "Development", "DevOps"]
tags = ["blog", "medium-import", "devops"]
image = "/img/criando-um-pipeline-de-cicd-usando-github-actions/1_ui0WEO_7OKSGgN2M9PbE4A.png"
+++

### Criando um pipeline de CI/CD usando GitHub Actions

Nesse post vou demonstrar como criar uma aplicação DotNet core, versionar no GitHub, criar um workflow usando Actions e realizar deploy no Azure.

Para acompanhar esse tutorial, você vai precisar de:

- Visual Studio Code - Pode ser baixado [aqui](https://code.visualstudio.com/download)
- DotNet Core SDK - Pode ser baixado [aqui](https://dotnet.microsoft.com/download)
- Uma conta no GitHub
- Uma conta no Azure

Todos os comandos realizados localmente estão no arquivo abaixo, mas irei explica-los um a um no decorrer do post

### Criando a aplicação

Após cumpridos os pré reqs, abra o VS Code, vá em Open folder e selecione uma pasta vazia para criarmos o projeto:

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_ui0WEO_7OKSGgN2M9PbE4A.png)

Agora vá no menu superior vá em **Terminal **-> **New Terminal **ou pressione *ctrl + ‘,isso irá abrir um terminal na parte inferior da tela. Para verificar a versão do sdk instalada clique nele e digite:*

dotnet --version*No meu caso estou utilizando a versão 3.1.201, caso tenha algum problema durante a execução do tutorial e esteja utilizando uma versão diferente, utilizar essa versão pode te ajudar.*

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1__AAY-oPkIg9HbrwnsizM1A.png)

Agora para criarmos o projeto digite

dotnet new webappEsse comando irá criar a estrutura da nossa aplicação que nada mais é que um site web baseado em MVC:

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_WsYhHE1qwFyFqYPkK4QQbA.png)

Repare que serão criados alguns arquivos na pasta que selecionamos no início. Eles podem ser vistos no menu Explorer ao lado esquerdo da tela

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_7qaqJxH-XhLcJ7imGQjFnQ.png)

Para verificar se tudo está ok com a aplicação, digite no terminal

dotnet runIsso irá compilar e iniciar a aplicação. Aqui também pode ser verificado em qual porta está rodando e acessar para testar

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_KRkXlY-zDc8Y3KFVqLac2A.png)

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_Yoclb52yTys4elRfRX_NpA.png)

Agora que temos uma aplicação rodando, podemos seguir para a etapa de versionamento.

Para mais informações sobre comandos do dotnet core veja o conteúdo deste link [https://docs.microsoft.com/pt-br/dotnet/core/tools/](https://docs.microsoft.com/pt-br/dotnet/core/tools/)

### Adicionando ao GitHub / controle de versão

Antes de enviar nosso código ao GitHub, primeiro precisamos versionar localmente. Antes de realizar esse versionamento, vamos criar um arquivo chamado *.gitignore*, onde iremos informar ao git, quais arquivos não queremos que sejam enviados, como binários por exemplo. O próprio dotnet Core possui um template pronto, onde automaticamente são adicionados os arquivos que não queremos versionar. No terminal digite:

dotnet new gitignore

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_890wNaAHuUov2HuWgO-GMA.png)

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_MZv9nGPc9QVfguqERWvPHg.png)
1. Inicializando nosso repositório e adicionando todos os nossos arquivos para a área de staging.

git init

`ash
git add .
git status
`

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_3pibD-rKZP1PS1xljNecaQ.png)

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_cRNA_rHAGGtS7UaFS_no9g.png)
Realizando commit das alterações

git commit -m "commit inicial"

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_HVKSn9IVa6DSs-r3BaU0Sw.png)
Até agora todas as operações que realizamos foram locais. Para enviarmos o código para o GitHub, primeiro precisamos criar um repositório. Acesse sua conta no GitHub e siga os passos abaixo:

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_HIljyNTqWb0jVrH3qQrgfg.png)

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_K4JZxUpaEpX6datV035Taw.png)

Como já temos um repositório criado, copie o código da opção abaixo, cole e execute no terminal:

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_t746pMFDe4DWlKE1faIoGQ.png)

git remote add origin [https://github.com/wesleycamargo/Pipeline-CICD.git](https://github.com/wesleycamargo/Pipeline-CICD.git)
git push -u origin master

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_Y3JwSEl19oSZZ-lM3OvteA.png)
Ao atualizar a página do repositório nosso código já estará lá

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_5efmdYAQl8YQiFN28POzoA.png)

### Criando Action de CI

Na tela anterior clique em Actions, o GitHub deverá identificar que o código da aplicação foi escrito em .NET Core e irá sugerir um template de workflow. Pode selecioná-lo:

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_ywXMxJH3-1_g0QjONb_dRg.png)

Na tela seguinte será apresentado um arquivo .yml. Nesse momento vamos mante-lo assim, realizando o commit na branch master:

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_knrDZXqVK36ev1z3G0tZNQ.png)

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_4gjYy7uBYpbqgLzEyz1q7Q.png)

Será criada uma pasta .github/workflows no seu repositório, nela será adicionado um arquivo com o conteúdo abaixo:

Agora você será redirecionado para a parte de código. Clique novamente em Actions e você irá notar que foi criado um workflow e ele já foi iniciado automaticamente. Clique no evento que foi acionado e no build conforme as imagens:

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_dz7AYBXgKaNs4oFZNTcjlA.png)

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_3U66s-lKGpwX3IhBfTWk4g.png)

Observe que é possível visualizar o log da execução do build.

Já temos um build realizando a Continuous Integration(CI) de nossa aplicação.

### Adicionando Azure Web App Publish Profile ao GitHub

Vá a um Web App já existente no portal do Azure e clique em Get publish profile.

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_3majHLs0wenSKihXcJz1_g.png)

Será realizado o download de um arquivo com a extensão .PublishSettings. Copie o conteúdo dele.

No GitHub, vá às configurações para adicionar como Secret:

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_NcJ8M45gPkf_Gri9_b6xCA.png)

Nomeie como AZURE_WEBAPP_PUBLISH_PROFILE e em value adicione o conteúdo do arquivo .PublishSettings

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_4F2kuZv5VPXAyrfKlY5PLA.png)

### Publicando a aplicação no Azure

Para configurar o Continuous Delivery(CD) vamos realizar algumas alterações no arquivo yml. Eu acho um pouco difícil editar pela página web, então vou realizar um pull do meu repositório local e editar no VS Code, mas você pode fazer onde for melhor para você =).

Primeiro vamos substituir o código anterior por um código mais enxuto e com uma nova função: *publish. *Vamos adicionar também uma task para realizar o upload dos artefatos gerados:

Aqui também adicionamos variáveis de ambiente para nossa aplicação. Altere os valores de WebApp_Name e DotNet_Version para os valores de acordo com seu ambiente:

env:
AZURE_WEBAPP_NAME: webAppAction-wes
AZURE_WEBAPP_PACKAGE_PATH: '.'
DOTNET_VERSION: '3.1.201'Com a task para realizar o upload dos artefatos, podemos notar que após executar o build podemos baixá-los:

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_8yVX7O0LWDqV-I0JkRPl_w.png)

Ao final sua aplicação estará publicada em seu WebApp:

![Image](/img/criando-um-pipeline-de-cicd-usando-github-actions/1_qNyToH28zHlXZfy3uUravA.png)

Vou deixar aqui o link do repositório caso queiram visualizar: [https://github.com/wesleycamargo/Pipeline-CICD](https://github.com/wesleycamargo/Pipeline-CICD)

Valeu!
