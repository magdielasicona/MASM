;Programa en el cual se realizara comparaciones con Jumpers
;ver la diferencia de como se imprime un digito y un texto
.model tiny  

.data  

     a: db "Son iguales",13,10,"$"
     b: db "Son diferentes",13,10,"$"

.code  
    
    ;macro que imprime un texto
    imprimirTexto MACRO texto
        MOV     dx, texto 
        
        MOV     ah,9
        INT     21h
    ENDM                       
    
    ;macro que imprime un digito
    imprimirDigito MACRO digito
        MOV     dl, digito
        ADD     dl, 48
        
        MOV     ah, 02h
        INT     21h
    ENDM 

    .startup   
    
        MOV     cx, 3
        CMP     cx, 7    ;compara los valores y le da valores a la etiqueta jumper condicional correspondiente 
         
        ;estas dos etiquetas jumpers verifican si son iguales o diferentes y salta a la etiqueta que le 
        ;corresponde
        je sonIguales
        jne sonDiferentes
        
       sonIguales:
            imprimirTexto a
            jmp salir
       
       sonDiferentes:  
            imprimirTexto b
            jmp salir   ;no es necesario ya que si no entra en iguales va a pasar a diferentes y sigue
                        ;directo a salir
       
       ;etiqueta para finalizar
       salir: 
        MOV     ax, 0c07h
        INT     21h

    .exit

end