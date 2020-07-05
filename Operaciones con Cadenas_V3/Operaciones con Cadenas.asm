

imprimir MACRO  texto
    MOV     ah,09h
    MOV     dx, offset texto
    INT     21h
ENDM

JMP inicio


msg0    db "Programa para convertir letras minusculas a mayusculas.$"
msg1    db 10,13, "Ingrese una cadena de texto: $"
msg2    db 10,13, "La cadena original es: $"
msg3    db 10,13, "La cadena en Mayusculas es: $"
salto   db 10,13
cadenaO db  20 dup("$")  
cadenaM db  20 dup("$")

inicio:
    imprimir msg0
    imprimir salto
    imprimir msg1
    ;lectura de la cdena de texto
    MOV     ah, 1  ;lectura de caracter por caracter
    XOR     si, si
    
    
    
capturar:
    INT     21h                                                 
    CMP     al, 13 ;comprobando si el registro al es un enter:13
    JZ      resultado
    MOV     cadenaO[si], al
    SUB     al, 32  ;se resta 32 posiciones para convertir a mayuscula
    MOV     cadenaM[si], al
    INC     si
    JMP     capturar
    
    

resultado:
    ;imprimir salto
    imprimir msg2
    imprimir cadenaO 
    ;imprimir salto
    imprimir msg3
    imprimir cadenaM


fin:
    RET