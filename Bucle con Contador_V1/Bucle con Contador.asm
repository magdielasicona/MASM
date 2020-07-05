;Programa que muestra como realizar un bucle con contador
.model tiny

.data

.code  

    imprimirDigito MACRO  numero
        MOV     dl, numero      
        ADD     dl, 48
        
        MOV     ah, 02h
        INT     21h
    ENDM
    
    .startup
    
        MOV     cl, 0
        
        bucle:
            imprimirDigito cl
            cmp cl, 9
            je salir
            INC cl
            jmp bucle
   
   
        salir:
            MOV     ax,0c07h
            INT     21h
   
    .exit
    
end