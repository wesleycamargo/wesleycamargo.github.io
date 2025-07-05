+++
title = "Conectando WebApps a redes existentes"
date = 2018-08-05T00:38:24+02:00
draft = false
categories = ["Technology", "Development"]
tags = ["blog", "medium-import"]
image = "/img/conectando-webapps-a-redes-existentes/1_ooxS-JBEtmGsvRK8CnOofQ.png"
+++

### Conectando WebApps a redes existentes

Em algumas situações quando utilizamos WebApps pode ser necessária a comunicação com algum recurso já existente em nossa rede, como por exemplo um banco de dados IaaS, uma API, ou até mesmo um outro WebApp.

A maneira mais simples de realizar essa comunicação é através da internet, mas, apesar de ser mais fácil isso pode expor sua aplicação a vários riscos de segurança, como invasões, roubos de dados, etc.

Para solucionar esse problema, o Microsoft Azure possui um recurso chamado VNet Integration, que permite a conexão de um WebApp a uma rede existente.

Agora irei demonstrar como realizar a conexão:

### Criando a Virtual Network (VNet)

Se você já possuir uma VNet pode pular para a próxima etapa. Para a criação não existem muitos segredos, a VNet pode seguir as configurações padrão sugeridas:

![Image](/img/conectando-webapps-a-redes-existentes/1_ooxS-JBEtmGsvRK8CnOofQ.png)

Após a criação da VNet, precisamos criar um VNet Gateway, que será utilizado para realizar uma conexão VPN Point to Site (P2S) do seu WebApp para a sua VNet, para isso é necessário adicionar uma subnet exclusiva para gateways. Vá em “Subnets” e clique em “Gateway subnet”:

![Image](/img/conectando-webapps-a-redes-existentes/1_7g8AWHV9rkU0BHSXzeUylw.png)

Repare que a subnet é nomeada automaticamente, isso acontece pois no momento da criação do VNet Gateway ele irá buscar por esse nome:

![Image](/img/conectando-webapps-a-redes-existentes/1_VVxUnVXtCI7GtggN4N7tGw.png)

![Image](/img/conectando-webapps-a-redes-existentes/1_iEBQdhcwJHe9fHv6fQ7RHw.png)

Com a subnet criada, vamos à criação do Gateway.

### Criando o Virtual Network Gateway

Em Gateway type selecione “VPN”, em VPN type “Route-based” e em Virtual network, escolha a VNet criada:

![Image](/img/conectando-webapps-a-redes-existentes/1_OHq0fdZ5KgQz9u_uyw5Egg.png)

Essa etapa pode ser um pouco demorada, no geral demora em torno de 30 minutos para a criação do gateway.

Após criado vá em Point-to-site configuration, desabilite a opção IkeV2, e adicione a chave de um certificado do tipo CER. Este certificado será baixado automaticamente pelo WebApp para realizar a autenticação na VPN.

![Image](/img/conectando-webapps-a-redes-existentes/1_qW_53OBwgcWL5X8-LnYeWA.png)

Ao realizar a configuração do WebApp para a conexão do Gateway, você poderá receber a mensagem de erro abaixo dizendo que o protocolo IkeV2 não é compatível, certifique-se que a opção está desabilitada conforme a imagem acima.

![Image](/img/conectando-webapps-a-redes-existentes/1_sFY7BaCwYIsmSA2p8p5sDQ.png)

### Conectando o WebApp

Assim como a VNet, caso já possua o WebApp vá para o próximo passo. Caso ainda não tenha, pode manter as configurações padrão.

Vá em networking e em VNet Integration clique em Setup, e depois escolha a VNet que possui o VNet Gateway:

### Problemas comuns

Outro problema muito comum, é o certificado estar fora de sincronia:

![Image](/img/conectando-webapps-a-redes-existentes/1_1rF5SbrpU3k9CumNYthJog.png)

Para resolver isso, vá ao Service Plan do seu WebApp, e force o sincronismo:

![Image](/img/conectando-webapps-a-redes-existentes/1_iKviBxXJs-5p_JRs0layHw.png)

![Image](/img/conectando-webapps-a-redes-existentes/1_WjGMewg60baKDTdT2CbVsw.png)

Após esses passos seu WebApp será capaz de acessar os recursos da sua rede!

![Image](/img/conectando-webapps-a-redes-existentes/1_vatVLsT-KnKJyuxXyfkHHQ.png)

Abraço!

*Originally published at *[*wesleycamargo.com.br*](http://wesleycamargo.com.br/2018/08/04/conectando-webapps-a-redes-existentes/)* on August 18, 2018.*
