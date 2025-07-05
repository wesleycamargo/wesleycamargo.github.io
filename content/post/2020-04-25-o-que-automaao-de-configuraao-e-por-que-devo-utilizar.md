+++
title = "O que é Automação de Configuração e por que devo utilizar"
date = 2020-04-25T23:14:58+02:00
draft = false
categories = ["Technology", "Development"]
tags = ["blog", "medium-import"]
image = "/img/o-que-automaao-de-configuraao-e-por-que-devo-utilizar/1_9pQikZFibQWVP6-zugbKWg.png"
+++

### O que é Automação de Configuração e por que devo utilizar

#### Se acidentalmente alguém destruir seu ambiente de produção agora, quanto tempo você gastaria para deixar tudo funcionando novamente?

Automação de configuração ou Continuous Configuration Automation (CCA) é um tipo de ferramenta de IaC que após o provisionamento dos recursos irão garantir que todas as configurações necessárias para que a aplicação funcione estão instaladas e configuradas corretamente no nosso ambiente.

![Image](/img/o-que-automaao-de-configuraao-e-por-que-devo-utilizar/1_9pQikZFibQWVP6-zugbKWg.png)

No mundo de DevOps é muito comum ouvirmos falar sobre Infraestrutura como código (IaC), que nada mais é que provisionar a infraestrutura de nossas aplicações através de arquivos que são tratados da mesma forma que o código fonte.

Basicamente Infra as Code possui 2 tipos de ferramentas:

- **Provisionamento de recursos **- nessa categoria estão ferramentas que criam os recursos de infraestrutura que serão utilizados por nossas aplicações. 
Entre as ferramentas mais conhecidas estão: **AWS Cloud Formation**, **ARM Templates** e talvez a mais conhecida de todos, o **Terraform**.
- **Continuous Configuration Automation (CCA) ou Configuração de ambientes** - aqui estão ferramentas, como mencionado acima, que após a criação dos recursos irão garantir que todas as configurações necessárias para que a aplicação funcionem estejam de acordo com o especificado. Exemplos dessas configurações são, garantir que portas de firewall estejam liberadas, outros softwares que minha aplicação tenha dependência estejam instalados, servidores de aplicação onde minha aplicação irá rodar esteja com a versão correta do framework utilizado, permissões de acesso, entre todas as outras configurações necessárias para nosso ambiente.
Aqui estão alguns exemplos dessas ferramentas: **Chef**, **Puppet**, **Powershell DSC**, **Ansible** entre vários outros. Aqui neste artigo demonstro a utilização básica do [Powershell DSC](https://medium.com/@camargo.wes/criando-um-dsc-b%C3%A1sico-9b0a694b8e12).

Em algumas ferramentas é possível realizar as duas tarefas sendo assim você pode utilizar apenas uma, porém, sempre haverá especialização em uma das duas categorias (provisionamento ou configuração), o que pode dar um pouco mais de trabalho para a implementação na categoria menos especializada. Nesse caso deve ser avaliado o custo benefício de implementação vs valores gastos com licenças, por exemplo.

### Mas por que eu preciso disso?

Acredito que hoje, 99% das as empresas devem utilizar algum tipo de controle de versão para manter seu software (se não está utilizando é melhor pensar nisso imediatamente!), entretanto, em grande parte esses sistemas são utilizados apenas para versionamento de código fonte, quando deveria englobar todos os artefatos necessários para recriar seus binários e ambientes.

#### **Criar o ambiente da aplicação à qualquer momento**

Para que em uma emergência seja possível recriar nosso ambiente com o mínimo de esforço, um dos princípios de DevOps é que devemos manter absolutamente **TUDO** que seja necessário para criarmos uma versão de nossa aplicação do zero em um sistema de **Controle de Versão**

Eu já presenciei essa experiência por duas vezes (não foi minha culpa heheh), e em ambas boa parte dos recursos estavam sim versionados, mas alguns como configurações de aplicação, regras de DNS, e alguns outros itens infelizmente não. A maior parte foi configurada razoavelmente rápido, mas por algumas semanas fomos descobrindo alguns itens de configuração que faltavam ou estavam incorretos.

#### Ambientes de desenvolvimentos padronizados

Acredito que todos na área de TI já ouviram a famosa frase **“Na minha máquina funciona”**.

Outra vantagem será garantir que **todos os desenvolvedores utilizam um ambiente idêntico**, com todas as dependências instaladas e configurações realizadas. Caso isso não seja implementado, poderá causar problemas como por exemplo, desenvolvedores utilizando versões diferentes de um framework, e ao juntar suas alterações ocorrerem conflitos que precisarão ser corrigidos, ou até mesmo alguma dependência de software que existe apenas no ambiente do desenvolvedor.

#### Controle das alterações realizadas nos ambientes

Com o versionamento das definições de configurações dos ambientes em arquivos armazenados em um **Sistemas de Controle de Versão **todas as alterações podem ser iniciadas através de alterações nos arquivos e enviadas ao SCV, o que nos fornece um **registro de todas as mudanças realizadas no ambiente** e remove a necessidade de acessar algum servidor para realizar alterações, já que todo o processo será realizado de forma automática, garantindo padronização dos ambientes.
