;	Simple16BitDivision.asm
;
;	Created: 11/11/2019	1:30:00 PM
;	Author: Logan Wood

; 16-BIT DIVISION
div16:
	SUB 	numL,denL				;subtract lower denominator byte from lower numerator byte
	SBC 	numH,denH				;subtract (higher denominator byte + C) from higher numerator byte
	BRCS	div16bit_remainder		;if numerator higher byte requires a carry, calculate remainder
	INC		result					;increment result
	RJMP	div16bit				;loop back
div16_remainder:
	MOV		remainder,numL			;copy lower byte of numerator into remainder
	ADD		remainder,denL			;add lower byte of denominator into remainder (throws a carry)
	RET								;return