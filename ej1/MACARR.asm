INCLUDE MACROS.lib
.MODEL SMALL
.STACK
.DATA
EJ1   db  13,10,'1. a + b + c = $'
EJ2   db  13,10,'2. 2 * b + 3 * (a - c) = $'
EJ3   db  13,10,'3. a * b / c = $'
EJ3RES   db  ', residuo = $'
A    db 8
B    db 3
C    db 5
OPADEC db ?
OPAUNI db ?
OPBDEC db ?
OPBUNI db ?
OPCCOS db ?
OPCRES db ?
.386
.CODE
PROGRAMA:
    MOV AX,@DATA
    MOV DS,AX
    
    OPA A,B,C,OPADEC, OPAUNI
    MOV DX,OFFSET EJ1
    CALL PRINTWORD
    MOV DL,OPADEC
    CALL PRINTNUM
    MOV DL,OPAUNI
    CALL PRINTNUM

    CALL NEWLINE
    
    OPB A,B,C,OPBDEC,OPBUNI
    MOV DX,OFFSET EJ2
    CALL PRINTWORD
    MOV DL,OPBDEC
    CALL PRINTNUM
    MOV DL,OPBUNI
    CALL PRINTNUM

    CALL NEWLINE
    
    OPC A,B,C,OPCCOS,OPBRES
    MOV DX,OFFSET EJ3
    CALL PRINTWORD
    MOV DL,OPCCOS
    CALL PRINTNUM
    MOV DX,OFFSET EJ3RES
    CALL PRINTWORD
    MOV DL,OPCRES
    CALL PRINTNUM
    JMP TERMINAR

    PRINTWORD proc
        MOV ah,09h
        INT 21h
        RET
    PRINTWORD endp
    
    NEWLINE proc 
        MOV DL,10   
        MOV AH,02h
        INT 21h
        RET
    NEWLINE endp
    
    PRINTNUM proc
        MOV AH,02h
        INT 21h
        RET
    PRINTNUM endp 
   
    TERMINAR:
    MOV AH,4CH
    INT 21h
END PROGRAMA
