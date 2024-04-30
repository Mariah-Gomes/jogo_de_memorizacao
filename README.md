# ProjetoAssembly
Nome: Iago Rosa de Oliveira R.A.: 24.123.056-4

Nome: Mariah Santos Gomes R.A.: 24.222.027-5

## Descrição do Projeto

Neste projeto, decidimos realizar um jogo em Assembly onde o usuário possa visualizar no display uma sequência de números, que ficam um tempo no display e o usuário terá que decorar a sequência dos números e em seguida digitar a sequência utilizando comunicação serial do EdSim 51. Caso, o usuário esteja correto ele sobe de nível, ou seja, mostra um array diferente para o usuário. Portanto, o jogo terá 4 níveis diferentes, entre eles, o fácil com 4 números, o médio com 6 números, o díficil com 8 números e um GOD (super díficil) com 10 números. Caso, o usuário errar a sequência o jogo termina e ele terá que recomeçar. Mas, se o jogador ganhar, mostra uma mensagem na tela de comemoração, o jogo finaliza e volta para o início. Onde o usuário precisa digitar 1 para recomeçar o jogo. 

## Imagens da Simulação
Para iniciar o jogo o usuário precisa digitar na comunicação serial do EdSim 51 o número 1.

![image](https://github.com/Mariah-Gomes/ProjetoAssembly/assets/141663285/5a8a35b6-d47e-4a52-9e22-dfcb11d7e1dd)

Após o EdSim 51 receber o número 1 mostra a tela de início do jogo e o jogo começa a rodar. 

![image](https://github.com/Mariah-Gomes/ProjetoAssembly/assets/141663285/efc76219-2780-4e4e-9862-1094d848f83c)

O primeiro nível do jogo é o nível fácil com 4 números. Portanto, no jogo mostra no display qual é o nível que o usuário está jogando, e a sequência dos números. Depois de um tempo para o usuário memorizar aparece no display uma mensagem dizendo que o usuário pode digitar os números e enviar eles através do comunicador serial do EdSim 51. Além disso, se o usuário digitar menos números que o previsto do nível ou digitar mais números ele perde e o jogo reinicia.  Em particular, demostramos apenas as fotos do nível fácil, porém, esse procedimento acontece nos outros níveis da mesma forma, mas, no final do último nível mostra uma mensagem de parabéns e o jogo reinicia.

![image](https://github.com/Mariah-Gomes/ProjetoAssembly/assets/141663285/bfd04a03-b8fe-4c30-8299-59765c742176)

![image](https://github.com/Mariah-Gomes/ProjetoAssembly/assets/141663285/2aaea003-79f6-498a-adb9-8231419e196d)

![image](https://github.com/Mariah-Gomes/ProjetoAssembly/assets/141663285/f175afe0-4b1a-4e8b-88b3-3473ccb26fc0)

![image](https://github.com/Mariah-Gomes/ProjetoAssembly/assets/141663285/4b20288e-a159-4621-9570-f06758316f29)

![image](https://github.com/Mariah-Gomes/ProjetoAssembly/assets/141663285/0f363ff9-038c-474b-9a65-970caf0218a0)

![image](https://github.com/Mariah-Gomes/ProjetoAssembly/assets/141663285/8a4c8edf-e8f3-44fd-9d4f-a7b4b06da800)

![image](https://github.com/Mariah-Gomes/ProjetoAssembly/assets/141663285/1fd8c7c5-9e71-48d4-a388-bb0682efa8d5)

![image](https://github.com/Mariah-Gomes/ProjetoAssembly/assets/141663285/b4cb5325-dbae-414d-bca4-6bbb5250846d)

## Fluxograma

Nesse fluxograma nós só consideramos as funções de lógica do jogo. Portanto, não consideramos funções de display, funções de delay e funções vistas na aula do professor Isaac, apenas, a nossa lógica. Além disso, nesse fluxograma também não está mostrando a função de interrupção, a qual após receber os valores do usuário coloca eles no display.

```mermaid
graph TD;
    A([Início]) --> B[[BEFORE_START]];
    B --> C[[CONDICAO]];
    C --> D[[USUARIO_DIGITA_START]];
    D --> E[[LOOP_START]];
    E --> F{SE A == #0DH};
    F -->|NÃO|G[[RODANDO_START]];
    G--> E;
    F -->|SIM|H[[CONT_CONT_START]];
    H --> I{SE A == #0DH};
    I --> |NÃO|J[[CONT_START]];
    J --> K{SE A == #31H};
    K --> |NÃO|L[[ERROU_START]];
    L --> H; 
    K --> |SIM|H;
    I --> |SIM|N{SE R2 == #1H};
    N --> |NÃO|O[[FALHOU_START]];
    O --> C;
    N --> |SIM|P{SE R3 == #0H};
    P --> |NÃO|O;
    P --> |SIM|Q[[START]];

    Q --> R[[SEQUENCIA_FACIL]];
    R --> S[[USUARIO_DIGITA_FACIL]];
    S --> T[[LOOP_FACIL]];
    T --> U{SE A == #0DH};
    U --> |NÃO|V[[RODANDO_FACIL]];
    V --> T;
    U --> |SIM|W[[CONT_CONT_FACIL]];
    W --> X{SE A == #0DH};
    X --> |NÃO|Y[[CONT_FACIL]];
    Y --> Z{SE A == B};
    Z --> |NÃO|W;
    Z --> |SIM|W;
    X --> |SIM|AA{SE R2 == #4H};
    AA --> |NÃO|AB[[FALHOU_FACIL]];
    AB --> C;
    AA --> |SIM|AC{SE R3 == #0H};
    AC --> |NÃO|AB;

    AC --> |SIM|AD[[SEQUENCIA_MEDIO]];
    AD --> AE[[USUARIO_DIGITA_MEDIO]];
    AE --> AF[[LOOP_MEDIO]];
    AF --> AG{SE A == #0DH};
    AG --> |NÃO|AH[[RODANDO_MEDIO]];
    AH --> AF;
    AG --> |SIM|AI[[CONT_CONT_MEDIO]];
    AI --> AJ{SE A == #0DH};
    AJ --> |NÃO|AK[[CONT_MEDIO]];
    AK --> AL{SE A == B};
    AL --> |NÃO|AI;
    AL --> |SIM|AI;
    AJ --> |SIM|AM{SE R2 == #6H};
    AM --> |NÃO|AN[[FALHOU_MEDIO]];
    AN --> C;
    AM --> |SIM|AO{SE R3 == #0H};
    AO --> |NÃO|AN;

    AO --> AP[[SEQUENCIA_DIFICIL]];
    AP --> AQ[[USUARIO_DIGITA_DIFICIL]];
    AQ --> AR[[LOOP_DIFICIL]];
    AR --> AS{SE A == #0DH};
    AS --> |NÃO|AT[[RODANDO_DIFICIL]];
    AT --> AR;
    AS --> |SIM|AU[[CONT_CONT_DIFICIL]];
    AU --> AV{SE A == #0DH};
    AV --> |NÃO|AW[[CONT_DIFICIL]];
    AW --> AX{SE A == B};
    AX --> |NÃO|AY[[ERROU_DIFICIL]];
    AY --> AU;
    AX --> |SIM|AU;
    AV --> |SIM|AZ{SE R2 == #8H};
    AZ --> |NÃO|BA[[FALHOU_DIFICIL]];
    BA --> C;
    AZ --> |SIM|BB{SE R3 == #0H};
    BB --> |NÃO|BA;

    BB --> |SIM|BC[[SEQUENCIA_GOD]];
    BC --> BD[[USUÁRIO_DIGITA_GOD]];
    BD --> BE[[LOOP_GOD]];
    BE --> BF{SE A == #0DH};
    BF --> |NÃO|BG[[RODANDO_GOD]];
    BG --> BE;
    BF --> |SIM|BH[[CONT_CONT_GOD]];
    BH --> BI{SE A == #0DH};
    BI --> |NÃO|BJ[[CONT_GOD]];
    BJ --> BK{SE A == B};
    BK --> |NÃO|BH;
    BK --> |SIM|BH;
    BI --> |SIM|BL{SE R2 == #0AH};
    BL --> |NÃO|BM[[FALHOU_GOD]];
    BM --> C;
    BL --> |SIM|BN{SE R3 == #0H};
    BN --> |NÃO|BM;
    BN --> |SIM|C;
```

## Código-fonte comentado

```javascript
;1-3 funções importantes.
;Função de interrpção, responsável em guardar os valores que o usuário digitou em um array.

;FUNÇÃO DE INTERRUPÇÃO PARA GUARDAR O QUE O USUÁRIO DIGITOU. 
org 023H
	MOV A,SBUF ; REALIZA A LEITURA DO BYTE RECEBIDO
	MOV @R0, A ; ESCREVE O VALOR NO ENDEREÇO 30H
	CLR RI ; RESETA RI PARA RECEBER NOVO BYTE
	INC R0
	INC R1
	RETI
```

```javascript
;2-3 funções importantes.
;Função para começar o jogo. Ela fica em um loop até o usuário digitar 1 (nem mais e nem menos).

USUARIO_DIGITA_START: ;FUNÇÃO PARA RECEBER O VALOR DO USUÁRIO PARA COMEÇAR O JOGO.
	MOV SCON, #50H ;porta serial no modo 1 e habilita a recepção
	MOV PCON, #80h ;set o bit SMOD 
	MOV TMOD, #20H ;CT1 no modo 2 
	MOV TH1, #243 ;valor para a recarga 
	MOV TL1, #243 ;valor para a primeira contagem
	MOV IE,#90H ; Habilita interrupção serial
	SETB TR1 ;liga o contador/temporizador 1 
	MOV R0, #50H
	MOV R1, #4FH
LOOP_START: ;LOOP QUE FICA ATIVO ATÉ O USUÁRIO DIGITAR O VALOR.
	MOV A, @R1
	CJNE A, #0Dh, RODANDO_START
	MOV R2, #0H
	MOV R3, #0H 
	MOV R1, #50H
CONT_CONT_START: ;VERIFICAÇÕES PARA SABER SE O VALOR ESTÁ CORRETO.
	MOV A, @R1
	CJNE A, #0DH, CONT_START
	CJNE R2, #1H, FALHOU_START
	CJNE R3, #0H, FALHOU_START
	RET
CONT_START: ;VERIFICANDO O VALOR (OU VALORES) QUE O USUÁRIO DIGITOU.
	MOV A, @R1
	CJNE A, #31H, ERROU_START
	INC R1
	INC R2
	JMP CONT_CONT_START
ERROU_START:
	INC R1
	INC R2
	INC R3
	JMP CONT_CONT_START
RODANDO_START:
	JMP LOOP_START
FALHOU_START: ;CASO O USUÁRIO ERRE O VALOR, ELE VOLTA PARA O LOOP INICIAL.
	JMP CONDICAO
```

```javascript
;3-3 funções importantes.
;Função para receber os valores do usuário para o nível fácil, verificar eles, e dizer se o usuário acertou ou não. Caso o usuário tenha acertado ele pula para o próximo nível, caso não, ele volta para o loop inicial.
;As funções do nível médio e difícil são iguais (com alguns valores diferentes), e o nível GOD é bem parecido, mudando que se o usuário ganhar ele também volta para o loop inicial.

USUARIO_DIGITA_FACIL: ;FUNÇÃO PARA RECEBER OS VALORES DO USUÁRIO PARA O NÍVEL FÁCIL.
	MOV SCON, #50H ;porta serial no modo 1 e habilita a recepção
	MOV PCON, #80h ;set o bit SMOD 
	MOV TMOD, #20H ;CT1 no modo 2 
	MOV TH1, #243 ;valor para a recarga 
	MOV TL1, #243 ;valor para a primeira contagem
	MOV IE,#90H ; Habilita interrupção serial
	SETB TR1 ;liga o contador/temporizador 1 
	MOV R0, #50H
	MOV R1, #4FH
LOOP_FACIL: ;LOOP QUE FICA RODANDO ATÉ TERMINAR DE RECEBER OS VALORES DO USUÁRIO.
	MOV A, @R1
	CJNE A, #0Dh, RODANDO_FACIL
	MOV R2, #0H
	MOV R3, #0H 
	MOV R0, #33H
	MOV R1, #50H
CONT_CONT_FACIL: ;CONDIÇÕES PARA VERIFICAR SE O USUÁRIO ACERTOU.
	MOV A, @R1
	CJNE A, #0DH, CONT_FACIL
	CJNE R2, #4H, FALHOU_FACIL
	CJNE R3, #0H, FALHOU_FACIL
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #ACERTOU
	ACALL escreveStringROM
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #PROX_NIVEL
	ACALL escreveStringROM
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	RET
CONT_FACIL: ;CONFERINDO OS VALORES DO USUÁRIO COM O ARRAY.
	MOV A, @R0
	MOV B, @R1
	CJNE A, B, ERROU_FACIL
	INC R0
	INC R1
	INC R2
	JMP CONT_CONT_FACIL
ERROU_FACIL:
	INC R0
	INC R1
	INC R2
	INC R3
	JMP CONT_CONT_FACIL
RODANDO_FACIL:
	JMP LOOP_FACIL
FALHOU_FACIL: ;CASO O USUÁRIO ERRE O PROGRAMA RETORNA PARA O LOOP INICIAL.
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #FALHOU_NIVEL
	ACALL escreveStringROM
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	JMP CONDICAO
```
