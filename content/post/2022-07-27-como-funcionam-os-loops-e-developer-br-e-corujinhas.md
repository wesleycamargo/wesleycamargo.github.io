+++
title = "Como funcionam os Loops — Developer BR — Corujinhas"
date = 2022-07-27T23:48:29+02:00
draft = false
categories = ["Technology", "Development"]
tags = ["blog", "medium-import"]
image = "/img/como-funcionam-os-loops-e-developer-br-e-corujinhas/0_hgbUwY6z642w44jS.png"
+++

### Como funcionam os Loops — Developers BR — Corujinhas

### Loops

#### O que é um loop ou laço?

Um loop é uma maneira de executar um trecho código repetidas vezes. É composto de uma condição e o código que será executado.

O loop é representado por um circuito fechado, e enquanto a condição não for satisfeita se repete infinitamente.

![Image](/img/como-funcionam-os-loops-e-developer-br-e-corujinhas/0_hgbUwY6z642w44jS.png)

#### Condições de um loop

As condições são usadas para verificar quantas vezes o trecho de código será repetido. Antes de cada execução (ou depois, dependendo do tipo da estrutura de repetição usada), a condição é verificada e se continuar verdadeira o código é executado. Os tipo de condições podem ser:

- Verdadeiro ou Falso
- Um número específico de vezes
- O número de elementos em uma coleção

#### Código

Praticamente qualquer tipo de código pode ser executado em um loop, não há restrições! Em alguns casos, certos tipos de variáveis são usadas para ajudar a controlar o que está acontecendo durante as repetições. Essa variável é chamada de **contador**.

#### Quando usar um loop

Usamos loops quando precisamos fazer a mesma coisa várias vezes. Vamos a um exemplo:

Imagine que estamos criando um sistema para uma cafeteria. Os requisitos para esse sistema são:

- Para cada novo café pedido escrever na tela o número do pedido que está sendo executado
- Ao final exibir a quantidade total de cafés preparados

Para simplificar, vamos imaginar que temos 3 pedidos de café e precisamos executá-los. Como seria esse código?

`int cafesPreparados = 0;`

`ash
`// Preparando o café
cafesPreparados++;
Console.WriteLine($"Preparando o 1° café");`
`

`ash
`cafesPreparados++;
Console.WriteLine($"Preparando o 2° café");`
`

`ash
`cafesPreparados++;
Console.WriteLine($"Preparando o 3° café");`
`

`ash
`Console.WriteLine($"Total de devs felizes: {cafesPreparados}");`
`
Não parece tão complicado, certo? Realmente, se tivermos poucos pedidos não é uma tarefa difícil, mas temos dois problemas:

- No caso de apenas 3 pedidos, foram apenas mais 6 linhas de código, mas e se fossem 100? Ou 1000? Teremos um programador bem entediado repetindo esse código tantas vezes…
- Além do problema acima, de termos tarefas repetitivas, nós adicionamos dentro do código cada pedido feito - O que impede de recebermos pedidos dinamicamente e na pratica inviabiliza a aplicação.

Mas imagine que agora nossa cafeteria aceita pedidos online, e recebeu 10000 pedidos. Como fazer isso?

É nessa situação que os loops vão te ajudar!

### Tipos de loops

#### While

É o tipo mais básico de loop. No while, a condição é verificada antes da execução, e se for verdadeira o código é executado. Normalmente é usado para comparações de verdadeiro e falso mas com um pouco mais de trabalho, ele consegue substituir algumas das outras estruturas de repetição, como for e forEach.

![Image](/img/como-funcionam-os-loops-e-developer-br-e-corujinhas/0_GaTv8RxkcfvejFwH.png)

As principais características do while são:

- Enquanto uma condição for verdadeira(ou falsa), continue repetindo.
- Executa o trecho de código uma vez, volta ao inicio e verifica se a condição continua verdadeira e executa novamente.
- Atenção! Isso pode acontecer para sempre, desde que a condição continue verdadeira! Isso é chamado de loop infinito e na maioria dos casos não é desejado.

`ash
Console.WriteLine("Quantos devs precisam de café?");
*int* devs = Convert.ToInt32(Console.ReadLine());
`

`ash
*int* cafesPreparados = 0;
`

`ash
while (cafesPreparados < devs)
{
   cafesPreparados++;
   Console.WriteLine($"Preparando o {cafesPreparados}° café");
}
`

`ash
Console.WriteLine($"Total de devs felizes: {cafesPreparados}");
`

#### Do While

Para do while, acontece o oposto, o código é executado e apenas após a condição é verificada. Isso pode ser útil em casos onde pelo menos uma execução é sempre necessária.

![Image](/img/como-funcionam-os-loops-e-developer-br-e-corujinhas/0_7FpTKrY1o27XneqV.png)

`ash
Console.WriteLine("Quantos devs precisam de café?");
*int* devs = Convert.ToInt32(Console.ReadLine());
`

`ash
*int* cafesPreparados = 0;
`

`ash
do
{
   cafesPreparados++;
   Console.WriteLine($"Preparando o {cafesPreparados}° café");
} while (cafesPreparados < devs);
`

`ash
if (cafesPreparados > devs)
{
   Console.WriteLine($"Oh não! O café está esfriando e nenhum dev está por perto!");
}
else
{
   Console.WriteLine($"Total de devs felizes: {cafesPreparados}");
}
`

#### For

O for funciona da mesma maneira que o while. É recomendado seu uso para casos em que a quantidade de vezes que a repetição deve acontecer é conhecida. Para declarar um for é necessária uma variável, chamada index ou i e são necessárias 3 declarações separadas por ponto e vírgula(;):

![Image](/img/como-funcionam-os-loops-e-developer-br-e-corujinhas/0_TcDDIvQkLXBxHr-T.png)

- Inicializar: Declaramos o valor inicial do índice
- Condição: Adicionamos a comparação que será usada para parar o loop
- Iterar: Incrementamos o índice, normalmente com ++

`ash
Console.WriteLine("Quantos devs precisam de café?");
*int* devs = Convert.ToInt32(Console.ReadLine());
`

`ash
*int* cafesPreparados = 0;
`

`ash
for (*int* i = 0; i < devs; i++)
{
   Console.WriteLine($"Preparando o {i}° café");
   cafesPreparados = i;
}
`

`ash
Console.WriteLine($"Total de devs felizes: {cafesPreparados}");
`

#### Foreach

O foreach é recomendado quando trabalhamos com coleções ou listas. Sua tradução é “para cada”, o que significa o trecho de código será repetido uma vez para cada elemento da lista.

`ash
var developers = new List<*string*>();
*string* maisdevs = "s";
`

`ash
do
{
   Console.WriteLine("Digite o nome do dev:");
   developers.Add(Console.ReadLine() as *string* ?? string.Empty);
`

`ash
   Console.WriteLine("Mais algum dev precisa de café? [S/N]");
   maisdevs = Console.ReadLine() as *string* ?? string.Empty;
} while (maisdevs.ToLower().Equals("s"));
`

`ash
foreach (var dev in developers)
{
   Console.WriteLine($"Preparando café para o dev {dev}");
}
`

`ash
Console.WriteLine($"Total de devs felizes: {developers.Count}");
`

### GitHub do Corujinhas

Para os exemplos completos, veja o repositório do corujinhas no GitHub!
[Developers-BR/corujinhas (github.com)](https://github.com/Developers-BR/corujinhas)
