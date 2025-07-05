+++
title = "Gerenciando transformações de configuração com Azure Key Vault e VSTS"
date = 2018-02-15T16:21:22+01:00
draft = false
categories = ["Technology", "Development", "Azure"]
tags = ["blog", "medium-import", "azure"]
image = "/img/gerenciando-transformaes-de-configuraao-com-azure-key-vault-e-vsts/0_LZ9C3pXOV3xuvyWq.png"
+++

### Gerenciando transformações de configuração com Azure Key Vault e VSTS

Quem nunca teve dificuldade para fazer a gestão de arquivos de configuração que atire a primeira pedra!

Com a automação dos processos de build e deploy, uma etapa muito importante do processo é alteração das chaves dos arquivos de configuração, pois em cada um de nossos ambientes, teremos também valores diferentes, como por exemplo a connection string de um banco de dados.

Irei abordar uma maneira inteligente de realizar isso, através da transformação no momento do deploy utilizando o Azure Key Vault no momento de realização da Release no Visual Studio Team Services, então mãos a obra!

Para demonstrar, irei utilizar uma aplicação web simples, que será compilada no VSTS e publicada em um Azure Web App (em outro post irei explicar como criar e configurar um :)).

**O que é o Azure Key Vault?**

![Image](/img/gerenciando-transformaes-de-configuraao-com-azure-key-vault-e-vsts/0_LZ9C3pXOV3xuvyWq.png)

O Azure Key Vault é um recurso do Azure onde são armazenadas chaves e segredos para realizar a comunicação entre aplicações. Com ele podemos armazenar dados sensíveis(Segredos), Certificados .PFX, Key encription Keys (KEK) e também é possível utilizar sua API para realizar criptografia. Para mais informações à respeito, segue o link da documentação [https://azure.microsoft.com/en-us/services/key-vault/](https://azure.microsoft.com/en-us/services/key-vault/)

**Entre as vantagens de utilização destacam-se:**

- Gestão de forma centralizada
- Maior segurança na administração dos dados sensíveis
- Maior facilidade na administração, pois pode ser feita no Azure Portal

**Como implementar?**

O primeiro passo é criar um Azure Key Vault no Azure Portal:

![Image](/img/gerenciando-transformaes-de-configuraao-com-azure-key-vault-e-vsts/1_nx7lCO0MwgnJ13_U7ci9Aw.png)

Selecione Add e na sequência preencha nome, Resource Group e Location. O restante das informações podem ser mantidas. Clique em Create:

![Image](/img/gerenciando-transformaes-de-configuraao-com-azure-key-vault-e-vsts/1_Db5ICSpI3_IdNssDLi69Lg.png)

Após a criação, selecione “Secrets” e “Generate/Import”:

![Image](/img/gerenciando-transformaes-de-configuraao-com-azure-key-vault-e-vsts/1_ON1rL_yJBKq3Z5_Yk3hdlg.png)

Na próxima etapa iremos realizar a criação da chave/secret. Em Upload Options selecione Manual, e adicione o nome da variável e o valor. Note que por ser um secret aparecem asteriscos quando o valor é digitado:

![Image](/img/gerenciando-transformaes-de-configuraao-com-azure-key-vault-e-vsts/1_yAMfpsvEpZ_8yiCJB8bjJA.png)

Agora que temos nossa chave criada, vamos ao VSTS realizar a configuração de um Release Definition utilizando o Key Vault.

Para isso iremos utilizar um Variable Group e nele iremos realizar o link com o Key Vault.

Selecione a opção de Build/Release e em seguida Library. Após isso crie um novo Variable Group:

![Image](/img/gerenciando-transformaes-de-configuraao-com-azure-key-vault-e-vsts/1_1dzMMvFwmQE-hoCNKwat0w.png)

Agora devemos nomear o Variable Group e selecionar Link Secrets from an Azure Key Vault. Então selecione uma subscription e o Key Vault criado anteriormente. 
Após selecionar o Key Vault, será solicitada uma autorização para utilização, pode ser necessária uma permissão mais elevada no VSTS para relizar este passo:

![Image](/img/gerenciando-transformaes-de-configuraao-com-azure-key-vault-e-vsts/1_CR9CpspeIxahIV_rCKhmGA.png)

Selecione as variáveis desejadas no grid que será habilitado e salve o Variable Group:

![Image](/img/gerenciando-transformaes-de-configuraao-com-azure-key-vault-e-vsts/1_ZKGYMXc8SRQX8e_UpfYoKA.png)

![Image](/img/gerenciando-transformaes-de-configuraao-com-azure-key-vault-e-vsts/1_QdieHNnS42PLsLQlw55Xvg.png)

Para utilizar na Release Definition, vá em Variables e selecione Variable Groups. Clique em Link variable group:

![Image](/img/gerenciando-transformaes-de-configuraao-com-azure-key-vault-e-vsts/1_PCvfwJhmXK4uqO0R_YmFgw.png)

Agora selecione o Variable Group criado, e clique em Link.

![Image](/img/gerenciando-transformaes-de-configuraao-com-azure-key-vault-e-vsts/1_Eh0EakNsTdVBmYLV3-r29g.png)

Pronto, agora as variáveis do Azure Key Vault podem ser utilizadas no processo de Release. Para utilizar, é o mesmo processo de utilização de uma variável criada durante a release, utilizando $(nomedavariavel) em algum script ou parâmetro.

Espero que este artigo seja útil, ajudando no processo de transformações de arquivos tornando mais prático e seguro!

Abraço!
