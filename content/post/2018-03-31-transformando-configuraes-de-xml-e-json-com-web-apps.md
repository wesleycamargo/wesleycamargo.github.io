+++
title = "Transformando configurações de XML e JSON com Web Apps"
date = 2018-03-31T02:05:53+02:00
draft = false
categories = ["Technology", "Development"]
tags = ["blog", "medium-import"]
image = "/img/transformando-configuraes-de-xml-e-json-com-web-apps/1_BD0EV8VzKpc9o7qG8R9XLg.png"
+++

### Transformando configurações de XML e JSON com Web Apps

Em um post anterior demonstrei como gerenciar configurações utilizando Azure Key Vault ([clique aqui ](https://medium.com/@camargo.wes/gerenciando-transformacoes-de-configuracao-com-azure-key-vault-e-vsts-434bc1b26cd8)para ver). 
Agora irei mostrar como podemos realizar a transformação de uma configuração utilizando as tasks de deploy de Web Apps de uma maneira simples e fácil.

**Configurando meu Web App**

![Image](/img/transformando-configuraes-de-xml-e-json-com-web-apps/1_BD0EV8VzKpc9o7qG8R9XLg.png)

Para a utilização do recurso, crie um release definition e adicione uma task de Web App.

![Image](/img/transformando-configuraes-de-xml-e-json-com-web-apps/1_cfAK7r-6h5b_VROzPp8g2Q.png)

Na sessão “File Transforms & Variable Substitution Options” selecione “XML Variable Substitution”. Caso tenha arquivos .json que precisem ser alterados, especifique o caminho dos arquivos:

![Image](/img/transformando-configuraes-de-xml-e-json-com-web-apps/1_cOXb7wzeKEAze9sSg6SKGw.png)

Neste exemplo, irei alterar a uma chave de configuração no arquivo web.config:

![Image](/img/transformando-configuraes-de-xml-e-json-com-web-apps/1_K26WD3Zy6VaAQRXXratqUA.png)

Adicione uma variável com o mesmo nome da key, neste caso “configuracao”, e o valor desejado da substituição:

![Image](/img/transformando-configuraes-de-xml-e-json-com-web-apps/1_Flc2Aaxh0kXA-O4SxCZhWg.png)

No caso de arquivos json, deverá ser especificado o nó no nome da chave:

![Image](/img/transformando-configuraes-de-xml-e-json-com-web-apps/1_iBdcONMNd2DOZlqLuu3rRg.png)

![Image](/img/transformando-configuraes-de-xml-e-json-com-web-apps/1_e2FURP_OrQ-rMBar00W-Yg.png)

E após estes simples procedimentos basta salvar a release definition e iniciar um novo deploy e a transformação será realizada. Neste exemplo, a aplicação foi publicada em um Web App e o valor definido na variável foi transformado:

![Image](/img/transformando-configuraes-de-xml-e-json-com-web-apps/1_a3g9L863Z2UvFFbFGJ1K-g.png)

Abaixo está um tooltip da própria task explicando em quais situações será possível utilizar este recurso:

![Image](/img/transformando-configuraes-de-xml-e-json-com-web-apps/1_TVK15wPOvrDrHIQM7GDc7Q.png)

**Conclusão**

Antes da existência deste recurso, ou no caso de publicações que não utilizam WebApps, era necessário gerar um arquivo web.release.config, e alterar o valor para um token.

Com este novo processo, esta etapa não é mais necessária, onde precisamos apenas adicionar uma variável com o mesmo nome da key, e a task irá substituir os valores automaticamente.

Com isso o processo de gestão das configurações se torna muito mais rápido e eficiente!

Abraço!
