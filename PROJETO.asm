; --- Mapeamento de Hardware (8051) ---
    RS      equ     P1.3    ;Reg Select ligado em P1.3
    EN      equ     P1.2    ;Enable ligado em P1.2


org 0000h
	LJMP START

org 0050h
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
	MOV 33H, #'B'
	MOV 34H, #'E'
	MOV 35H, #'M'
	MOV 36H, #'-'
	MOV 37H, #'V'
	MOV 38H, #'I'
	MOV 39H, #'N'
	MOV 3AH, #'D'
	MOV 3BH, #'O'
	MOV 30H, #33H
	MOV 31H, #09H
	MOV 32H, #0H
	RET


NIVEL_FACIL:
	MOV 33H, #'N'
	MOV 34H, #'I'
	MOV 35H, #'V'
	MOV 36H, #'E'
	MOV 37H, #'L'
	MOV 38H, #' '
	MOV 39H, #'F'
	MOV 3AH, #'A'
	MOV 3BH, #'C'
	MOV 3CH, #'I'
	MOV 3DH, #'L'
	MOV 30H, #33H
	MOV 31H, #0BH
	MOV 32H, #0H
	MOV R6, #0H
	RET 
NIVEL_MEDIO:
	MOV 33H, #'N'
	MOV 34H, #'I'
	MOV 35H, #'V'
	MOV 36H, #'E'
	MOV 37H, #'L'
	MOV 38H, #' '
	MOV 39H, #'M'
	MOV 3AH, #'E'
	MOV 3BH, #'D'
	MOV 3CH, #'I'
	MOV 3DH, #'O'
	MOV 30H, #33H
	MOV 31H, #0BH
	MOV 32H, #0H
	MOV R6, #0H
	RET
NIVEL_DIFICIL:
	MOV 33H, #'N'
	MOV 34H, #'I'
	MOV 35H, #'V'
	MOV 36H, #'E'
	MOV 37H, #'L'
	MOV 38H, #' '
	MOV 39H, #'D'
	MOV 3AH, #'I'
	MOV 3BH, #'F'
	MOV 3CH, #'I'
	MOV 3DH, #'C'
	MOV 3EH, #'I'
	MOV 3FH, #'L'
	MOV 30H, #33H
	MOV 31H, #0DH
	MOV 32H, #0H
	MOV R6, #0H
	RET
NIVEL_GOD:
	MOV 33H, #'N'
	MOV 34H, #'I'
	MOV 35H, #'V'
	MOV 36H, #'E'
	MOV 37H, #'L'
	MOV 38H, #' '
	MOV 39H, #'G'
	MOV 3AH, #'O'
	MOV 3BH, #'D'
	MOV 30H, #33H
	MOV 31H, #09H
	MOV 32H, #0H
	MOV R6, #0H
	RET


SEQUENCIA_FACIL:
	MOV 33H, #'2'
	MOV 34H, #'8'
	MOV 35H, #'1'
	MOV 36H, #'2'
	MOV 30H, #33H
	MOV 31H, #04H
	MOV 32H, #06H
	RET
SEQUENCIA_MEDIO:
	MOV 33H, #'2'
	MOV 34H, #'7'
	MOV 35H, #'0'
	MOV 36H, #'1'
	MOV 37H, #'2'
	MOV 38H, #'8'
	MOV 30H, #33H
	MOV 31H, #06H
	MOV 32H, #05H
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
	MOV 30H, #33H
	MOV 31H, #08H
	MOV 32H, #04H
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
	MOV 30H, #33H
	MOV 31H, #0AH
	MOV 32H, #03H
	RET


LIMPAR_DISPLAY:
	MOV 33H, #' '
	MOV 34H, #' '
	MOV 35H, #' '
	MOV 36H, #' '
	MOV 37H, #' '
	MOV 38H, #' '
	MOV 39H, #' '
	MOV 3AH, #' '
	MOV 3BH, #' '
	MOV 3CH, #' '
	MOV 3DH, #' '
	MOV 3EH, #' '
	MOV 3FH, #' '
	MOV 40H, #' '
	MOV 41H, #' '
	MOV 42H, #' '
	MOV 30H, #33H
	MOV 31H, #10H
	MOV 32H, #0H
	RET


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
