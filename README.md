# ProjetoAssembly
Nome: Iago Rosa de Oliveira R.A.: 24.123.056-4

Nome: Mariah Santos Gomes R.A.: 24.222.027-5

## Descrição do Projeto

Neste projeto, decidimos realizar um jogo em Assembly onde o usuário possa visualizar no display uma sequência de números, que ficam um tempo no display e o usuário terá que decorar a sequência dos números e em seguida digitar a sequência utilizando comunicação serial do EdSim 51. Caso, o usuário esteja correto ele sobe de nível, ou seja, mostra um array diferente para o usuário. Portanto, o jogo terá 4 níveis diferentes, entre eles, o fácil com 4 números, o médio com 6 números, o díficil com 8 números e um GOD (super díficil) com 10 números. Caso, o usuário errar a sequência o jogo termina e ele terá que recomeçar. Mas, se o jogador ganhar, mostra uma mensagem na tela de comemoração e o jogo finaliza. Se ele quiser jogar de novo, terá que rodar o programa novamente. 

## Fluxograma


## Código-fonte comentado

```javascript

```

## Imagens da Simulação
Para iniciar o jogo o usuário precisa digitar na comunicação serial do EdSim 51 o número 1.
Imagem de quando inícia o jogo.

Após o EdSim 51 receber o número 1 mostra a tela de início do jogo e o jogo começa a rodar. 
Imagem de após iniciar o jogo.

O primeiro nível do jogo é o nível fácil com 4 números. Portanto, no jogo mostra no display qual é o nível que o usuário está jogando, e a sequência dos números. Depois de um tempo para o usuário memorizar aparece no display uma mensagem dizendo que o usuário pode digitar os números e enviar eles através do comunicador serial do EdSim 51. Além disso, se o usuário digitar menos números que o previsto do nível ou digitar mais números ele perde e o jogo reinicia.  Em particular, demostramos apenas as fotos do nível fácil, porém, esse procedimento acontece nos outros níveis da mesma forma, mas, no final do último nível mostra uma mensagem de parabéns e o jogo reinicia.
Imagem de apresentação do nível.
Imagem dos números.
Imagem da mensagem do usuário.
Imagem do comunicador serial do EdSim 51
Imagem nível fácil.
Imagem proxímo nível
Imagem de parabéns
Imagem de erro
