;Programa que captura una cadena y la imprime al reves, la cadena es de longitud definida  
.model small

.stack

.data 
    mensaje1 db "Ingrese la cadena: ","$"
    mensaje2 db 10,13,10,13,"la cadena al reves es: ","$"

.code

    .startup 
    MOV     cx, 5      ;longitud de la cadena a capturar 
    
    MOV     ah, 09h
    MOV     dx, offset mensaje1
    INT     21h
    
    MOV     ah, 01h       ;se va a utilizar la funcion de la int 21h 
    
    
    capturar:
        INT     21h  
        MOV     bl, al
        PUSH    bx
        LOOP    capturar 
    
    MOV     ah, 09h
    MOV     dx, offset mensaje2
    INT     21h    
    
    MOV     cx, 5 
    MOV     ah, 02h
        
    imprimir: 
        POP     dx
        INT     21h
        LOOP    imprimir
        
    
    
    .exit

end