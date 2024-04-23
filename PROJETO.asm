; --- Mapeamento de Hardware (8051) ---
    RS      equ     P1.3    ;Reg Select ligado em P1.3
    EN      equ     P1.2    ;Enable ligado em P1.2


org 0000h
	LJMP START

org 023H
	MOV A,SBUF ; REALIZA A LEITURA DO BYTE RECEBIDO
	MOV @R0, A ; ESCREVE O VALOR NO ENDEREÇO 30H
	CLR RI ; RESETA RI PARA RECEBER NOVO BYTE
	INC R0
	RETI

PERDEU:
	JMP $


org 0070h
START:
	ACALL lcd_init

	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #BEM_VINDO
	ACALL escreveStringROM
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #NIVEL_FACIL
	ACALL escreveStringROM
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	ACALL SEQUENCIA_FACIL
	ACALL READ_SEQUENCIAS
	ACALL AJST_FACIL
	ACALL NEW_DELAY
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	ACALL USUARIO_DIGITA_FACIL

MEDIO:
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #NIVEL_MEDIO
	ACALL escreveStringROM
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	ACALL SEQUENCIA_MEDIO
	ACALL READ_SEQUENCIAS
	ACALL AJST_MEDIO
	ACALL NEW_DELAY
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	;ACALL USUARIO_DIGITA

	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #NIVEL_DIFICIL
	ACALL escreveStringROM
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	ACALL SEQUENCIA_DIFICIL
	ACALL READ_SEQUENCIAS
	ACALL AJST_DIFICIL
	ACALL NEW_DELAY
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	;ACALL USUARIO_DIGITA

	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #NIVEL_GOD
	ACALL escreveStringROM
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	ACALL SEQUENCIA_GOD
	ACALL READ_SEQUENCIAS
	ACALL AJST_GOD
	ACALL NEW_DELAY
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	;ACALL USUARIO_DIGITA

	JMP $


BEM_VINDO:
	DB "BEM-VINDO"
	DB 00H


NIVEL_FACIL:
	DB "NIVEL FACIL"
	DB 00H
NIVEL_MEDIO:
	DB "NIVEL MEDIO"
	DB 00H
NIVEL_DIFICIL:
	DB "NIVEL DIFICIL"
	DB 00H
NIVEL_GOD:
	DB "NIVEL GOD"
	DB 00H

ACERTOU:
	DB "ACERTOU"
	DB 00H
PROX_NIVEL:
	DB "PROXIMO NIVEL"
	DB 00H
FALHOU_NIVEL:
	DB "PERDEU TROUXA"
	DB 00H



AJST_FACIL:
	MOV 30H, #33H
	MOV 31H, #04H
	RET
SEQUENCIA_FACIL:
	MOV 33H, #'2'
	MOV 34H, #'8'
	MOV 35H, #'1'
	MOV 36H, #'2'
	ACALL AJST_FACIL
	MOV 32H, #06H
	RET
AJST_MEDIO:
	MOV 30H, #33H
	MOV 31H, #06H
	RET
SEQUENCIA_MEDIO:
	MOV 33H, #'2'
	MOV 34H, #'7'
	MOV 35H, #'0'
	MOV 36H, #'1'
	MOV 37H, #'2'
	MOV 38H, #'8'
	ACALL AJST_MEDIO
	MOV 32H, #05H
	RET
AJST_DIFICIL:
	MOV 30H, #33H
	MOV 31H, #08H
	RET
SEQUENCIA_DIFICIL:
	MOV 33H, #'1'
	MOV 34H, #'5'
	MOV 35H, #'0'
	MOV 36H, #'7'
	MOV 37H, #'2'
	MOV 38H, #'0'
	MOV 39H, #'2'
	MOV 3AH, #'3'
	ACALL AJST_MEDIO
	MOV 32H, #04H
	RET
AJST_GOD:
	MOV 30H, #33H
	MOV 31H, #0AH
	RET
