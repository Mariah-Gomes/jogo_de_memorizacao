; --- Mapeamento de Hardware (8051) ---
    RS      equ     P1.3    ;Reg Select ligado em P1.3
    EN      equ     P1.2    ;Enable ligado em P1.2


org 0000h
	LJMP START

org 0040h
START:
	ACALL lcd_init

	ACALL BEM_VINDO
	ACALL READ_SEQUENCIAS
	ACALL LIMPAR_DISPLAY
	ACALL READ_SEQUENCIAS
	
	ACALL NIVEL_FACIL
	ACALL READ_SEQUENCIAS
	ACALL LIMPAR_DISPLAY
	ACALL READ_SEQUENCIAS
	ACALL SEQUENCIA_FACIL
	ACALL READ_SEQUENCIAS
	ACALL NEW_DELAY
	ACALL LIMPAR_DISPLAY
	ACALL READ_SEQUENCIAS

	ACALL NIVEL_MEDIO
	ACALL READ_SEQUENCIAS
	ACALL LIMPAR_DISPLAY
	ACALL READ_SEQUENCIAS
	ACALL SEQUENCIA_MEDIO
	ACALL READ_SEQUENCIAS
	ACALL NEW_DELAY
	ACALL LIMPAR_DISPLAY
	ACALL READ_SEQUENCIAS

	ACALL NIVEL_DIFICIL
	ACALL READ_SEQUENCIAS
	ACALL LIMPAR_DISPLAY
	ACALL READ_SEQUENCIAS
	ACALL SEQUENCIA_DIFICIL
	ACALL READ_SEQUENCIAS
	ACALL NEW_DELAY
	ACALL LIMPAR_DISPLAY
	ACALL READ_SEQUENCIAS

	ACALL NIVEL_GOD
	ACALL READ_SEQUENCIAS
	ACALL LIMPAR_DISPLAY
	ACALL READ_SEQUENCIAS
	ACALL SEQUENCIA_GOD
	ACALL READ_SEQUENCIAS
	ACALL NEW_DELAY
	ACALL LIMPAR_DISPLAY
	ACALL READ_SEQUENCIAS

	JMP $

BEM_VINDO:
	MOV 23H, #'B'
	MOV 24H, #'E'
	MOV 25H, #'M'
	MOV 26H, #'-'
	MOV 27H, #'V'
	MOV 28H, #'I'
	MOV 29H, #'N'
	MOV 2AH, #'D'
	MOV 2BH, #'O'
	MOV 20H, #23H
	MOV 21H, #09H
	MOV 22H, #0H
	RET


NIVEL_FACIL:
	MOV 23H, #'N'
	MOV 24H, #'I'
	MOV 25H, #'V'
	MOV 26H, #'E'
	MOV 27H, #'L'
	MOV 28H, #' '
	MOV 29H, #'F'
	MOV 2AH, #'A'
	MOV 2BH, #'C'
	MOV 2CH, #'I'
	MOV 2DH, #'L'
	MOV 20H, #23H
	MOV 21H, #0BH
	MOV 22H, #0H
	MOV R6, #0H
	RET 
NIVEL_MEDIO:
	MOV 23H, #'N'
	MOV 24H, #'I'
	MOV 25H, #'V'
	MOV 26H, #'E'
	MOV 27H, #'L'
	MOV 28H, #' '
	MOV 29H, #'M'
	MOV 2AH, #'E'
	MOV 2BH, #'D'
	MOV 2CH, #'I'
	MOV 2DH, #'O'
	MOV 20H, #23H
	MOV 21H, #0BH
	MOV 22H, #0H
	MOV R6, #0H
	RET
NIVEL_DIFICIL:
	MOV 23H, #'N'
	MOV 24H, #'I'
	MOV 25H, #'V'
	MOV 26H, #'E'
	MOV 27H, #'L'
	MOV 28H, #' '
	MOV 29H, #'D'
	MOV 2AH, #'I'
	MOV 2BH, #'F'
	MOV 2CH, #'I'
	MOV 2DH, #'C'
	MOV 2EH, #'I'
	MOV 2FH, #'L'
	MOV 20H, #23H
	MOV 21H, #0DH
	MOV 22H, #0H
	MOV R6, #0H
	RET
NIVEL_GOD:
	MOV 23H, #'N'
	MOV 24H, #'I'
	MOV 25H, #'V'
	MOV 26H, #'E'
	MOV 27H, #'L'
	MOV 28H, #' '
	MOV 29H, #'G'
	MOV 2AH, #'O'
	MOV 2BH, #'D'
	MOV 20H, #23H
	MOV 21H, #09H
	MOV 22H, #0H
	MOV R6, #0H
	RET


SEQUENCIA_FACIL:
	MOV 23H, #'2'
	MOV 24H, #'8'
	MOV 25H, #'1'
	MOV 26H, #'2'
	MOV 20H, #23H
	MOV 21H, #04H
	MOV 22H, #06H
	RET
SEQUENCIA_MEDIO:
	MOV 23H, #'2'
	MOV 24H, #'7'
	MOV 25H, #'0'
	MOV 26H, #'1'
	MOV 27H, #'2'
	MOV 28H, #'8'
	MOV 20H, #23H
	MOV 21H, #06H
	MOV 22H, #05H
	RET
SEQUENCIA_DIFICIL:
	MOV 23H, #'1'
	MOV 24H, #'5'
	MOV 25H, #'0'
	MOV 26H, #'7'
	MOV 27H, #'2'
	MOV 28H, #'0'
	MOV 29H, #'2'
	MOV 2AH, #'3'
	MOV 20H, #23H
	MOV 21H, #08H
	MOV 22H, #04H
	RET
SEQUENCIA_GOD:
	MOV 23H, #'9'
	MOV 24H, #'6'
	MOV 25H, #'8'
	MOV 26H, #'8'
	MOV 27H, #'2'
	MOV 28H, #'5'
	MOV 29H, #'3'
	MOV 2AH, #'7'
	MOV 2BH, #'1'
	MOV 2CH, #'4'
	MOV 20H, #23H
	MOV 21H, #0AH
	MOV 22H, #03H
	RET


LIMPAR_DISPLAY:
	MOV 23H, #' '
	MOV 24H, #' '
	MOV 25H, #' '
	MOV 26H, #' '
	MOV 27H, #' '
	MOV 28H, #' '
	MOV 29H, #' '
	MOV 2AH, #' '
	MOV 2BH, #' '
	MOV 2CH, #' '
	MOV 2DH, #' '
	MOV 2EH, #' '
	MOV 2FH, #' '
	MOV 30H, #' '
	MOV 31H, #' '
	MOV 32H, #' '
	MOV 20H, #23H
	MOV 21H, #10H
	MOV 22H, #0H
	RET


READ_SEQUENCIAS:
	MOV R0, 20H
	MOV R1, 21H
	MOV A, 22H
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


;Limpa o display
clearDisplay:
	CLR RS	      ; clear RS - indicates that instruction is being sent to module
	CLR P1.7		; |
	CLR P1.6		; |
	CLR P1.5		; |
	CLR P1.4		; | high nibble set

	SETB EN		; |
	CLR EN		; | negative edge on E

	CLR P1.7		; |
	CLR P1.6		; |
	CLR P1.5		; |
	SETB P1.4		; | low nibble set

	SETB EN		; |
	CLR EN		; | negative edge on E

	CALL delay		; wait for BF to clear
	RET


delay:
	MOV R7, #50
	DJNZ R7, $
	RET
