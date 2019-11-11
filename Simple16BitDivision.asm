;	Simple16BitDivision.asm
;
;	Created: 11/11/2019	1:30:00 PM
;	Author: Logan Wood
;
;   This program is free software: you can redistribute it and/or modify
;   it under the terms of the GNU General Public License as published by
;   the Free Software Foundation, either version 3 of the License, or
;   (at your option) any later version.

;   This program is distributed in the hope that it will be useful,
;   but WITHOUT ANY WARRANTY; without even the implied warranty of
;   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;   GNU General Public License for more details.

;   You should have received a copy of the GNU General Public License
;   along with this program.  If not, see <https://www.gnu.org/licenses/>.

; 16-BIT DIVISION
div16:
	SUB 	numL,denL				;subtract lower denominator byte from lower numerator byte
	SBC 	numH,denH				;subtract (higher denominator byte + C) from higher numerator byte
	BRCS	div16bit_remainder			;if numerator higher byte requires a carry, calculate remainder
	INC	result					;increment result
	RJMP	div16bit				;loop back
div16_remainder:
	MOV		remainder,numL			;copy lower byte of numerator into remainder
	ADD		remainder,denL			;add lower byte of denominator into remainder (throws a carry)
	RET						;return
