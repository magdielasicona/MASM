;en este programa se muestra como cambiar la posicion por defecto donde se escribe en consola
;para ello se utiliza una macro, los registros dx= dh:dl y se utiliza la interrupcion 10h
;se puede ver que para para el registro "ah" se llama a la funcion 02h y para el "bh" al 00d
;

.model tiny

.data
  
    texto DB    "hola mundo!!",13,10,"$"
    
.code
    
    imprimir MACRO escribir,x,y
        MOV     dh, x
        MOV     dl, y          
        MOV     bh, 00d        
        MOV     ah, 02h
        INT     10h
        
        MOV     ah,9                                    
        LEA     dx,escribir
        INT     21h
    ENDM
    

    .startup
    
    
    imprimir texto, 0,1
    imprimir texto, 5,2
 
 
    MOV     ax,0c07h
    INT     21h   
    .exit
end