SEQUENCIA_GOD:
	MOV 33H, #'9'
	MOV 34H, #'6'
	MOV 35H, #'8'
	MOV 36H, #'8'
	MOV 37H, #'2'
	MOV 38H, #'5'
	MOV 39H, #'3'
	MOV 3AH, #'7'
	MOV 3BH, #'1'
	MOV 3CH, #'4'
	ACALL AJST_GOD
	MOV 32H, #03H
	RET


LIMPAR_DISPLAY:
	DB "                "
	DB 00H


READ_SEQUENCIAS:
	MOV R0, 30H
	MOV R1, 31H
	MOV A, 32H
	ACALL posicionaCursor
ROT:
	MOV A, @R0
	ACALL sendCharacter
	INC R0
	DJNZ R1, ROT
	RET


NEW_DELAY:
	MOV R7, #0FFH
	DJNZ R7, $
	MOV R7, #0FFH
	DJNZ R7, $
	MOV R7, #0FFH
	DJNZ R7, $
	RET


USUARIO_DIGITA_FACIL:
	MOV SCON, #50H ;porta serial no modo 1 e habilita a recepção
	MOV PCON, #80h ;set o bit SMOD 
	MOV TMOD, #20H ;CT1 no modo 2 
	MOV TH1, #243 ;valor para a recarga 
	MOV TL1, #243 ;valor para a primeira contagem
	MOV IE,#90H ; Habilita interrupção serial
	SETB TR1 ;liga o contador/temporizador 1 
	MOV R0, #50H
LOOP_FACIL:
	CJNE R0, #54h, RODANDO_FACIL
	MOV R2, #0H
	MOV R3, #0H 
	MOV R0, #33H
	MOV R1, #50H
CONT_CONT_FACIL:
	CJNE R2, #4H, CONT_FACIL
	CJNE R3, #0H, FALHOU_FACIL
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
	JMP MEDIO
FALHOU_FACIL:
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #FALHOU_NIVEL
	ACALL escreveStringROM
	MOV A, #00H
	ACALL posicionaCursor
	MOV DPTR, #LIMPAR_DISPLAY
	ACALL escreveStringROM
	JMP $
CONT_FACIL:
	MOV A, @R0
	MOV B, @R1
	CJNE A, B, ERROU_FACIL
	INC R0
	INC R1
	INC R2
	JMP CONT_CONT_FACIL
ERROU_FACIL:
	INC R2
	INC R3
	JMP CONT_CONT_FACIL
RODANDO_FACIL:
	JMP LOOP_FACIL


escreveStringROM:
  MOV R1, #00h
	; Inicia a escrita da String no Display LCD
loop:
  MOV A, R1
	MOVC A,@A+DPTR 	 ;l� da mem�ria de programa
	JZ finish		; if A is 0, then end of data has been reached - jump out of loop
	ACALL sendCharacter	; send data in A to LCD module
	INC R1			; point to next piece of data
   MOV A, R1
	JMP loop		; repeat
finish:
	RET


; initialise the display
; see instruction set for details
lcd_init:

	CLR RS		; clear RS - indicates that instructions are being sent to the module

; function set	
	CLR P1.7		; |
	CLR P1.6		; |
	SETB P1.5		; |
	CLR P1.4		; | high nibble set

	SETB EN		; |
	CLR EN		; | negative edge on E

	CALL delay		; wait for BF to clear	
					; function set sent for first time - tells module to go into 4-bit mode
; Why is function set high nibble sent twice? See 4-bit operation on pages 39 and 42 of HD44780.pdf.

	SETB EN		; |
	CLR EN		; | negative edge on E
					; same function set high nibble sent a second time

	SETB P1.7		; low nibble set (only P1.7 needed to be changed)

	SETB EN		; |
	CLR EN		; | negative edge on E
				; function set low nibble sent
	CALL delay		; wait for BF to clear


