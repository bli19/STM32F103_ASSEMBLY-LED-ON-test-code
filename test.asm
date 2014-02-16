GPIOC_CRL   EQU     0x40011000
GPIOC_CRH   EQU     0x40011004
GPIOC_IDR   EQU     0x40011008
GPIOC_ODR   EQU     0x4001100C
GPIOC_BSRR  EQU     0x40011010
GPIOC_BRR   EQU     0x40011014
GPIOC_LCKR  EQU     0x40011018
STACK_TOP   EQU 0X20002000
	    AREA RESET,CODE,READONLY
       	    DCD STACK_TOP ;MSP 
            DCD start	  ;PC

            AREA    RESET, CODE, READONLY

            ENTRY
start
            	  
    	    LDR   r1, =GPIOC_CRH      ; Address for port c control register
            LDR   r0, [r1]
			STR   r0, [r1]            ; Write to contorl register

            MOV32   r1, #GPIOC_ODR      ; Address for port c output data register
            MOV     r0, #0x0A00         ; Value for port c
            STR     r0, [r1]            ; Write value
loop
            B       loop
            ALIGN
            END