; entry mode set
; set to increment with no shift
	CLR P1.7		; |
	CLR P1.6		; |
	CLR P1.5		; |
	CLR P1.4		; | high nibble set

	SETB EN		; |
	CLR EN		; | negative edge on E

	SETB P1.6		; |
	SETB P1.5		; |low nibble set

	SETB EN		; |
	CLR EN		; | negative edge on E

	CALL delay		; wait for BF to clear


; display on/off control
; the display is turned on, the cursor is turned on and blinking is turned on
	CLR P1.7		; |
	CLR P1.6		; |
	CLR P1.5		; |
	CLR P1.4		; | high nibble set

	SETB EN		; |
	CLR EN		; | negative edge on E

	SETB P1.7		; |
	SETB P1.6		; |
	SETB P1.5		; |
	SETB P1.4		; | low nibble set

	SETB EN		; |
	CLR EN		; | negative edge on E

	CALL delay		; wait for BF to clear
	RET


sendCharacter:
	SETB RS  		; setb RS - indicates that data is being sent to module
	MOV C, ACC.7		; |
	MOV P1.7, C			; |
	MOV C, ACC.6		; |
	MOV P1.6, C			; |
	MOV C, ACC.5		; |
	MOV P1.5, C			; |
	MOV C, ACC.4		; |
	MOV P1.4, C			; | high nibble set

	SETB EN			; |
	CLR EN			; | negative edge on E

	MOV C, ACC.3		; |
	MOV P1.7, C			; |
	MOV C, ACC.2		; |
	MOV P1.6, C			; |
	MOV C, ACC.1		; |
	MOV P1.5, C			; |
	MOV C, ACC.0		; |
	MOV P1.4, C			; | low nibble set

	SETB EN			; |
	CLR EN			; | negative edge on E

	CALL delay			; wait for BF to clear
	RET


;Posiciona o cursor na linha e coluna desejada.
;Escreva no Acumulador o valor de endereço da linha e coluna.
;|--------------------------------------------------------------------------------------|
;|linha 1 | 00 | 01 | 02 | 03 | 04 |05 | 06 | 07 | 08 | 09 |0A | 0B | 0C | 0D | 0E | 0F |
;|linha 2 | 40 | 41 | 42 | 43 | 44 |45 | 46 | 47 | 48 | 49 |4A | 4B | 4C | 4D | 4E | 4F |
;|--------------------------------------------------------------------------------------|
posicionaCursor:
	CLR RS	         ; clear RS - indicates that instruction is being sent to module
	SETB P1.7		    ; |
	MOV C, ACC.6		; |
	MOV P1.6, C			; |
	MOV C, ACC.5		; |
	MOV P1.5, C			; |
	MOV C, ACC.4		; |
	MOV P1.4, C			; | high nibble set

	SETB EN			; |
	CLR EN			; | negative edge on E

	MOV C, ACC.3		; |
	MOV P1.7, C			; |
	MOV C, ACC.2		; |
	MOV P1.6, C			; |
	MOV C, ACC.1		; |
	MOV P1.5, C			; |
	MOV C, ACC.0		; |
	MOV P1.4, C			; | low nibble set

	SETB EN			; |
	CLR EN			; | negative edge on E

	CALL delay			; wait for BF to clear
	RET


;Retorna o cursor para primeira posição sem limpar o display
retornaCursor:
	CLR RS	      ; clear RS - indicates that instruction is being sent to module
	CLR P1.7		; |
	CLR P1.6		; |
	CLR P1.5		; |
	CLR P1.4		; | high nibble set

	SETB EN		; |
	CLR EN		; | negative edge on E

	CLR P1.7		; |
	CLR P1.6		; |
	SETB P1.5		; |
	SETB P1.4		; | low nibble set

	SETB EN		; |
	CLR EN		; | negative edge on E

	CALL delay		; wait for BF to clear
	RET


delay:
	MOV R7, #50
	DJNZ R7, $
	RET